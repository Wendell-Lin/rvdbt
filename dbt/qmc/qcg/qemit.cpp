#include "dbt/qmc/qcg/qemit.h"
#include "dbt/guest/rv32_cpu.h"
#include "dbt/execute.h"

namespace dbt::qcg
{

QEmit::QEmit(qir::Region *region, CompilerRuntime *cruntime_, qir::CodeSegment *segment_, bool is_leaf_)
    : cruntime(cruntime_), segment(segment_), jit_mode(!cruntime->AllowsRelocation()), is_leaf(is_leaf_)
{
	spillframe_sp_offs = sizeof(uptr) * (is_leaf ? 1 : 2);

	if (jcode.init(jrt.environment())) {
		Panic();
	}
	jcode.attach(j._emitter());
	j.setErrorHandler(&jerr);
	jcode.setErrorHandler(&jerr);

	u32 n_labels = region->GetNumBlocks();
	labels.reserve(n_labels);
	for (u32 i = 0; i < n_labels; ++i) {
		labels.push_back(j.newLabel());
	}
}

std::span<u8> QEmit::EmitCode()
{
	jcode.flatten();
	jcode.resolveUnresolvedLinks();

	size_t code_sz = jcode.codeSize();
	void *code_ptr = cruntime->AllocateCode(code_sz, 8);
	if (code_ptr == nullptr) {
		Panic();
	}

	jcode.relocateToBase((uptr)code_ptr);
	jcode.copyFlattenedData(code_ptr, code_sz);
	code_sz = jcode.codeSize();
	return {(u8 *)code_ptr, code_sz};
}

void QEmit::DumpCode(std::span<u8> const &code)
{
	if (log_qcg.enabled()) {
		auto str = MakeHexStr(code.data(), code.size());
		log_qcg.write(str.c_str());
	}
}

static inline asmjit::x86::Gp make_gpr(qir::RegN pr, qir::VType type)
{
	switch (type) {
	case qir::VType::I8:
		return asmjit::x86::gpb(pr);
	case qir::VType::I16:
		return asmjit::x86::gpw(pr);
	case qir::VType::I32:
		return asmjit::x86::gpd(pr);
	default:
		unreachable("");
	}
}

static inline asmjit::x86::Gp make_gpr(qir::VOperand opr)
{
	return make_gpr(opr.GetPGPR(), opr.GetType());
}

static inline asmjit::Imm make_imm(qir::VOperand opr)
{
	return asmjit::imm(opr.GetConst());
}

inline asmjit::x86::Mem QEmit::make_slot(qir::VOperand opr)
{
	auto size = VTypeToSize(opr.GetType());
	auto offs = opr.GetSlotOffs();
	asmjit::x86::Gp base;
	if (opr.IsLSlot()) {
		base = QEmit::R_SP;
		offs += spillframe_sp_offs;
	} else {
		base = QEmit::R_STATE;
	}
	return asmjit::x86::Mem(base, offs, size);
}

inline asmjit::Operand QEmit::make_operand(qir::VOperand opr)
{
	if (likely(opr.IsGPR())) {
		return make_gpr(opr);
	}
	if (opr.IsConst()) {
		return make_imm(opr);
	}
	return make_slot(opr);
}

inline asmjit::Operand QEmit::make_stubcall_target(RuntimeStubId stub)
{
	if (jit_mode) {
		return asmjit::imm(stub_tab[stub]);
	}
	return asmjit::x86::Mem(R_STATE, offsetof(CPUState, stub_tab) + RuntimeStubTab::offs(stub));
}

static inline asmjit::x86::CondCode make_cc(qir::CondCode cc)
{
	switch (cc) {
	case qir::CondCode::EQ:
		return asmjit::x86::CondCode::kEqual;
	case qir::CondCode::NE:
		return asmjit::x86::CondCode::kNotEqual;
	case qir::CondCode::LE:
		return asmjit::x86::CondCode::kSignedLE;
	case qir::CondCode::LT:
		return asmjit::x86::CondCode::kSignedLT;
	case qir::CondCode::GE:
		return asmjit::x86::CondCode::kSignedGE;
	case qir::CondCode::GT:
		return asmjit::x86::CondCode::kSignedGT;
	case qir::CondCode::LEU:
		return asmjit::x86::CondCode::kUnsignedLE;
	case qir::CondCode::LTU:
		return asmjit::x86::CondCode::kUnsignedLT;
	case qir::CondCode::GEU:
		return asmjit::x86::CondCode::kUnsignedGE;
	case qir::CondCode::GTU:
		return asmjit::x86::CondCode::kUnsignedGT;
	default:
		unreachable("");
	}
}

void QEmit::FrameSetup()
{
	if (!is_leaf) {
		// Push something to satisfy x86 frame alignment
		j.push(asmjit::x86::rcx);
	}
}

void QEmit::FrameDestroy()
{
	if (!is_leaf) {
		j.pop(asmjit::x86::rcx);
	}
}

void QEmit::Prologue(u32 ip)
{
	// j.int3();
	_entry_ip = ip;
	FrameSetup();
}

void QEmit::StateFill(qir::RegN p, qir::VType type, u16 offs)
{
	auto slot = asmjit::x86::ptr(R_STATE, offs);
	slot.setSize(VTypeToSize(type));
	j.mov(make_gpr(p, type), slot);
}

void QEmit::StateSpill(qir::RegN p, qir::VType type, u16 offs)
{
	auto slot = asmjit::x86::ptr(R_STATE, offs);
	slot.setSize(VTypeToSize(type));
	j.mov(slot, make_gpr(p, type));
}

void QEmit::LocFill(qir::RegN p, qir::VType type, u16 offs)
{
	auto slot = asmjit::x86::ptr(R_SP, offs);
	slot.setSize(VTypeToSize(type));
	j.mov(make_gpr(p, type), slot);
}

void QEmit::LocSpill(qir::RegN p, qir::VType type, u16 offs)
{
	auto slot = asmjit::x86::ptr(R_SP, offs);
	slot.setSize(VTypeToSize(type));
	j.mov(slot, make_gpr(p, type));
}

void QEmit::Emit_hcall(qir::InstHcall *ins)
{
	assert(!is_leaf);
	j.mov(asmjit::x86::rdi, R_STATE);
	j.emit(asmjit::x86::Inst::kIdMov, asmjit::x86::rsi, make_operand(ins->i(0)));
	j.emit(asmjit::x86::Inst::kIdCall, make_stubcall_target(ins->stub));
}

void QEmit::Emit_Cache()
{
	auto tmp0 = asmjit::x86::rdi;
	auto tmp1 = asmjit::x86::rsi;	
	auto tmp2 = asmjit::x86::r12;
	log_qcg("Emit_brcc: %08x", _entry_ip);
	j.mov(tmp0.r64(), R_STATE);
	j.mov(tmp1.r64(), asmjit::Imm(_entry_ip)); // move jump target to tmp0
	j.lea(tmp1.r32(), asmjit::x86::ptr(0, tmp1.r64(), 2)); // tmp1 = (f_id << 2)
	j.and_(tmp1.r32(), ((1ull << tcache::L1_CACHE_BITS) - 1) << 4); // tmp1 = (f_id & ((1 << L1_CACHE_BITS) - 1)) << 4

	if (jit_mode) {
		j.mov(tmp2.r64(), (uptr)tcache::cache_tb_exec_count.data());
	} else {
		j.mov(tmp2.r64(), asmjit::x86::Mem(R_STATE, offsetof(CPUState, cache_tb_exec_count)));
	}
	j.mov(tmp2.r64(), asmjit::x86::ptr(tmp2.r64(), tmp1.r64(), 0, offsetof(tcache::CacheTbExecCountEntry, tb)));
	j.inc(asmjit::x86::qword_ptr(tmp2.r64(), offsetof(TBlock, flags) + 8));
}

void QEmit::Emit_br(qir::InstBr *ins)
{
	auto bb_s = bb->GetSuccs().at(0);
	auto bb_ff = &*++bb->getIter();

	Emit_Cache();

	if (bb_s != bb_ff) {
		j.jmp(labels[bb_s->GetId()]);
	}
}

void QEmit::Emit_brcc(qir::InstBrcc *ins)
{
	log_dbt("Emit_brcc: %08x", _entry_ip);
	auto bb_t = bb->GetSuccs().at(0);
	auto bb_f = bb->GetSuccs().at(1);
	auto bb_ff = &*++bb->getIter();

	auto &vs0 = ins->i(0);
	auto &vs1 = ins->i(1);

	// constfolded
	if (vs0.IsConst()) {
		std::swap(vs0, vs1);
		ins->cc = qir::SwapCC(ins->cc);
	}
	auto cc = ins->cc;

	j.emit(asmjit::x86::Inst::kIdCmp, make_operand(vs0), make_operand(vs1));
	auto jcc = asmjit::x86::Inst::jccFromCond(make_cc(cc));
	// j.emit(jcc, labels[bb_t->GetId()]);
	auto jump_bb_t= j.newLabel();
	auto end = j.newLabel();
	j.emit(jcc, jump_bb_t);

	if (bb_f != bb_ff) {
		Emit_Cache();
		j.jmp(labels[bb_f->GetId()]);
	}
	j.jmp(end);
	j.bind(jump_bb_t);
	Emit_Cache();
	j.jmp(labels[bb_t->GetId()]);

	j.bind(end);
}

void QEmit::Emit_gbr(qir::InstGBr *ins)
{
	FrameDestroy();
	static constexpr size_t patch_size = sizeof(jitabi::ppoint::BranchSlot);
	j.embedUInt8(0, patch_size);
	auto *slot = (jitabi::ppoint::BranchSlot *)(j.bufferPtr() - patch_size);
	slot->gip = ins->tpc.GetConst();
	slot->flags.cross_segment = !segment->InSegment(slot->gip);
	if (jit_mode) {
		slot->LinkLazyJIT();
	} else {
		slot->LinkLazyAOT(offsetof(CPUState, stub_tab));
	}
}

void QEmit::Emit_gbrind(qir::InstGBrind *ins)
{
	auto ptgt = make_gpr(ins->i(0));
	assert(ptgt.id() == asmjit::x86::Gp::kIdSi);

	auto slowpath = j.newLabel();
	// if constexpr (false)
	{
		// commented the original 
		// Inlined l1_brind_cache lookup
		auto tmp0 = asmjit::x86::rdi;
		auto tmp1 = asmjit::x86::rdx;
		auto tmp2 = asmjit::x86::r12;
		// auto tmp1 = asmjit::x86::r12;
		// auto tmp2 = asmjit::x86::r14;

		if (jit_mode) {
			j.mov(tmp1.r64(), (uptr)tcache::l1_brind_cache.data());
		} else {
			j.mov(tmp1.r64(), asmjit::x86::Mem(R_STATE, offsetof(CPUState, l1_brind_cache)));
		}

		static_assert(sizeof(tcache::BrindCacheEntry) == 16); // the size has been changed to count number of executions.
		static_assert(offsetof(tcache::BrindCacheEntry, gip) == 0);

		j.lea(tmp0.r32(), asmjit::x86::ptr(0, ptgt.r64(), 2));
		j.and_(tmp0.r32(), ((1ull << tcache::L1_CACHE_BITS) - 1) << 4);
	
		j.cmp(asmjit::x86::ptr(tmp1.r64(), tmp0.r64(), 0, 0, sizeof(u32)), ptgt.r32());
		j.jne(slowpath);

		FrameDestroy();
		if (jit_mode) {
			j.mov(tmp2.r64(), (uptr)tcache::cache_tb_exec_count.data());
		} else {
			j.mov(tmp2.r64(), asmjit::x86::Mem(R_STATE, offsetof(CPUState, cache_tb_exec_count)));
		}
		j.mov(tmp2.r64(), asmjit::x86::ptr(tmp2.r64(), tmp0.r64(), 0, offsetof(tcache::BrindCacheEntry, code)));
		// todo: this 8 is computed from the size of the flags to exec count, should be changed to another offsetof.
        j.inc(asmjit::x86::qword_ptr(tmp2.r64(), offsetof(TBlock, flags) + 8));

		j.jmp(asmjit::x86::ptr(tmp1.r64(), tmp0.r64(), 0, offsetof(tcache::BrindCacheEntry, code),
				       sizeof(u64)));
	}

	j.bind(slowpath);

	j.mov(asmjit::x86::gpq(asmjit::x86::Gp::kIdDi), R_STATE);

	// Allow call in leaf procedure and setup frame in slowpath
	if (is_leaf) {
		j.push(asmjit::x86::rcx);
	}

	j.emit(asmjit::x86::Inst::kIdCall, make_stubcall_target(RuntimeStubId::id_brind));

	if (is_leaf) {
		j.pop(asmjit::x86::rcx);
	} else {
		FrameDestroy();
	}
	j.jmp(asmjit::x86::rax);
}

// set size manually
static inline asmjit::x86::Mem make_vmem(qir::VOperand vbase)
{
	if constexpr (config::zero_membase) {
		if (likely(vbase.IsPGPR())) {
			return asmjit::x86::ptr(make_gpr(vbase));
		} else {
			return asmjit::x86::ptr(vbase.GetConst());
		}
	} else {
		if (likely(vbase.IsPGPR())) {
			return asmjit::x86::ptr(QEmit::R_MEMBASE, make_gpr(vbase));
		} else {
			return asmjit::x86::ptr(QEmit::R_MEMBASE, vbase.GetConst());
		}
	}
}

void QEmit::Emit_vmload(qir::InstVMLoad *ins)
{
	// j.emit(asmjit::x86::Inst::kIdCall, make_stubcall_target(RuntimeStubId::id_trace));
	auto &vrd = ins->o(0);
	auto &vbase = ins->i(0);
	auto sgn = ins->sgn;

	auto prd = make_gpr(vrd);
	auto mem = make_vmem(vbase);

	assert(vrd.GetType() == qir::VType::I32);
	switch (ins->sz) {
	case qir::VType::I8:
		mem.setSize(1);
		if (sgn == qir::VSign::U) {
			j.movzx(prd, mem);
		} else {
			j.movsx(prd, mem);
		}
		mem.addOffset(1);
		break;
	case qir::VType::I16:
		mem.setSize(2);
		if (sgn == qir::VSign::U) {
			j.movzx(prd, mem);
		} else {
			j.movsx(prd, mem);
		}
		mem.addOffset(2);
		break;
	case qir::VType::I32:
		mem.setSize(4);
		j.mov(prd, mem);
		mem.addOffset(4);
		break;
	default:
		unreachable("");
	};
}

void QEmit::Emit_vmstore(qir::InstVMStore *ins)
{
	// j.emit(asmjit::x86::Inst::kIdCall, make_stubcall_target(RuntimeStubId::id_trace));
	auto &vbase = ins->i(0);
	auto &vdata = ins->i(1);

	auto pdata = make_operand(vdata);
	auto mem = make_vmem(vbase);

	assert(ins->sgn == qir::VSign::U);
	mem.setSize(VTypeToSize(ins->sz));
	j.emit(asmjit::x86::Inst::kIdMov, mem, pdata);
	mem.addOffset(VTypeToSize(ins->sz));
}

void QEmit::Emit_vmload2(qir::InstVMLoad2 *ins)
{
	auto prd1 = make_gpr(ins->o(0));
	auto prd2 = make_gpr(ins->o(1));
	auto vbase = ins->i(0);

	auto mem = make_vmem(vbase);
	mem.setSize(8);
	j.movsd(asmjit::x86::xmm0, mem);
	j.movd(prd1, asmjit::x86::xmm0);
	j.pextrd(prd2, asmjit::x86::xmm0, 1);
}

void QEmit::Emit_vmload4(qir::InstVMLoad4 *ins)
{
	auto prd1 = make_gpr(ins->o(0));
	auto prd2 = make_gpr(ins->o(1));
	auto prd3 = make_gpr(ins->o(2));
	auto prd4 = make_gpr(ins->o(3));

	auto mem = make_vmem(ins->i(0));
	mem.setSize(16);
	j.movdqu(asmjit::x86::xmm0, mem);
	j.movd(prd1, asmjit::x86::xmm0);
	j.pextrd(prd2, asmjit::x86::xmm0, 1);
	j.pextrd(prd3, asmjit::x86::xmm0, 2);
	j.pextrd(prd4, asmjit::x86::xmm0, 3);
}

void QEmit::Emit_vmstore2(qir::InstVMStore2 *ins)
{
	auto &vbase = ins->i(0);
	auto &vdata1 = ins->i(1);
	auto &vdata2 = ins->i(2);

	auto pdata1 = make_gpr(vdata1);
	auto pdata2 = make_gpr(vdata2);
	auto mem = make_vmem(vbase);
	mem.setSize(8);
	j.movd(asmjit::x86::xmm0, pdata1);
	j.pinsrd(asmjit::x86::xmm0, pdata2, 1);
	j.movsd(mem, asmjit::x86::xmm0);
}

void QEmit::Emit_vmstore4(qir::InstVMStore4 *ins)
{
	auto &vbase = ins->i(0);
	auto &vdata1 = ins->i(1);
	auto &vdata2 = ins->i(2);
	auto &vdata3 = ins->i(3);
	auto &vdata4 = ins->i(4);

	auto pdata1 = make_gpr(vdata1);
	auto pdata2 = make_gpr(vdata2);
	auto pdata3 = make_gpr(vdata3);
	auto pdata4 = make_gpr(vdata4);
	auto mem = make_vmem(vbase);
	mem.setSize(16);
	j.movd(asmjit::x86::xmm0, pdata1);
	j.pinsrd(asmjit::x86::xmm0, pdata2, 1);
	j.pinsrd(asmjit::x86::xmm0, pdata3, 2);
	j.pinsrd(asmjit::x86::xmm0, pdata4, 3);
	j.movdqu(mem, asmjit::x86::xmm0);
}

void QEmit::Emit_setcc(qir::InstSetcc *ins)
{
	auto prd = make_gpr(ins->o(0));
	auto vs0 = ins->i(0);
	auto vs1 = ins->i(1);
	auto cc = ins->cc;

	bool dst_aliased = vs0.GetPGPR() == prd.id() || (vs1.IsPGPR() && vs1.GetPGPR() == prd.id());

	if (!dst_aliased) {
		j.xor_(prd, prd);
	}

	j.emit(asmjit::x86::Inst::kIdCmp, make_operand(vs0), make_operand(vs1));
	auto setcc = asmjit::x86::Inst::setccFromCond(make_cc(cc));
	j.emit(setcc, prd.r8());

	if (dst_aliased) {
		j.movzx(prd, prd.r8());
	}
}

void QEmit::Emit_mov(qir::InstUnop *ins)
{
	auto vrd = ins->o(0);
	auto vs0 = ins->i(0);
	// TODO: slowed code by ~3%, try again after bb merging
	if (unlikely(false && vs0.IsConst() && vs0.GetConst() == 0 && vrd.IsPGPR())) {
		auto prd = make_gpr(vrd);
		j.emit(asmjit::x86::Inst::kIdXor, prd, prd);
		return;
	}
	j.emit(asmjit::x86::Inst::kIdMov, make_operand(vrd), make_operand(vs0));
}

template <asmjit::x86::Inst::Id Op>
ALWAYS_INLINE void QEmit::EmitInstBinop(qir::InstBinop *ins)
{
	auto &vrd = ins->o(0);
	[[maybe_unused]] auto vs0 = ins->i(0);
	auto vs1 = ins->i(1);

	assert(vrd.GetPGPR() == vs0.GetPGPR());
	j.emit(Op, make_gpr(vrd), make_operand(vs1));
}

void QEmit::Emit_add(qir::InstBinop *ins)
{
	EmitInstBinop<asmjit::x86::Inst::kIdAdd>(ins);
}

void QEmit::Emit_sub(qir::InstBinop *ins)
{
	EmitInstBinop<asmjit::x86::Inst::kIdSub>(ins);
}

void QEmit::Emit_and(qir::InstBinop *ins)
{
	EmitInstBinop<asmjit::x86::Inst::kIdAnd>(ins);
}

void QEmit::Emit_or(qir::InstBinop *ins)
{
	EmitInstBinop<asmjit::x86::Inst::kIdOr>(ins);
}

void QEmit::Emit_xor(qir::InstBinop *ins)
{
	EmitInstBinop<asmjit::x86::Inst::kIdXor>(ins);
}

void QEmit::Emit_sra(qir::InstBinop *ins)
{
	[[maybe_unused]] auto vs1 = ins->i(1);
	assert(vs1.IsConst() || vs1.GetPGPR() == asmjit::x86::Gp::kIdCx);
	EmitInstBinop<asmjit::x86::Inst::kIdSar>(ins);
}

void QEmit::Emit_srl(qir::InstBinop *ins)
{
	[[maybe_unused]] auto vs1 = ins->i(1);
	assert(vs1.IsConst() || vs1.GetPGPR() == asmjit::x86::Gp::kIdCx);
	EmitInstBinop<asmjit::x86::Inst::kIdShr>(ins);
}

void QEmit::Emit_sll(qir::InstBinop *ins)
{
	[[maybe_unused]] auto vs1 = ins->i(1);
	assert(vs1.IsConst() || vs1.GetPGPR() == asmjit::x86::Gp::kIdCx);
	EmitInstBinop<asmjit::x86::Inst::kIdShl>(ins);
}

// Regular multiplication (lower word)
void QEmit::Emit_mul(qir::InstBinop *ins)
{
	EmitInstBinop<asmjit::x86::Inst::kIdImul>(ins);
}

// Signed high multiplication
void QEmit::Emit_mulh(qir::InstBinop *ins)
{
	// Signed high multiplication - use 64-bit IMUL and arithmetic shift
	// j.emit(asmjit::x86::Inst::kIdImul, make_gpr(ins->o(0)), make_gpr(ins->i(0)), make_gpr(ins->i(1)));

	auto prd = make_gpr(ins->o(0));
    auto prs0 = make_gpr(ins->i(0)); //r
    auto prs1 = make_gpr(ins->i(1)); //bx

	assert(prs1.id() == asmjit::x86::Gp::kIdBx);
	auto eax = asmjit::x86::eax;
	auto edx = asmjit::x86::edx;
	j.mov(eax, prs0);
	j.imul(prs1);
	j.mov(prd, edx);
}

// Mixed signed/unsigned high multiplication
void QEmit::Emit_mulhsu(qir::InstBinop *ins)
{
	auto prd = make_gpr(ins->o(0));
    auto prs0 = make_gpr(ins->i(0)); //r
    auto prs1 = make_gpr(ins->i(1)); //bx

	assert(prs1.id() == asmjit::x86::Gp::kIdBx);
	auto eax = asmjit::x86::eax;
	auto rax = asmjit::x86::rax;
	auto rbx = asmjit::x86::rbx;
	auto edx = asmjit::x86::edx;
	j.mov(prd, edx);
	j.mov(eax, prs0);
	j.movsxd(rax, eax);
	j.mul(rbx);
	j.sar(rax, 32);
	j.mov(edx, prd);
	j.mov(prd, eax);
}
// Unsigned high multiplication
void QEmit::Emit_mulhu(qir::InstBinop *ins)
{
	// j.emit(asmjit::x86::Inst::kIdMul, make_gpr(ins->o(0)), make_gpr(ins->i(0)), make_gpr(ins->i(1)));

	auto prd = make_gpr(ins->o(0));
    auto prs0 = make_gpr(ins->i(0)); //r
    auto prs1 = make_gpr(ins->i(1)); //bx

	assert(prs1.id() == asmjit::x86::Gp::kIdBx);
	auto eax = asmjit::x86::eax;
	auto edx = asmjit::x86::edx;
	j.mov(eax, prs0);
	j.mul(prs1);
	j.mov(prd, edx);
}

// Signed division
void QEmit::Emit_div(qir::InstBinop *ins)
{
    auto prs0 = make_gpr(ins->i(0));
    auto prs1 = make_gpr(ins->i(1));
    auto prd = make_gpr(ins->o(0));
    auto end = j.newLabel();
	auto div = j.newLabel();

    // Check division by zero
	j.mov(prd, asmjit::Imm(0xFFFFFFFF));
	j.test(prs1, prs1);
    j.jz(end);  // If zero, use 0xFFFFFFFF already in prd
    
    // Check INT32_MIN / -1 overflow case
    j.cmp(prs0, INT32_MIN);
    j.jne(div);  // If not INT32_MIN, do normal division
    j.cmp(prs1, -1);
    j.jne(div);  // If not -1, do normal division
    j.mov(prd, INT32_MIN);
    j.jmp(end);

    // Normal division
    j.bind(div);
	j.mov(asmjit::x86::eax, prs0);
	j.cdq();
    j.idiv(prs1);
	j.mov(prd, asmjit::x86::eax);
    
    j.bind(end);
}

// Unsigned division
void QEmit::Emit_divu(qir::InstBinop *ins)
{
    // Check for division by zero
	auto prs0 = make_gpr(ins->i(0));
	auto prs1 = make_gpr(ins->i(1));
	auto prd = make_gpr(ins->o(0));
	j.mov(prd, asmjit::Imm(0xFFFFFFFF));
	j.test(prs1, prs1);
	asmjit::Label zero = j.newLabel();
	j.jz(zero);

	j.xor_(asmjit::x86::edx, asmjit::x86::edx);  // Clear high bits	
	j.mov(asmjit::x86::eax, prs0);
    j.div(prs1);  // Do unsigned division
    j.mov(prd, asmjit::x86::eax);  // Move result
	
	j.bind(zero);
}

// Signed remainder
void QEmit::Emit_rem(qir::InstBinop *ins)
{
	auto prs0 = make_gpr(ins->i(0));
	auto prs1 = make_gpr(ins->i(1));
	auto prd = make_gpr(ins->o(0));
	asmjit::Label end = j.newLabel();
	asmjit::Label rem = j.newLabel();
	j.mov(prd, prs0);
	j.test(prs1, prs1);
	j.jz(end);

	j.cmp(prs0, INT32_MIN);
    j.jne(rem);  // If not INT32_MIN, do normal division
    j.cmp(prs1, -1);
    j.jne(rem);  // If not -1, do normal division
    j.mov(prd, 0);
    j.jmp(end);

	j.bind(rem);
	j.mov(asmjit::x86::eax, prs0);
	j.cdq();
    j.idiv(prs1);  // Do signed division
    j.mov(prd, asmjit::x86::edx);  // Move result
	
	j.bind(end);
}

// Unsigned remainder
void QEmit::Emit_remu(qir::InstBinop *ins)
{
	auto prs0 = make_gpr(ins->i(0));
	auto prs1 = make_gpr(ins->i(1));
	auto prd = make_gpr(ins->o(0));
	j.mov(prd, prs0);
	j.test(prs1, prs1);
	asmjit::Label zero = j.newLabel();
	j.jz(zero);

	j.xor_(asmjit::x86::edx, asmjit::x86::edx);  // Clear high bits	
	j.mov(asmjit::x86::eax, prs0);
    j.div(prs1);  // Do unsigned division
    j.mov(prd, asmjit::x86::edx);  // Move result
	
	j.bind(zero);
}

} // namespace dbt::qcg
