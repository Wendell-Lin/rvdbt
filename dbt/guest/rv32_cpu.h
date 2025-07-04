#pragma once

#include "dbt/guest/rv32_ops.h"
#include "dbt/qmc/runtime_stubs.h"
#include "dbt/tcache/tcache.h"
#include "dbt/util/common.h"

#include <array>

namespace dbt::rv32
{

enum class TrapCode : u32 {
	NONE = 0,
	UNALIGNED_IP,
	ILLEGAL_INSN,
	EBREAK,
	ECALL,
};

// TODO: separate guest part
struct CPUStateImpl {
	bool IsTrapPending()
	{
		return trapno == TrapCode::NONE;
	}

	void DumpTrace(char const *event);
	void DumpTraceCache(u32 gip, u32 entry_ip);
	std::unordered_map<u32, std::unordered_map<u32, u64>> ip2ip_counts; // map from ip to gip to count

	using gpr_t = u32;
	static constexpr u8 gpr_num = 32;

	std::array<gpr_t, gpr_num> gpr{};
	gpr_t ip{};
	TrapCode trapno{};

	tcache::L1BrindCache *l1_brind_cache{&tcache::l1_brind_cache};
	tcache::L1CacheTbExecCount *cache_tb_exec_count{&tcache::cache_tb_exec_count};
	RuntimeStubTab stub_tab{};

	uptr sp_unwindptr{};

	using csr_t = u32;
	static constexpr u16 csr_num = 4096;
	std::array<csr_t, csr_num> csr{};
};

// qmc config, also used to synchronize int/jit debug tracing
static constexpr u16 TB_MAX_INSNS = 64; // TODO: this cannot be changed too large, but where does the 

} // namespace dbt::rv32

namespace dbt
{
struct uthread;
struct CPUState : rv32::CPUStateImpl {
	CPUState() = delete;
	CPUState(uthread *ut_) : ut(ut_) {}

	static void SetCurrent(CPUState *s)
	{
		tls_current = s;
	}

	static CPUState *Current()
	{
		return tls_current;
	}

	uthread *GetUThread() const
	{
		return ut;
	}

private:
	static thread_local CPUState *tls_current;

	uthread *ut{};
};

} // namespace dbt
