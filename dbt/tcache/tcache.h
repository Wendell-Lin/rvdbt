#pragma once

#include "dbt/arena.h"
#include "dbt/mmu.h"
#include "dbt/tcache/cflow_dump.h"
#include "dbt/util/logger.h"

#include <array>
#include <bitset>
#include <map>

namespace dbt
{
LOG_STREAM(tcache);

namespace jitabi::ppoint
{
struct BranchSlot;
} // namespace jitabi::ppoint

struct alignas(8) TBlock {
	struct TCode {
		void *ptr{nullptr};
		size_t size{0};
	};

	TCode tcode{};
	u32 ip{0};
	struct {
		bool is_brind_target : 1 {false};
		bool is_segment_entry : 1 {false};
		u64 exec_count : 64 {0};
		u32 exec_instr_count: 32 {0};
	} flags;
};

struct tcache {
	static void Init();
	static void Destroy();
	static void Invalidate();
	static void Insert(TBlock *tb);
	static void InvalidatePage(u32 pvaddr);

	static ALWAYS_INLINE TBlock *LookupFast(u32 ip)
	{
		auto *tb = l1_cache[l1hash(ip)];
		return (tb->ip == ip) ? tb : nullptr;
	}

	static TBlock *Lookup(u32 ip)
	{
		auto hash = l1hash(ip);
		auto *tb = l1_cache[hash];
		if (tb != nullptr && tb->ip == ip)
			return tb;
		tb = LookupFull(ip);
		if (tb != nullptr)
			l1_cache[hash] = tb;
		return tb;
	}

	static TBlock *LookupUpperBound(u32 gip);

	static void CacheBr(TBlock *tb)
	{
		auto &entry = cache_tb_exec_count[l1hash(tb->ip)];
		if (entry.tb && entry.tb->ip != tb->ip) {
			log_tcache("Cache collision, both %08x and %08x with hash %08x", entry.tb->ip, tb->ip, l1hash(tb->ip));
		}
		cache_tb_exec_count[l1hash(tb->ip)] = {tb->ip, tb};
	}

	static void CacheBrind(TBlock *tb)
	{
		auto &entry = cache_tb_exec_count[l1hash(tb->ip)];
		if (entry.tb && entry.tb->ip != tb->ip) {
			log_tcache("Cache collision, both %08x and %08x with hash %08x", entry.tb->ip, tb->ip, l1hash(tb->ip));
		}
		// l1_brind_cache[l1hash(tb->ip)] = {tb->ip, tb->tcode.ptr, tb};
		l1_brind_cache[l1hash(tb->ip)] = {tb->ip, tb->tcode.ptr};
		cache_tb_exec_count[l1hash(tb->ip)] = {tb->ip, tb};
		if (unlikely(!tb->flags.is_brind_target)) {
			cflow_dump::RecordBrindEntry(tb->ip);
		}
		tb->flags.is_brind_target = true;
	}

	static void RecordLink(jitabi::ppoint::BranchSlot *slot, TBlock *tgt, bool cross_segment)
	{
		tgt->flags.is_segment_entry |= cross_segment;
		link_map.insert({tgt->ip, slot});
	}

	static void *AllocateCode(size_t sz, u16 align);
	static TBlock *AllocateTBlock();

	static constexpr u32 L1_CACHE_BITS = 22; // TODO: this should depend on the size of the executable, to avoid cache miss that possibly leads to inacurate profiler.
	using L1Cache = std::array<TBlock *, 1u << L1_CACHE_BITS>;
	static L1Cache l1_cache;

	struct BrindCacheEntry {
		u32 gip;
		void *code;
	};
	using L1BrindCache = std::array<BrindCacheEntry, 1u << L1_CACHE_BITS>;
	static L1BrindCache l1_brind_cache;
	struct CacheTbExecCountEntry {
		u32 gip;
		TBlock *tb;
	};
	using L1CacheTbExecCount = std::array<CacheTbExecCountEntry, 1u << L1_CACHE_BITS>;
	static L1CacheTbExecCount cache_tb_exec_count;

	static ALWAYS_INLINE u32 l1hash(u32 ip)
	{
		return (ip >> 2) & ((1ull << L1_CACHE_BITS) - 1);
	}

	static void PrintTBPoolStats()
	{
		log_tcache("TB pool used size: %zu", tb_pool.GetUsedSize());
	}

	static void PrintCodePoolStats()
	{
		log_tcache("Code pool used size: %zu", code_pool.GetUsedSize());
	}

private:
	tcache() = delete;
	friend struct objprof;

	static TBlock *LookupFull(u32 ip);

	using MapType = std::map<u32, TBlock *>;
	static MapType tcache_map;

	static constexpr size_t TB_POOL_SIZE = 32 * 1024 * 1024;
	static MemArena tb_pool;

	static constexpr size_t CODE_POOL_SIZE = 128 * 1024 * 1024;
	static MemArena code_pool;

	static std::multimap<u32, jitabi::ppoint::BranchSlot *> link_map;
};

} // namespace dbt
