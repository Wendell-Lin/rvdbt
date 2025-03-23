#include "dbt/execute.h"
#include "dbt/guest/rv32_decode.h"
#include "dbt/guest/rv32_runtime.h"
#include "dbt/mmu.h"
#include <atomic>

#include <immintrin.h>

namespace dbt
{
thread_local CPUState *CPUState::tls_current{};
} // namespace dbt

namespace dbt::rv32
{

static void InsnNotImplemented(insn::Base insn, char const *name)
{
	log_dbt("ILLEGAL OPCODE: %s raw=%08x op=%03x", name, insn.raw, insn.opcode());
}

#define GET_GIP() (gip)
#define SET_GIP(gip_) (gip = gip_)
#define RAISE_TRAP(trapno_)                                                                                  \
	do {                                                                                                 \
		s->ip = GET_GIP();                                                                           \
		s->trapno = trapno_;                                                                         \
		RaiseTrap();                                                                                 \
	} while (0)

#define HANDLER(name)                                                                                        \
	static ALWAYS_INLINE void Impl_##name(CPUState *s, u32 &gip, u8 *vmem, insn::Insn_##name i);         \
	static ALWAYS_INLINE void H_##name(CPUState *state, u32 &gip, u8 *vmem, u32 insn_raw)                \
	{                                                                                                    \
		insn::Insn_##name i{(u32)insn_raw};                                                          \
		static constexpr auto flags = decltype(i)::flags;                                            \
		if constexpr (flags & insn::Flags::Trap || flags & insn::Flags::MayTrap) {                   \
			state->ip = GET_GIP();                                                               \
		}                                                                                            \
		Impl_##name(state, gip, vmem, i);                                                            \
		if constexpr (flags & insn::Flags::HasRd) {                                                  \
			state->gpr[0] = 0;                                                                   \
		}                                                                                            \
		if constexpr (flags & insn::Flags::Branch) {                                                 \
			state->ip = GET_GIP();                                                               \
		} else {                                                                                     \
			gip += 4;                                                                            \
		}                                                                                            \
	}                                                                                                    \
	extern "C" void __attribute__((used)) qcgstub_rv32_##name(CPUState *state, u32 insn_raw)             \
	{                                                                                                    \
		u32 gip = state->ip;                                                                         \
		H_##name(state, gip, mmu::base, insn_raw);                                                   \
		state->ip = gip;                                                                             \
	}                                                                                                    \
	static ALWAYS_INLINE void Impl_##name(CPUState *s, u32 &gip, u8 *vmem, insn::Insn_##name i)

#define HANDLER_BCC(name, type, cond)                                                                        \
	HANDLER(name)                                                                                        \
	{                                                                                                    \
		bool pred = (type)s->gpr[i.rs1()] cond(type) s->gpr[i.rs2()];                                \
		if (!pred) {                                                                                 \
			SET_GIP(GET_GIP() + 4);                                                              \
			return;                                                                              \
		}                                                                                            \
		if (unlikely(i.imm() % 4)) {                                                                 \
			RAISE_TRAP(TrapCode::UNALIGNED_IP);                                                  \
		}                                                                                            \
		SET_GIP(GET_GIP() + i.imm());                                                                \
	}
#define HANDLER_Load(name, type)                                                                             \
	HANDLER(name)                                                                                        \
	{                                                                                                    \
		s->gpr[i.rd()] = unaligned_load<type>(vmem + (s->gpr[i.rs1()] + i.imm()));                   \
	}
#define HANDLER_Store(name, type)                                                                            \
	HANDLER(name)                                                                                        \
	{                                                                                                    \
		unaligned_store<type>(vmem + (s->gpr[i.rs1()] + i.imm()), s->gpr[i.rs2()]);                  \
	}
#define HANDLER_ArithmRR(name, type, op)                                                                     \
	HANDLER(name)                                                                                        \
	{                                                                                                    \
		s->gpr[i.rd()] = (type)s->gpr[i.rs1()] op(type) s->gpr[i.rs2()];                             \
	}
#define HANDLER_ArithmRI(name, type, op)                                                                     \
	HANDLER(name)                                                                                        \
	{                                                                                                    \
		s->gpr[i.rd()] = (type)s->gpr[i.rs1()] op(type) i.imm();                                     \
	}
#define HANDLER_Unimpl(name)                                                                                 \
	HANDLER(name)                                                                                        \
	{                                                                                                    \
		InsnNotImplemented(i, "uniplemented(" #name ")");                                            \
		RAISE_TRAP(TrapCode::ILLEGAL_INSN);                                                          \
	}

HANDLER(ill)
{
	InsnNotImplemented(i, "unknown");
	RAISE_TRAP(TrapCode::ILLEGAL_INSN);
}
HANDLER(lui)
{
	s->gpr[i.rd()] = i.imm();
}
HANDLER(auipc)
{
	s->gpr[i.rd()] = i.imm() + GET_GIP();
}
HANDLER(jal)
{
	if (unlikely(i.imm() % 4)) {
		RAISE_TRAP(TrapCode::UNALIGNED_IP);
	}
	s->gpr[i.rd()] = GET_GIP() + 4;
	SET_GIP(GET_GIP() + i.imm());
}
HANDLER(jalr)
{
	u32 target = (s->gpr[i.rs1()] + i.imm()) & ~(u32)1;
	if (unlikely(target % 4)) {
		RAISE_TRAP(TrapCode::UNALIGNED_IP);
	}
	s->gpr[i.rd()] = GET_GIP() + 4;
	SET_GIP(target);
}
HANDLER_BCC(beq, u32, ==);
HANDLER_BCC(bne, u32, !=);
HANDLER_BCC(blt, i32, <);
HANDLER_BCC(bge, i32, >=);
HANDLER_BCC(bltu, u32, <);
HANDLER_BCC(bgeu, u32, >=);
HANDLER_Load(lb, i8);
HANDLER_Load(lh, i16);
HANDLER_Load(lw, i32);
HANDLER_Load(lbu, u8);
HANDLER_Load(lhu, u16);
HANDLER_Store(sw, u32);
HANDLER_Store(sb, u8);
HANDLER_Store(sh, u16);
HANDLER_ArithmRI(addi, u32, +);
HANDLER_ArithmRI(slti, i32, <);
HANDLER_ArithmRI(sltiu, u32, <);
HANDLER_ArithmRI(xori, u32, ^);
HANDLER_ArithmRI(ori, u32, |);
HANDLER_ArithmRI(andi, u32, &);
HANDLER(slli)
{
	s->gpr[i.rd()] = (u32)s->gpr[i.rs1()] << i.imm();
}
HANDLER(srai)
{
	s->gpr[i.rd()] = (i32)s->gpr[i.rs1()] >> i.imm();
}
HANDLER(srli)
{
	s->gpr[i.rd()] = (u32)s->gpr[i.rs1()] >> i.imm();
}
HANDLER_ArithmRR(sub, u32, -);
HANDLER_ArithmRR(add, u32, +);
HANDLER(sll)
{
	s->gpr[i.rd()] = (u32)s->gpr[i.rs1()] << (s->gpr[i.rs2()] & 31);
}
HANDLER_ArithmRR(slt, i32, <);
HANDLER_ArithmRR(sltu, u32, <);
HANDLER_ArithmRR(xor, u32, ^);
HANDLER(sra)
{
	s->gpr[i.rd()] = (i32)s->gpr[i.rs1()] >> (s->gpr[i.rs2()] & 31);
}
HANDLER(srl)
{
	s->gpr[i.rd()] = (u32)s->gpr[i.rs1()] >> (s->gpr[i.rs2()] & 31);
}
HANDLER_ArithmRR(or, u32, |);
HANDLER_ArithmRR(and, u32, &);
HANDLER(fence) {}
HANDLER(fencei) {}
HANDLER(ecall)
{
	RAISE_TRAP(TrapCode::ECALL);
	RaiseTrap();
}
HANDLER(ebreak)
{
	RAISE_TRAP(TrapCode::EBREAK);
	RaiseTrap();
}

// TODO: real atomics implementation, alignment checks
template <typename H>
static ALWAYS_INLINE void ApplyInsnA(CPUState *s, u8 *vmem, insn::A i)
{
	switch (i.rlaq()) {
	case 0b00:
		H().template operator()<std::memory_order_relaxed>(s, vmem, i);
		break;
	case 0b01:
		H().template operator()<std::memory_order_release>(s, vmem, i);
		break;
	case 0b10:
		H().template operator()<std::memory_order_acquire>(s, vmem, i);
		break;
	case 0b11:
		H().template operator()<std::memory_order_acq_rel>(s, vmem, i);
		break;
	default:
		unreachable("");
	}
}

HANDLER(lrw)
{
	// TODO: start transaction
	auto h = []<std::memory_order MO>(CPUState *s, u8 *vmem, insn::A i) {
		auto a = std::atomic_ref(*(u32 *)(vmem + s->gpr[i.rs1()]));
		s->gpr[i.rd()] = a.load(MO);
	};
	ApplyInsnA<decltype(h)>(s, vmem, i);
}
HANDLER(scw)
{
	auto h = []<std::memory_order MO>(CPUState *s, u8 *vmem, insn::A i) {
		auto a = std::atomic_ref(*(u32 *)(vmem + s->gpr[i.rs1()]));
		a.store(s->gpr[i.rs2()], MO);
		s->gpr[i.rd()] = 0;
	};
	ApplyInsnA<decltype(h)>(s, vmem, i);
}
HANDLER(amoswapw)
{
	auto h = []<std::memory_order MO>(CPUState *s, u8 *vmem, insn::A i) {
		auto a = std::atomic_ref(*(u32 *)(vmem + s->gpr[i.rs1()]));
		s->gpr[i.rd()] = a.exchange(s->gpr[i.rs2()], MO);
	};
	ApplyInsnA<decltype(h)>(s, vmem, i);
}
HANDLER(amoaddw)
{
	auto h = []<std::memory_order MO>(CPUState *s, u8 *vmem, insn::A i) {
		auto a = std::atomic_ref(*(u32 *)(vmem + s->gpr[i.rs1()]));
		s->gpr[i.rd()] = a.fetch_add(s->gpr[i.rs2()], MO);
	};
	ApplyInsnA<decltype(h)>(s, vmem, i);
}
HANDLER_Unimpl(amoxorw);
HANDLER_Unimpl(amoandw);
HANDLER_Unimpl(amoorw);
HANDLER_Unimpl(amominw);
HANDLER_Unimpl(amomaxw);
HANDLER_Unimpl(amominuw);
HANDLER(amomaxuw)
{
	auto h = []<std::memory_order MO>(CPUState *s, u8 *vmem, insn::A i) {
		auto a = std::atomic_ref(*(u32 *)(vmem + s->gpr[i.rs1()]));
		u32 cur = a.load(MO);
		u32 rhs = s->gpr[i.rs2()];
		while (!a.compare_exchange_weak(cur, std::max(cur, rhs), MO))
			;
	};
	ApplyInsnA<decltype(h)>(s, vmem, i);
}

HANDLER(mul)
{
	// Lower 32 bits of signed multiplication
	s->gpr[i.rd()] = (u32)((i64)s->gpr[i.rs1()] * (i64)s->gpr[i.rs2()]);

}
HANDLER(mulh)
{
	// Upper 32 bits of signed × signed
	// althought the s->gpr is u32, the value it store maybe negative, so we need to cast it to signed int32 first
	s->gpr[i.rd()] = (u32)(((i64)(i32)s->gpr[i.rs1()] * (i64)(i32)s->gpr[i.rs2()]) >> 32);
}
HANDLER(mulhsu)
{
	// Upper 32 bits of signed × unsigned
	s->gpr[i.rd()] = (u32)(((i64)(i32)s->gpr[i.rs1()] * s->gpr[i.rs2()]) >> 32);
}
HANDLER(mulhu)
{
	// Upper 32 bits of unsigned × unsigned
	s->gpr[i.rd()] = (u32)(((u64)s->gpr[i.rs1()] * (u64)s->gpr[i.rs2()]) >> 32);
}
HANDLER(div) 
{
	if (s->gpr[i.rs2()] == 0) {
		s->gpr[i.rd()] = 0xFFFFFFFF;  // Division by zero
	} else if ((i32)s->gpr[i.rs1()] == INT32_MIN && (i32)s->gpr[i.rs2()] == -1) {
		s->gpr[i.rd()] = INT32_MIN;   // Overflow case
	} else {
		s->gpr[i.rd()] = (i32)s->gpr[i.rs1()] / (i32)s->gpr[i.rs2()];
	}
}
HANDLER(divu)
{
	if (s->gpr[i.rs2()] == 0) {
		s->gpr[i.rd()] = 0xFFFFFFFF;
	} else {
		s->gpr[i.rd()] = s->gpr[i.rs1()] / s->gpr[i.rs2()];
	}
}
HANDLER(rem)
{
	if (s->gpr[i.rs2()] == 0) {
		s->gpr[i.rd()] = s->gpr[i.rs1()];  // Return dividend if divisor is zero
	} else if ((i32)s->gpr[i.rs1()] == INT32_MIN && (i32)s->gpr[i.rs2()] == -1) {
		s->gpr[i.rd()] = 0;   // Overflow case
	} else {
		s->gpr[i.rd()] = (i32)s->gpr[i.rs1()] % (i32)s->gpr[i.rs2()];
	}
}
HANDLER(remu)
{
	if (s->gpr[i.rs2()] == 0) {
		s->gpr[i.rd()] = s->gpr[i.rs1()];  // Return dividend if divisor is zero
	} else {
		s->gpr[i.rd()] = (u32)s->gpr[i.rs1()] % (u32)s->gpr[i.rs2()];
	}
}
HANDLER(csrrw)
{
	u16 csr_addr = i.csr();
	u32 old_value = s->csr[csr_addr];
	
	// If rd != x0, read old value
	if (i.rd() != 0) {
		s->gpr[i.rd()] = old_value;
	}
	
	// Write new value from rs1
	s->csr[csr_addr] = s->gpr[i.rs1()];
}
HANDLER(csrrs)
{
	u16 csr_addr = i.csr();
	u32 old_value = s->csr[csr_addr];
	s->gpr[i.rd()] = old_value;  // Always read
	
	// Only write if rs1 != x0
	if (i.rs1() != 0) {
		// Set bits specified by rs1
		s->csr[csr_addr] = old_value | s->gpr[i.rs1()];
	}
}
HANDLER(csrrc)
{
	u16 csr_addr = i.csr();
	u32 old_value = s->csr[csr_addr];
	s->gpr[i.rd()] = old_value;  // Always read
	
	// Only write if rs1 != x0
	if (i.rs1() != 0) {
		// Clear bits specified by rs1
		s->csr[csr_addr] = old_value & ~s->gpr[i.rs1()];
	}
}
HANDLER(csrrwi)
{
	u16 csr_addr = i.csr();
	// If rd != x0, read old value
	if (i.rd() != 0) {
		s->gpr[i.rd()] = s->csr[csr_addr];
	}
	
	// Write immediate value (zero-extended 5-bit value)
	s->csr[csr_addr] = i.zimm();  // rs1 field contains the immediate
}
HANDLER(csrrsi)
{
	u16 csr_addr = i.csr();
	u32 old_value = s->csr[csr_addr];
	s->gpr[i.rd()] = old_value;  // Always read
	
	// Only write if immediate != 0
	if (i.zimm() != 0) {  // rs1 field contains the immediate
		// Set bits specified by immediate
		s->csr[csr_addr] = old_value | i.zimm();
	}
}
HANDLER(csrrci)
{
	u16 csr_addr = i.csr();
	u32 old_value = s->csr[csr_addr];
	s->gpr[i.rd()] = old_value;  // Always read
	
	// Only write if immediate != 0
	if (i.zimm() != 0) {  // rs1 field contains the immediate
		// Clear bits specified by immediate
		s->csr[csr_addr] = old_value & ~i.zimm();
	}
}
HANDLER(mret)
{
	// TODO: real mret implementation
}

void Interpreter::Execute(CPUState *state)
{
	u8 *vmem = mmu::base;
	u32 gip = state->ip;
	void *insn_ptr;

#ifdef DBT_DUMP_TRACE
entry:
	u32 icount = 0;
	state->ip = gip;
	state->DumpTrace("entry");
#define XDUMP(name)                                                                                          \
	do {                                                                                                 \
		if (++icount == TB_MAX_INSNS || !(gip & ~mmu::PAGE_MASK) ||                                  \
		    (insn::Insn_##name::flags & insn::Flags::Branch))                                        \
			goto entry;                                                                          \
	} while (0)
#else
#define XDUMP(name)
#endif

#ifdef DBT_DUMP_TRACE_VERBOSE
#define TRACE_INSN()                                                                                         \
	state->ip = gip;                                                                                     \
	state->DumpTrace("insn")
#else
#define TRACE_INSN()
#endif

	goto dispatch;

	static constexpr void *loc_gotos[] = {
#define OP(name, format_, flags_) [(u8)insn::Op::_##name] = &&Lab_##name,
	    RV32_OPCODE_LIST()
#undef OP
	};
#define OP(name, format_, flags_)                                                                            \
	Lab_##name:                                                                                          \
	{                                                                                                    \
		TRACE_INSN();                                                                                \
		H_##name(state, gip, vmem, *(u32 *)insn_ptr);                                                \
		XDUMP(name);                                                                                 \
		goto dispatch;                                                                               \
	}
	RV32_OPCODE_LIST()
#undef OP

dispatch:
	//
	{
		insn_ptr = vmem + gip;
		using decoder = insn::Decoder<insn::Op>;
		goto *loc_gotos[(u8)decoder::Decode(insn_ptr)];
	}
}

} // namespace dbt::rv32