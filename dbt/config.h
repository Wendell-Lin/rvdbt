#pragma once

#define DBT_LINUX_GUEST

#if !(__has_feature(address_sanitizer) || defined(__SANITIZE_ADDRESS__))
#define DBT_ZERO_MMU_BASE
#endif

#include <vector>

namespace dbt::config
{
#ifndef NDEBUG
static constexpr bool debug = true;
#else
static constexpr bool debug = false;
#endif
#ifdef DBT_USE_INTERP
static constexpr bool use_interp = true;
#else
static constexpr bool use_interp = false;
#endif
#ifdef DBT_ZERO_MMU_BASE
static constexpr bool zero_membase = true;
#else
static constexpr bool zero_membase = false;
#endif
#ifdef DBT_DUMP_TRACE
static constexpr bool dump_trace = true;
#else
static constexpr bool dump_trace = false;
#endif
// for jit
inline bool merge_ls = false;
inline bool trace = true; // trace execution count more detailed
inline bool use_aot = false;
inline bool dump_time = false;
inline bool not_freq = false;
// for aot
inline bool llvmopt = false;
inline uint64_t threshold = 1000;
inline bool cross_segment_branch = false;
inline std::vector<uint64_t> avoid_ips;
inline bool propagate_exec_count = true;
} // namespace dbt::config
