#include "dbt/qmc/llvmgen/llvmgen.h"
#include "dbt/guest/rv32_cpu.h"
#include "dbt/qmc/qcg/jitabi.h"
#include "dbt/qmc/qir_printer.h"

#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/MDBuilder.h"
#include "llvm/IR/Verifier.h"
#include <llvm-15/llvm/IR/IntrinsicInst.h>

namespace dbt::qir
{

LLVMGen::LLVMGen(llvm::LLVMContext *context_, llvm::Module *cmodule_, CodeSegment *segment_)
    : ctx(context_), cmodule(cmodule_), segment(segment_)
{
	auto voidty = llvm::Type::getVoidTy(*ctx);
	auto ptrty = llvm::PointerType::get(*ctx, 0);
	auto i8ptrty = llvm::Type::getInt8PtrTy(*ctx);
	auto i32ty = llvm::Type::getInt32Ty(*ctx);

	qcg_ftype = llvm::FunctionType::get(voidty, {i8ptrty, i8ptrty}, false);
	qcg_gbr_patchpoint_ftype = llvm::FunctionType::get(voidty, {i8ptrty, i8ptrty, ptrty}, false);
	qcg_stub_brind_ftype =
	    llvm::FunctionType::get(llvm::PointerType::getUnqual(qcg_ftype), {i8ptrty, i32ty}, false);

	qcg_helper_ftype = llvm::FunctionType::get(voidty, {i8ptrty, i32ty}, false);

	brind_cache_entry_ty = llvm::StructType::create(*ctx, {i32ty, ptrty}, "BrindCacheEntry");

	auto mdb = llvm::MDBuilder(*ctx);

	md_unlikely = mdb.createBranchWeights(1, 12);

	auto md_adomain = mdb.createAliasScopeDomain("alias_global_domain");
	md_astate = mdb.createAliasScope("alias_state", md_adomain);
	md_avmem = mdb.createAliasScope("alias_vmem", md_adomain);
	md_aother = mdb.createAliasScope("alias_other", md_adomain);
}

void LLVMGen::AddFunction(u32 region_ip)
{
	auto name = MakeAotSymbol(region_ip);
	func = cmodule->getFunction(name);
	if (func) {
		return;
	}

	func = llvm::Function::Create(qcg_ftype, llvm::Function::ExternalLinkage, name, cmodule);
	func->setDSOLocal(true);
	func->setCallingConv(llvm::CallingConv::GHC);
	func->getArg(0)->addAttr(llvm::Attribute::NoAlias);
	func->getArg(1)->addAttr(llvm::Attribute::NoAlias);

	func->getArg(0)->setName("state");
	func->getArg(1)->setName("membase");
}

llvm::Function *LLVMGen::Run(qir::Region *region, u32 region_ip)
{
	func = cmodule->getFunction(MakeAotSymbol(region_ip));
	assert(func);
	statev = func->getArg(0);
	membasev = func->getArg(1);

	auto lirb = llvm::IRBuilder<>(llvm::BasicBlock::Create(*ctx, "entry", func));
	lb = &lirb;
	// EmitTrace();

	CreateVGPRLocs(region->GetVRegsInfo());

	id2bb.clear();
	for (auto &bb : region->GetBlocks()) {
		auto id = bb.GetId();
		auto *lbb = llvm::BasicBlock::Create(*ctx, "bb." + std::to_string(bb.GetId()), func);
		if (id == 0) { // TODO: set first bb in qir
			lb->CreateBr(lbb);
		}
		id2bb.insert({id, lbb});
	}

	for (auto &bb : region->GetBlocks()) {
		auto lbb = id2bb.find(bb.GetId())->second;
		lb->SetInsertPoint(lbb);
		qbb = &bb;

		auto &ilist = bb.ilist;
		for (auto iit = ilist.begin(); iit != ilist.end(); ++iit) {
			Visitor(this).visit(&*iit);
		}
	}
	assert(!verifyFunction(*func, &llvm::errs()));
	return func;
}

void LLVMGen::CreateVGPRLocs(qir::VRegsInfo *vinfo)
{
	vlocs.clear();
	vlocs_nglobals = vinfo->NumGlobals();

	for (RegN i = 0; i < vlocs_nglobals; ++i) {
		auto *info = vinfo->GetGlobalInfo(i);
		auto state_ep = MakeStateEP(info->type, info->state_offs);
		state_ep->setName(std::string("@") + info->name);
		vlocs.push_back(state_ep);
	}

	for (RegN i = vlocs_nglobals; i < vinfo->NumAll(); ++i) {
		auto type = vinfo->GetLocalType(i);
		auto name = "%" + std::to_string(i);
		auto state_ep = lb->CreateAlloca(MakeType(type), constv<32>(VTypeToSize(type)), name);
		vlocs.push_back(state_ep);
	}
}

llvm::Type *LLVMGen::MakeType(VType type)
{
	switch (type) {
	case VType::I8:
		return lb->getInt8Ty();
	case VType::I16:
		return lb->getInt16Ty();
	case VType::I32:
		return lb->getInt32Ty();
	default:
		unreachable("");
	}
}

llvm::Type *LLVMGen::MakePtrType(VType type)
{
	switch (type) {
	case VType::I8:
		return llvm::Type::getInt8PtrTy(*ctx);
	case VType::I16:
		return llvm::Type::getInt16PtrTy(*ctx);
	case VType::I32:
		return llvm::Type::getInt32PtrTy(*ctx);
	default:
		unreachable("");
	}
}

llvm::Instruction *LLVMGen::AScopeState(llvm::Instruction *inst)
{
	auto scope = llvm::MDNode::get(*ctx, md_astate);
	auto noalias = llvm::MDNode::get(*ctx, {md_avmem, md_aother});

	inst->setMetadata(llvm::LLVMContext::MD_alias_scope, scope);
	inst->setMetadata(llvm::LLVMContext::MD_noalias, noalias);
	return inst;
}

llvm::Instruction *LLVMGen::AScopeVMem(llvm::Instruction *inst)
{
	auto scope = llvm::MDNode::get(*ctx, md_avmem);
	auto noalias = llvm::MDNode::get(*ctx, {md_astate, md_aother});

	inst->setMetadata(llvm::LLVMContext::MD_alias_scope, scope);
	inst->setMetadata(llvm::LLVMContext::MD_noalias, noalias);
	return inst;
}

llvm::Instruction *LLVMGen::AScopeOther(llvm::Instruction *inst)
{
	auto scope = llvm::MDNode::get(*ctx, md_aother);
	auto noalias = llvm::MDNode::get(*ctx, {md_astate, md_avmem});

	inst->setMetadata(llvm::LLVMContext::MD_alias_scope, scope);
	inst->setMetadata(llvm::LLVMContext::MD_noalias, noalias);
	return inst;
}

llvm::Value *LLVMGen::MakeRStub(RuntimeStubId id, llvm::FunctionType *ftype)
{
	auto fp_type = llvm::PointerType::getUnqual(ftype);

	auto state_ep = MakeStateEP(llvm::PointerType::getUnqual(fp_type),
				    offsetof(CPUState, stub_tab) + RuntimeStubTab::offs(id));

	return AScopeState(
	    lb->CreateAlignedLoad(fp_type, state_ep, llvm::Align(alignof(uptr)), GetRuntimeStubName(id)));
}

llvm::Value *LLVMGen::LoadVOperand(qir::VOperand op)
{
	auto type = op.GetType();
	if (op.IsConst()) {
		return MakeConst(op.GetType(), op.GetConst());
	}
	auto [state_ep, is_global] = MakeVOperandEP(op);
	auto load = lb->CreateAlignedLoad(MakeType(type), state_ep, llvm::Align(VTypeToSize(type)));
	if (is_global) {
		AScopeState(load);
	}
	return load;
}

void LLVMGen::StoreVOperand(qir::VOperand op, llvm::Value *val)
{
	auto type = op.GetType();
	auto [state_ep, is_global] = MakeVOperandEP(op);
	auto store = lb->CreateAlignedStore(val, state_ep, llvm::Align(VTypeToSize(type)));
	if (is_global) {
		AScopeState(store);
	}
}

std::pair<llvm::Value *, bool> LLVMGen::MakeVOperandEP(VOperand op)
{
	assert(!op.IsConst());
	if (op.IsVGPR()) {
		return std::make_pair(vlocs[op.GetVGPR()], op.GetVGPR() < vlocs_nglobals);
	}
	if (op.IsGSlot()) {
		return std::make_pair(MakeStateEP(op.GetType(), op.GetSlotOffs()), true);
	}
	unreachable("");
}

llvm::Value *LLVMGen::MakeStateEP(llvm::Type *type, u32 offs)
{
	auto ep = lb->CreateConstInBoundsGEP1_32(lb->getInt8Ty(), statev, offs);
	return lb->CreateBitCast(ep, type);
}

llvm::Value *LLVMGen::MakeStateEP(VType type, u32 offs)
{
	return MakeStateEP(MakePtrType(type), offs);
}

llvm::Value *LLVMGen::MakeVMemLoc(VType type, llvm::Value *addr)
{
	addr = lb->CreateZExt(addr, lb->getIntPtrTy(cmodule->getDataLayout()));
	llvm::Value *ep;
	if constexpr (config::zero_membase) {
		return lb->CreateIntToPtr(addr, MakePtrType(type));
	} else {
		ep = lb->CreateGEP(lb->getInt8Ty(), membasev, addr);
		return lb->CreateBitCast(ep, MakePtrType(type));
	}
}

llvm::ConstantInt *LLVMGen::MakeConst(VType type, u64 val)
{
	return llvm::ConstantInt::get(*ctx, llvm::APInt(VTypeToSize(type) * 8, val));
}

llvm::CmpInst::Predicate LLVMGen::MakeCC(CondCode cc)
{
	switch (cc) {
	case CondCode::EQ:
		return llvm::CmpInst::Predicate::ICMP_EQ;
	case CondCode::NE:
		return llvm::CmpInst::Predicate::ICMP_NE;
	case CondCode::LE:
		return llvm::CmpInst::Predicate::ICMP_SLE;
	case CondCode::LT:
		return llvm::CmpInst::Predicate::ICMP_SLT;
	case CondCode::GE:
		return llvm::CmpInst::Predicate::ICMP_SGE;
	case CondCode::GT:
		return llvm::CmpInst::Predicate::ICMP_SGT;
	case CondCode::LEU:
		return llvm::CmpInst::Predicate::ICMP_ULE;
	case CondCode::LTU:
		return llvm::CmpInst::Predicate::ICMP_ULT;
	case CondCode::GEU:
		return llvm::CmpInst::Predicate::ICMP_UGE;
	case CondCode::GTU:
		return llvm::CmpInst::Predicate::ICMP_UGT;
	default:
		unreachable("");
	}
}

llvm::BasicBlock *LLVMGen::MapBB(Block *bb)
{
	return id2bb.find(bb->GetId())->second;
}

void LLVMGen::EmitTrace()
{
	auto qcg_trace_type = llvm::FunctionType::get(lb->getVoidTy(), {lb->getInt8PtrTy()}, false);
	lb->CreateCall(qcg_trace_type, MakeRStub(RuntimeStubId::id_trace, qcg_trace_type), {statev});
}

void LLVMGen::Emit_hcall(qir::InstHcall *ins)
{
	lb->CreateCall(qcg_helper_ftype, MakeRStub(ins->stub, qcg_helper_ftype),
		       {statev, LoadVOperand(ins->i(0))});
	if (--qbb->ilist.end() == ins) {
		lb->CreateRetVoid();
	}
}

void LLVMGen::Emit_br(qir::InstBr *ins)
{
	auto qbb_s = qbb->GetSuccs().at(0);

	lb->CreateBr(MapBB(qbb_s));
}

void LLVMGen::Emit_brcc(qir::InstBrcc *ins)
{
	auto lhs = LoadVOperand(ins->i(0));
	auto rhs = LoadVOperand(ins->i(1));
	auto cmp = lb->CreateCmp(MakeCC(ins->cc), lhs, rhs);

	auto bb_t = MapBB(qbb->GetSuccs().at(0));
	auto bb_f = MapBB(qbb->GetSuccs().at(1));

	lb->CreateCondBr(cmp, bb_t, bb_f, md_unlikely);
}

#if 0
// Experiments with llvm.patchpoint-like intrinsics as qcg gbrind patchpoint
// llvm doesn't support tailcalls for experimental.patchpoint, actual call is not expanded until
// MCInstLowering. The same applies to gc.statepoint
//
// llvm corrupts ghccc Sp in MFs with stackmap, even if stackmap records no values
// I applied this in SelectionDAGBuilder for stackmaps with no liveins:
// + FuncInfo.MF->getFrameInfo().setHasStackMap(CI.arg_size() > 2);
// and the same for patchpoints
void LLVMGen::Emit_gbr(qir::InstGBr *ins)
{
	// Relocation is not necessary, also would overwrite patchpoint data, avoid
#if 1
	std::array<llvm::Value *, 7> args = {const64(ins->tpc.GetConst()),
					     const32(3 + sizeof(jitabi::ppoint::BranchSlot)),
					     llvm::ConstantPointerNull::get(lb->getInt8PtrTy()),
					     // fake_callee,
					     const32(3), statev, membasev};

	auto intr = lb->CreateIntrinsic(llvm::Intrinsic::experimental_patchpoint_void, {}, args);
	intr->addFnAttr(llvm::Attribute::NoReturn);
	intr->setCallingConv(llvm::CallingConv::GHC);
	intr->setTailCall(true);
	// intr->setTailCallKind(llvm::CallInst::TCK_MustTail);
	lb->CreateRetVoid();
#else
	auto stackmap = lb->CreateIntrinsic(
	    llvm::Intrinsic::experimental_stackmap, {},
	    {const64(ins->tpc.GetConst()), const32(3 + sizeof(jitabi::ppoint::BranchSlot))});
	stackmap->setCallingConv(llvm::CallingConv::GHC);
	stackmap->setTailCall(true);
#endif
	// auto call = lb->CreateCall(qcg_ftype, fake_callee, {statev, membasev});
	// call->addFnAttr(llvm::Attribute::NoReturn);
	// call->setCallingConv(llvm::CallingConv::GHC);
	// call->setTailCall(true);
	// call->setTailCallKind(llvm::CallInst::TCK_MustTail);
	// lb->CreateRetVoid();
}
#endif

void LLVMGen::CreateQCGFnCall(llvm::Value *fn)
{
	auto call = lb->CreateCall(qcg_ftype, fn, {statev, membasev});
	call->addFnAttr(llvm::Attribute::NoReturn);
	call->setCallingConv(llvm::CallingConv::GHC);
	call->setTailCall(true);
	call->setTailCallKind(llvm::CallInst::TCK_MustTail);
	lb->CreateRetVoid();
}

static std::string MakeAsmString(std::span<u8> const &data)
{
	std::string hstr;
	hstr.reserve(data.size() * 4 + 16);
	char const *hexdig_str = "0123456789abcdef";

	for (size_t i = 0; i < data.size(); ++i) {
		hstr += '\\';
		hstr += 'x';
		hstr += hexdig_str[(data[i] >> 4) & 0xf];
		hstr += hexdig_str[data[i] & 0xf];
	}
	return hstr;
}

static std::string MakeGbrPatchpoint(u32 gip, bool cross_segment)
{
	thread_local auto slot = ([]() {
		std::array<u8, sizeof(jitabi::ppoint::BranchSlot)> fake_payload;
		auto slot = std::bit_cast<jitabi::ppoint::BranchSlot>(fake_payload);
		slot.LinkLazyLLVMAOT(offsetof(CPUState, stub_tab));
		return slot;
	})();
	slot.gip = gip;
	slot.flags.cross_segment = cross_segment;

	return ".string \"" + MakeAsmString({(u8 *)&slot, sizeof(slot)}) + "\"";
}

void LLVMGen::Emit_gbr(qir::InstGBr *ins)
{
	auto gip = ins->tpc.GetConst();
	if (auto tgtfn = cmodule->getFunction(MakeAotSymbol(gip)); tgtfn) {
		// TODO: segment check?
		// TODO(tuning): prevent inlining?
		CreateQCGFnCall(tgtfn);
	} else {
		// llvm.sponentry - crashes with my llvm build
		// llvm.frameaddress - enforces frame creation in contradiction to ghccc
		auto entrysp =
		    lb->CreateIntrinsic(llvm::Intrinsic::addressofreturnaddress, {lb->getPtrTy()}, {});

		auto code_str = MakeGbrPatchpoint(gip, !segment->InSegment(gip));
		char const *constraint = "{r13},{rbp},{rsp},~{memory},~{dirflag},~{fpsr},~{flags}";
		auto asmp = llvm::InlineAsm::get(qcg_gbr_patchpoint_ftype, code_str, constraint, true, false);
		auto call = lb->CreateCall(asmp, {statev, membasev, entrysp});
		call->setTailCall(true);
		call->setDoesNotReturn();
		lb->CreateRetVoid();
	}
}

void LLVMGen::Emit_gbrind(qir::InstGBrind *ins)
{
	auto gipv = LoadVOperand(ins->i(0));

	auto slowp_bb = llvm::BasicBlock::Create(*ctx);
	auto fastp_bb = llvm::BasicBlock::Create(*ctx);
	slowp_bb->insertInto(func);
	fastp_bb->insertInto(func);

	llvm::Value *entry_ep;
	{
		auto cache_ep = MakeStateEP(lb->getPtrTy(), offsetof(CPUState, l1_brind_cache));
		auto cachev = lb->CreateAlignedLoad(lb->getPtrTy(), cache_ep, llvm::Align(alignof(uptr)));
		AScopeState(cachev);

		llvm::Value *hashv = lb->CreateLShr(gipv, constv<32>(2));
		hashv = lb->CreateAnd(hashv, constv<32>((1ull << tcache::L1_CACHE_BITS) - 1));

		entry_ep = lb->CreateInBoundsGEP(brind_cache_entry_ty, cachev, hashv);
		auto entry_gip_ep = lb->CreateStructGEP(brind_cache_entry_ty, entry_ep, 0);
		auto entry_gipv =
		    lb->CreateAlignedLoad(lb->getInt32Ty(), entry_gip_ep, llvm::Align(alignof(u32)));
		AScopeOther(entry_gipv);

		lb->CreateCondBr(lb->CreateICmpNE(entry_gipv, gipv), slowp_bb, fastp_bb, md_unlikely);
	}

	{
		lb->SetInsertPoint(fastp_bb);

		auto entry_code_ep = lb->CreateStructGEP(brind_cache_entry_ty, entry_ep, 1);
		auto entry_codev =
		    lb->CreateAlignedLoad(lb->getPtrTy(), entry_code_ep, llvm::Align(alignof(uptr)));
		AScopeOther(entry_codev);

		CreateQCGFnCall(entry_codev);
	}

	{
		lb->SetInsertPoint(slowp_bb);
		auto target =
		    lb->CreateCall(qcg_stub_brind_ftype,
				   MakeRStub(RuntimeStubId::id_brind, qcg_stub_brind_ftype), {statev, gipv});
		CreateQCGFnCall(target);
	}
}

void LLVMGen::Emit_vmload(qir::InstVMLoad *ins)
{
	// TODO: resolve types mess
	// TODO: alignment in qir
	llvm::MaybeAlign align = true ? llvm::MaybeAlign{} : llvm::Align(VTypeToSize(ins->sz));
	auto mem_ep = MakeVMemLoc(ins->sz, LoadVOperand(ins->i(0)));
	llvm::Value *val = AScopeVMem(lb->CreateAlignedLoad(MakeType(ins->sz), mem_ep, align));
	auto type = ins->o(0).GetType();
	if (type != ins->sz) {
		if (ins->sgn == VSign::S) {
			val = lb->CreateSExt(val, MakeType(type));
		} else {
			val = lb->CreateZExt(val, MakeType(type));
		}
	}
	StoreVOperand(ins->o(0), val);
}

void LLVMGen::Emit_vmstore(qir::InstVMStore *ins)
{
	auto val = LoadVOperand(ins->i(1));
	auto type = ins->i(1).GetType();
	if (type != ins->sz) {
		val = lb->CreateTrunc(val, MakeType(type));
	}
	llvm::MaybeAlign align = true ? llvm::MaybeAlign{} : llvm::Align(VTypeToSize(ins->sz));
	auto mem_ep = MakeVMemLoc(ins->sz, LoadVOperand(ins->i(0)));
	AScopeVMem(lb->CreateAlignedStore(val, mem_ep, align));
}

void LLVMGen::Emit_setcc(qir::InstSetcc *ins)
{
	auto cmp = lb->CreateICmp(MakeCC(ins->cc), LoadVOperand(ins->i(0)), LoadVOperand(ins->i(1)));
	StoreVOperand(ins->o(0), lb->CreateZExt(cmp, lb->getInt32Ty()));
}

void LLVMGen::Emit_mov(qir::InstUnop *ins)
{
	auto val = LoadVOperand(ins->i(0));
	StoreVOperand(ins->o(0), val);
}

void LLVMGen::EmitBinop(llvm::Instruction::BinaryOps opc, qir::InstBinop *ins)
{
	auto res = lb->CreateBinOp(opc, LoadVOperand(ins->i(0)), LoadVOperand(ins->i(1)));
	StoreVOperand(ins->o(0), res);
}

void LLVMGen::Emit_add(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::Add, ins);
}

void LLVMGen::Emit_sub(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::Sub, ins);
}

void LLVMGen::Emit_and(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::And, ins);
}

void LLVMGen::Emit_or(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::Or, ins);
}

void LLVMGen::Emit_xor(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::Xor, ins);
}

void LLVMGen::Emit_sra(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::AShr, ins);
}

void LLVMGen::Emit_srl(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::LShr, ins);
}

void LLVMGen::Emit_sll(qir::InstBinop *ins)
{
	EmitBinop(llvm::Instruction::BinaryOps::Shl, ins);
}

} // namespace dbt::qir
