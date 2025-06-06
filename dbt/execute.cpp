#include "dbt/execute.h"
#include "dbt/guest/rv32_runtime.h"
#include "dbt/qmc/compile.h"
#include "dbt/qmc/qcg/jitabi.h"

namespace dbt
{

sigjmp_buf trap_unwind_env;

static inline bool HandleTrap(CPUState *state)
{
	// Currenlty only delegates to ukernel
	return !state->IsTrapPending();
}

struct JITCompilerRuntime final : CompilerRuntime {
	void *AllocateCode(size_t sz, uint align) override
	{
		return tcache::AllocateCode(sz, align);
	}

	bool AllowsRelocation() const override
	{
		return false;
	}

	void *AnnounceRegion(u32 ip, std::span<u8> const &code, u32 num_insns) override
	// void *AnnounceRegion(u32 ip, std::span<u8> const &code) override
	{
		// TODO: concurrent tcache
		auto tb = tcache::AllocateTBlock();
		if (tb == nullptr) {
			Panic();
		}
		tb->ip = ip;
		tb->tcode = TBlock::TCode{code.data(), code.size()};
		tb->flags.exec_instr_count = num_insns;
		tcache::Insert(tb);
		return (void *)tb;
	}
};

static inline IpRange GetCompilationIPRange(u32 ip)
{
	u32 upper = roundup(ip, mmu::PAGE_SIZE);
	if (config::dump_trace) {
		return {ip, upper};
	}
	// TODO: this avoid translate until an existing TB, whose IP range may overlap with the new one that is hard to profile
	// if (auto *tb_upper = tcache::LookupUpperBound(ip)) {
	// 	upper = std::min(upper, tb_upper->ip);
	// }
	return {ip, upper};
}

void Execute(CPUState *state)
{
	sigsetjmp(dbt::trap_unwind_env, 0);

	jitabi::ppoint::BranchSlot *branch_slot = nullptr;

	while (likely(!HandleTrap(state))) {
		assert(state == CPUState::Current());
		assert(state->gpr[0] == 0);
		assert(!branch_slot || branch_slot->gip == state->ip);
		if constexpr (config::use_interp) {
			Interpreter::Execute(state);
			continue;
		}

		TBlock *tb = tcache::Lookup(state->ip);
		if (tb == nullptr) {
			auto jrt = JITCompilerRuntime();
			u32 gip_page = rounddown(state->ip, mmu::PAGE_SIZE);
			qir::CompilerJob job(&jrt, (uptr)mmu::base,
					     qir::CodeSegment(gip_page, mmu::PAGE_SIZE),
					     {GetCompilationIPRange(state->ip)});
			tb = (TBlock *)qir::CompilerDoJob(job);
		}

		if (branch_slot) {
			branch_slot->Link(tb->tcode.ptr);
			tcache::RecordLink(branch_slot, tb, branch_slot->flags.cross_segment);
			tcache::CacheBr(tb);
		} else {
			tcache::CacheBrind(tb);
		}

		tb->flags.exec_count += 1;
		log_dbt("ip %08x back to loop with count %d, insn count %d", state->ip, tb->flags.exec_count, tb->flags.exec_instr_count);
		branch_slot = jitabi::trampoline_to_jit(state, mmu::base, tb->tcode.ptr);
	}
}

} // namespace dbt
