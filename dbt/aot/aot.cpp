#include "dbt/aot/aot.h"
#include "dbt/aot/aot_module.h"
#include "dbt/guest/rv32_analyser.h"
#include "dbt/qmc/compile.h"
#include "dbt/tcache/objprof.h"
#include <vector>

namespace dbt
{
LOG_STREAM(aot)

ModuleGraph BuildModuleGraph(objprof::PageData const &page)
{
	u32 const page_vaddr = page.pageno << mmu::PAGE_BITS;
	u32 const next_page_vaddr = page_vaddr + mmu::PAGE_SIZE;

	std::vector<u32> iplist;
	ModuleGraph mg(qir::CodeSegment(page_vaddr, mmu::PAGE_SIZE));

	for (u32 idx = 0; idx < page.executed.size(); ++idx) {
		if (!page.executed[idx]) {
			continue;
		}
		u32 ip = page_vaddr + objprof::PageData::idx2po(idx);
		iplist.push_back(ip);
		mg.RecordEntry(ip);
		if (page.brind_target[idx]) {
			mg.RecordBrindTarget(ip);
		}
		if (page.segment_entry[idx]) {
			mg.RecordSegmentEntry(ip);
		}
		if (page.exec_count[idx] > 0) {
			mg.RecordExec(ip, page.exec_ns[idx], page.exec_count[idx]);
		}
	}

	for (size_t idx = 0; idx < iplist.size(); ++idx) {
		u32 ip = iplist[idx];
		u32 ip_next = (idx == iplist.size() - 1) ? next_page_vaddr : iplist[idx + 1];

		rv32::RV32Analyser::Analyse(&mg, ip, ip_next, (uptr)mmu::base);
	}

	return mg;
}

static void AOTCompilePage(CompilerRuntime *aotrt, objprof::PageData const &page)
{
	auto mg = BuildModuleGraph(page);
	auto regions = mg.ComputeRegions();

#if 1
	for (auto const &r : regions) {
		assert(r[0]->flags.region_entry);
		// if (r[0]->flags.exec_count <= 10000)
		// 	continue;
		// log_aot("Compile region: %08x, %08x", r[0]->ip, r[r.size() - 1]->ip_end);
		qir::CompilerJob::IpRangesSet ipranges;
		for (auto n : r) {
			ipranges.push_back({n->ip, n->ip_end});
		}

		qir::CompilerJob job(aotrt, (uptr)mmu::base, mg.segment, std::move(ipranges));
		qir::CompilerDoJob(job);
	}
#else
	for (auto const &e : mg.ip_map) {
		auto const &n = *e.second;
		qir::CompilerJob job(aotrt, mg.segment, {{n.ip, n.ip_end}});
		qir::CompilerDoJob(job);
	}
#endif
}

void AOTCompileObject(CompilerRuntime *aotrt)
{
	for (auto const &page : objprof::GetProfile()) {
		AOTCompilePage(aotrt, page);
	}
}

} // namespace dbt
