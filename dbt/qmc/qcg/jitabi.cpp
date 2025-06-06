#include "dbt/qmc/qcg/jitabi.h"
#include "dbt/execute.h"
#include "dbt/qmc/qcg/arch_traits.h"
#include "dbt/tcache/tcache.h"

namespace dbt::jitabi
{

struct _RetPair {
	void *v0;
	void *v1;
};

#define HELPER extern "C" NOINLINE __attribute__((used))
#define HELPER_ASM extern "C" NOINLINE __attribute__((used, naked))

/*    qmc qcg/llvm frame layout, grows down
 *
 *			| ....		|  Execution loop
 *	trampoline call +---------------+-----------------------
 *			| link+fp|saved |  qcg spill frame, created in trampoline
 *			+---------------+  no callee saved regs expected
 *			| qcg locals	|  returning to this frame is not allowed
 *  	       tailcall +---------------+-----------------------
 *			| link+pad  	|  Translated region frame
 *			+---------------|  Destroyed on branch to next region
 *			| llvm locals	|  qcg/ghccc callconv doesn't preserve fp
 *   abs/qcg-reloc call +---------------+-----------------------
 *			| ....		|  qcgstub_* frame
 */

static_assert((qcg::ArchTraits::spillframe_size & 15) == 0);
static_assert(qcg::ArchTraits::STATE == asmjit::x86::Gp::kIdR13);
static_assert(qcg::ArchTraits::MEMBASE == asmjit::x86::Gp::kIdBp);

// Build qcg spillframe and enter translated code
HELPER_ASM ppoint::BranchSlot *trampoline_to_jit(CPUState *state, void *vmem, void *tc_ptr)
{
	asm("pushq	%rbp\n\t"
	    "pushq	%rbx\n\t"
	    "pushq	%r12\n\t"
	    "pushq	%r13\n\t"
	    "pushq	%r14\n\t"
	    "pushq	%r15\n\t"
	    "movq 	%rdi, %r13\n\t"	  // STATE
	    "movq	%rsi, %rbp\n\t"); // MEMBASE
	asm("sub     	$%c0, %%rsp\n\t" : : "i"(qcg::ArchTraits::spillframe_size + 8));
	asm("leaq	-8(%rsp), %rsi\n\t"); // sp of qcg tailcall frame
	asm("movq	%%rsi, %c0(%%r13)\n\t" : : "i"(offsetof(CPUState, sp_unwindptr)));
	asm("callq	*%rdx\n\t" // tc_ptr
	    "int	$3");	   // use escape/raise stub instead
}

// Escape from translated code, forward rax(slot) to caller
HELPER_ASM void qcgstub_escape_link()
{
	asm("addq   	$%c0, %%rsp" : : "i"(qcg::ArchTraits::spillframe_size + 16));
	asm("popq	%r15\n\t"
	    "popq	%r14\n\t"
	    "popq	%r13\n\t"
	    "popq	%r12\n\t"
	    "popq	%rbx\n\t"
	    "popq	%rbp\n\t"
	    "retq	\n\t");
}

// Escape from translated code, return nullptr(slot) to caller
// A different stub used because llvm may overwrite rax before escaping
HELPER_ASM void qcgstub_escape_brind()
{
	asm("addq   	$%c0, %%rsp" : : "i"(qcg::ArchTraits::spillframe_size + 16));
	asm("popq	%r15\n\t"
	    "popq	%r14\n\t"
	    "popq	%r13\n\t"
	    "popq	%r12\n\t"
	    "popq	%rbx\n\t"
	    "popq	%rbp\n\t"
	    "xorq	%rax, %rax\n\t"
	    "retq	\n\t");
}

// Caller uses 2nd value in returned pair as jump target
static ALWAYS_INLINE _RetPair TryLinkBranch(CPUState *state, ppoint::BranchSlot *slot)
{
	// if (dbt::config::trace) {
	// 	state->DumpTraceCache(slot->gip, state->ip);
	// }
	auto found = tcache::Lookup(slot->gip);
	if (likely(found)) {
		// found->flags.exec_count += 1;
		slot->Link(found->tcode.ptr);
		tcache::RecordLink(slot, found, slot->flags.cross_segment);
		tcache::CacheBr(found);
		return {slot, found->tcode.ptr};
	}
	state->ip = slot->gip;
	return {slot, (void *)qcgstub_escape_link};
}

// Lazy region linking, absolute call target (jit/aot mode)
HELPER_ASM void qcgstub_link_branch_jit()
{
	asm("movq	0(%rsp), %rsi\n\t"
	    "movq	%r13, %rdi\n\t"
	    "callq	qcg_TryLinkBranchJIT@plt\n\t"
	    "popq	%rdi\n\t" // pop somewhere
	    "jmpq	*%rdx\n\t");
}

// Lazy region linking, qcg-relocation call target (aot mode)
HELPER_ASM void qcgstub_link_branch_aot()
{
	asm("movq	0(%rsp), %rsi\n\t"
	    "movq	%r13, %rdi\n\t"
	    "callq	qcg_TryLinkBranchAOT@plt\n\t"
	    "popq	%rdi\n\t" // pop somewhere
	    "jmpq	*%rdx\n\t");
}

// Lazy region linking, qcg-relocation call target with stack check (llvm aot mode)
HELPER_ASM void qcgstub_link_branch_llvmaot()
{
	asm("leaq	8(%rsp), %rdx\n\t" // sp in patchpoint
	    "movq	0(%rsp), %rsi\n\t"
	    "movq	%r13, %rdi\n\t"
	    "callq	qcg_TryLinkBranchLLVMAOT@plt\n\t"
	    "popq	%rdi\n\t" // pop somewhere
	    "jmpq	*%rdx\n\t");
}

HELPER _RetPair qcg_TryLinkBranchJIT(CPUState *state, void *retaddr)
{
	return TryLinkBranch(state, ppoint::BranchSlot::FromCallPtrRetaddr(retaddr));
}

HELPER _RetPair qcg_TryLinkBranchAOT(CPUState *state, void *retaddr)
{
	return TryLinkBranch(state, ppoint::BranchSlot::FromCallRuntimeStubRetaddr(retaddr));
}

HELPER _RetPair qcg_TryLinkBranchLLVMAOT(CPUState *state, void *retaddr, uptr in_sp)
{
	assert(in_sp == state->sp_unwindptr);
	return TryLinkBranch(state, ppoint::BranchSlot::FromCallRuntimeStubRetaddr(retaddr));
}

// Indirect branch slowpath
HELPER void *qcgstub_brind(CPUState *state, u32 gip)
{
	// if (dbt::config::trace) {
	// 	state->DumpTraceCache(gip, state->ip);
	// }
	state->ip = gip;
	auto *found = tcache::Lookup(gip);
	if (likely(found)) {
		found->flags.exec_count += 1;
		tcache::CacheBrind(found);
		return (void *)found->tcode.ptr;
	}
	return (void *)qcgstub_escape_brind;
}

HELPER void qcgstub_raise()
{
	RaiseTrap();
}

#define PUSH_NONCSR_GPR()                                                                                    \
	"pushq	%rax\n\t"                                                                                     \
	"pushq	%rcx\n\t"                                                                                     \
	"pushq	%rdx\n\t"                                                                                     \
	"pushq	%rsi\n\t"                                                                                     \
	"pushq	%rdi\n\t"                                                                                     \
	"pushq	%r8\n\t"                                                                                      \
	"pushq	%r9\n\t"                                                                                      \
	"pushq	%r10\n\t"                                                                                     \
	"pushq	%r11\n\t"

#define POP_NONCSR_GPR()                                                                                     \
	"popq	%r11\n\t"                                                                                      \
	"popq	%r10\n\t"                                                                                      \
	"popq	%r9\n\t"                                                                                       \
	"popq	%r8\n\t"                                                                                       \
	"popq	%rdi\n\t"                                                                                      \
	"popq	%rsi\n\t"                                                                                      \
	"popq	%rdx\n\t"                                                                                      \
	"popq	%rcx\n\t"                                                                                      \
	"popq	%rax\n\t"

HELPER_ASM void qcgstub_trace()
{
	asm(PUSH_NONCSR_GPR());

	asm("pushq	%r13\n\t"
	    "movq	%r13, %rdi\n\t" // STATE
	    "subq	$16, %rsp\n\t" // TODO: figure out 16 or 8, sometime only one work.
	    "callq	qcg_DumpTrace@plt\n\t"
	    "addq	$16, %rsp\n\t"
	    "popq	%r13\n\t");

	asm(POP_NONCSR_GPR());
	asm("retq	\n\t");
}

HELPER_ASM void qcgstub_trace_cache()
{
	asm(PUSH_NONCSR_GPR());

	asm("pushq	%r13\n\t"
	    "movq	%r13, %rdi\n\t" // STATE
	    "pushq	%r14\n\t"
	    "movq	%r14, %rsi\n\t" // gip
	    "pushq	%r15\n\t"
	    "movq	%r15, %rdx\n\t" // entry_ip
	    "subq	$8, %rsp\n\t"
	    "callq	qcg_DumpTraceCache@plt\n\t"
	    "addq	$8, %rsp\n\t"
	    "popq	%r15\n\t"
	    "popq	%r14\n\t"
	    "popq	%r13\n\t");

	asm(POP_NONCSR_GPR());
	asm("retq	\n\t");
}

static_assert(qcg::ArchTraits::STATE == asmjit::x86::Gp::kIdR13);

struct TraceRing {
	static constexpr u32 size = 64;

	struct Record {
		u32 gip;
	};

	void push(Record const &rec)
	{
		arr[head++ % size] = rec;
	}

	auto &at_idx(u32 i)
	{
		return arr[(head - 1 - i) % size];
	}

	u32 head = 0;
	std::array<Record, size> arr{};
};

thread_local TraceRing trace_ring;

extern "C" __attribute__((used)) void __log_trace_ring()
{
	for (u32 i = 0; i < trace_ring.size; ++i) {
		auto const &e = trace_ring.at_idx(i);
		log_dbt("%08x", e.gip);
	}
}

HELPER void qcg_DumpTrace(CPUState *state)
{
	state->DumpTrace("entry");
}

HELPER void qcg_DumpTraceCache(CPUState *state, u32 gip, u32 entry_ip)
{
	// log_dbt("DumpTraceCache called with state=%p, gip=%08x", state, gip);
	// log_dbt("DumpTraceCache from %08x to %08x", state->ip, gip);
	state->DumpTraceCache(gip, entry_ip);
}
} // namespace dbt::jitabi
