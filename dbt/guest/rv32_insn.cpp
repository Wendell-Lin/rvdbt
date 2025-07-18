#include "dbt/guest/rv32_insn.h"
#include "dbt/guest/rv32_cpu.h"
#include "dbt/util/logger.h"

#include <sstream>

namespace dbt::rv32
{

namespace insn
{

static char const *const gpr_names[32] = {
    [0] = "zr",	 [1] = "ra",  [2] = "sp",   [3] = "gp",	  [4] = "tp",  [5] = "t0",  [6] = "t1",	 [7] = "t2",
    [8] = "fp",	 [9] = "s1",  [10] = "a0",  [11] = "a1",  [12] = "a2", [13] = "a3", [14] = "a4", [15] = "a5",
    [16] = "a6", [17] = "a7", [18] = "s2",  [19] = "s3",  [20] = "s4", [21] = "s5", [22] = "s6", [23] = "s7",
    [24] = "s8", [25] = "s9", [26] = "s10", [27] = "s11", [28] = "t3", [29] = "t4", [30] = "t5", [31] = "t6"};

char const *GRPToName(u8 r)
{
	return gpr_names[r];
}

static constexpr auto DUMP_DELIM = std::string_view(", ");

std::ostream &operator<<(std::ostream &o, Base i)
{
	return o;
}
std::ostream &operator<<(std::ostream &o, R i)
{
	return o << gpr_names[i.rd()] << DUMP_DELIM << gpr_names[i.rs1()] << DUMP_DELIM << gpr_names[i.rs2()];
}
std::ostream &operator<<(std::ostream &o, I i)
{
	return o << gpr_names[i.rd()] << DUMP_DELIM << gpr_names[i.rs1()] << DUMP_DELIM << i.imm();
}
std::ostream &operator<<(std::ostream &o, IS i)
{
	return o << gpr_names[i.rd()] << DUMP_DELIM << gpr_names[i.rs1()] << DUMP_DELIM << (u16)i.imm();
}
std::ostream &operator<<(std::ostream &o, S i)
{
	return o << gpr_names[i.rs2()] << DUMP_DELIM << gpr_names[i.rs1()] << DUMP_DELIM << i.imm();
}
std::ostream &operator<<(std::ostream &o, B i)
{
	return o << gpr_names[i.rs1()] << DUMP_DELIM << gpr_names[i.rs2()] << DUMP_DELIM << i.imm();
}
std::ostream &operator<<(std::ostream &o, U i)
{
	return o << gpr_names[i.rd()] << DUMP_DELIM << i.imm();
}
std::ostream &operator<<(std::ostream &o, J i)
{
	return o << gpr_names[i.rd()] << DUMP_DELIM << i.imm();
}
std::ostream &operator<<(std::ostream &o, A i)
{
	return o << gpr_names[i.rd()] << DUMP_DELIM << gpr_names[i.rs1()] << DUMP_DELIM << gpr_names[i.rs2()]
		 << " \tra=" << int(i.rl()) << int(i.aq());
}

} // namespace insn

LOG_STREAM(trace);

void CPUStateImpl::DumpTrace(char const *event)
{
	std::array<char, 1024> buf;
	auto cur = buf.begin();

	cur += snprintf(cur, 80, "#### %08x #### %s\n", ip, event);
	// log_trace("#### %08x #### %s", ip, event);

	for (int i = 0; i < 32; ++i) {
		cur += sprintf(cur, "%4.4s=%08x", insn::GRPToName(i), gpr[i]);
	}

	log_trace.write(buf.data());
}

void CPUStateImpl::DumpTraceCache(u32 gip, u32 entry_ip)
{
	ip2ip_counts[entry_ip][gip]++;
	if (ip2ip_counts[entry_ip][gip] == 1) {
		log_trace("ip2ip_counts[%08x][%08x]=%u", entry_ip, gip, ip2ip_counts[entry_ip][gip]);
	}
}

} // namespace dbt::rv32
