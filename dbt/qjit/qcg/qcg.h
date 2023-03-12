#pragma once

#include "dbt/qjit/qir.h"
#include "dbt/tcache/tcache.h"

namespace dbt::qcg
{

LOG_STREAM(qcg);

TBlock::TCode JITGenerate(qir::Region *r, u32 ip);

struct MachineRegionInfo {
	bool has_calls = false;
};

struct QSelPass {
	static void run(qir::Region *region, MachineRegionInfo *region_info);
};

struct QRegAllocPass {
	static void run(qir::Region *region);
};

}; // namespace dbt::qcg
