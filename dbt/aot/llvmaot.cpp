#include "dbt/aot/aot.h"
#include "dbt/guest/rv32_cpu.h"
#include "dbt/qmc/llvmgen/llvmgen.h"
#include "dbt/qmc/qcg/jitabi.h"
#include "dbt/tcache/objprof.h"

#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Verifier.h"
#include "llvm/TargetParser/SubtargetFeature.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetIntrinsicInfo.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"

namespace dbt
{
LOG_STREAM(aot)

struct LLVMAOTCompilerRuntime final : CompilerRuntime {
	LLVMAOTCompilerRuntime() {}

	void *AllocateCode(size_t sz, uint align) override
	{
		unreachable("");
	}

	bool AllowsRelocation() const override
	{
		unreachable("");
	}

	void *AnnounceRegion(u32 ip, std::span<u8> const &code) override
	{
		unreachable("");
	}
};

u64 getMaxExecCountInRegion(std::vector<dbt::ModuleGraphNode *> const &region)
{
	u64 mx_cnt = 0;
	for (auto const &n : region) {
		if (n->flags.exec_count > mx_cnt) {
			mx_cnt = n->flags.exec_count;
		}
	}
	return mx_cnt;
}

static void DeclareKnownRegionEntries(qir::LLVMGenCtx *ctx, objprof::PageData const &page, u64 threshold)
{
	u32 const page_vaddr = page.pageno << mmu::PAGE_BITS;
	qir::CodeSegment segment(page_vaddr, mmu::PAGE_SIZE);

	for (u32 idx = 0; idx < page.executed.size(); ++idx) {
		// if (!page.executed[idx]) 
		if (!page.executed[idx] || page.exec_count[idx] < threshold)
		{
			continue;
		}
		if (page.brind_target[idx] || page.segment_entry[idx]) {
			u32 ip = page_vaddr + objprof::PageData::idx2po(idx);
			ctx->AddFunction(ip, segment);
		}
	}
}

static void LLVMAOTTranslatePage(qir::LLVMGenCtx *ctx, std::vector<AOTSymbol> *aot_symbols,
				 objprof::PageData const &page, u64 threshold)
{
	auto mg = BuildModuleGraph(page);
	auto regions = mg.ComputeRegions();

	for (auto const &r : regions) {
		if (getMaxExecCountInRegion(r) < threshold)
			continue;
		ctx->AddFunction(r[0]->ip, mg.segment);
	}

	for (auto const &r : regions) {
		assert(r[0]->flags.region_entry);
		if (getMaxExecCountInRegion(r) < threshold)
			continue;
		log_aot("Compiling region with 1st ip: %x", r[0]->ip);
		qir::CompilerJob::IpRangesSet ipranges;
		for (auto n : r) {
			ipranges.push_back({n->ip, n->ip_end});
		}

		auto aotrt = LLVMAOTCompilerRuntime{};

		qir::CompilerJob job(&aotrt, (uptr)mmu::base, mg.segment, std::move(ipranges));

		auto arena = MemArena(1_MB);
		auto *region = qir::CompilerGenRegionIR(&arena, job);

		auto entry_ip = r[0]->ip;
		qir::QIRToLLVM llvm_gen(*ctx, &mg.segment, region, entry_ip);
		llvm_gen.Run();
		aot_symbols->push_back({entry_ip, 0});
	}
}

static void AddAOTTabSection(llvm::Module &cmodule, std::vector<AOTSymbol> &aot_symbols)
{
	size_t aottab_size = sizeof(AOTTabHeader) + sizeof(aot_symbols[0]) * aot_symbols.size();
	auto type = llvm::ArrayType::get(llvm::Type::getInt8Ty(cmodule.getContext()), aottab_size);
	auto zeroinit = llvm::ConstantAggregateZero::get(type);
	auto aottab = new llvm::GlobalVariable(cmodule, type, true, llvm::GlobalVariable::ExternalLinkage,
					       zeroinit, AOT_SYM_AOTTAB);

	aottab->setAlignment(llvm::Align(alignof(AOTTabHeader)));
	aottab->setSection(".aottab");
}

static llvm::TargetMachine *GetAOTTargetMachine()
{
	static auto machine = ([]() {
		auto ttriple = llvm::sys::getProcessTriple();
		llvm::InitializeNativeTarget();
		llvm::InitializeNativeTargetAsmPrinter();
		llvm::InitializeNativeTargetAsmParser();
		std::string error;
		auto target = llvm::TargetRegistry::lookupTarget(ttriple, error);
		if (!target) {
			Panic(error);
		}

		llvm::SubtargetFeatures features;
		{
			for (const auto &[Feature, Enabled] : llvm::sys::getHostCPUFeatures())
				features.AddFeature(Feature, Enabled);
		}

		llvm::TargetOptions opt;
		auto RM = llvm::Reloc::Model(llvm::Reloc::PIC_);
		auto host_cpu = llvm::sys::getHostCPUName();
		return target->createTargetMachine(ttriple, host_cpu, features.getString(), opt, RM, {},
						   llvm::CodeGenOptLevel::Aggressive);
	})();

	return machine;
}

static void GenerateObjectFile(llvm::Module *cmodule, std::string const &filename)
{
	auto tmachine = GetAOTTargetMachine();
	cmodule->setDataLayout(tmachine->createDataLayout());
	cmodule->setTargetTriple(tmachine->getTargetTriple().str());
	cmodule->setPICLevel(llvm::PICLevel::SmallPIC);

	std::error_code errc;
	llvm::raw_fd_ostream dest(filename, errc, llvm::sys::fs::OF_None);

	if (errc) {
		llvm::errs() << "can't open file: " << errc.message();
		Panic();
	}

	llvm::legacy::PassManager pass;
	auto FileType = llvm::CodeGenFileType::ObjectFile;

	if (tmachine->addPassesToEmitFile(pass, dest, nullptr, FileType)) {
		llvm::errs() << "emit objfile failed";
		Panic();
	}

	pass.run(*cmodule);
	dest.flush();
}

void LLVMAOTCompileELF(u64 threshold, char optLevel)
{
	auto cmodule = llvm::Module("qcg_module", qir::g_llvm_ctx);
	qir::LLVMGenCtx ctx(&cmodule);

	std::vector<AOTSymbol> aot_symbols;
	aot_symbols.reserve(64_KB);
	for (auto const &page : objprof::GetProfile()) {
		DeclareKnownRegionEntries(&ctx, page, threshold);
	}
	for (auto const &page : objprof::GetProfile()) {
		LLVMAOTTranslatePage(&ctx, &aot_symbols, page, threshold);
	}
	assert(!verifyModule(cmodule, &llvm::errs()));

	llvm::LoopAnalysisManager lam;
	llvm::FunctionAnalysisManager fam;
	llvm::CGSCCAnalysisManager cgam;
	llvm::ModuleAnalysisManager mam;

	llvm::PassBuilder pb;
	pb.registerModuleAnalyses(mam);
	pb.registerCGSCCAnalyses(cgam);
	pb.registerFunctionAnalyses(fam);
	pb.registerLoopAnalyses(lam);
	pb.crossRegisterProxies(lam, fam, cgam, mam);

	auto optlevel = llvm::OptimizationLevel::O3;

	llvm::ModulePassManager mpm_final_expand;
	mpm_final_expand.addPass(
	    llvm::createModuleToFunctionPassAdaptor(qir::IntrinsicExpansionPass(ctx, true)));
	if constexpr (config::debug) {
		mpm_final_expand.addPass(llvm::VerifierPass());
	}

	pb.registerOptimizerEarlyEPCallback([&](
		llvm::ModulePassManager &mpm, llvm::OptimizationLevel optl
		, llvm::ThinOrFullLTOPhase phase // this line is for llvm 20, for 19 or below, plz comment this parameter
		) {
		mpm.addPass(llvm::createModuleToFunctionPassAdaptor(qir::IntrinsicExpansionPass(ctx, false)));
		if constexpr (config::debug) {
			mpm.addPass(llvm::VerifierPass());
		}
	});

	static constexpr uint n_expands = 4;

	for (int i = 0; i < n_expands; ++i) {
		if (i == n_expands - 1) {
			log_aot("Run final expansion pipeline");
			mpm_final_expand.run(cmodule, mam);
		}
		log_aot("Run optimize+expand pipeline");
		// TODO: something breaks, invalidating all analyses dont help, create pipeline again
		llvm::ModulePassManager mpm = pb.buildPerModuleDefaultPipeline(optlevel);
		mpm.run(cmodule, mam);
	}

	// cmodule.print(llvm::errs(), nullptr);
	AddAOTTabSection(cmodule, aot_symbols);

	auto obj_path = objprof::GetCachePath(AOT_O_EXTENSION);
	GenerateObjectFile(&cmodule, obj_path);
	// ProcessLLVMStackmaps(aot_symbols);
	log_aot("Number of symbols: %zu", aot_symbols.size());
	LinkAOTObject(aot_symbols);
}

} // namespace dbt
