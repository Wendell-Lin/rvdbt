#pragma once

#define DBT_LINUX_GUEST

#if !(__has_feature(address_sanitizer) || defined(__SANITIZE_ADDRESS__))
#define DBT_ZERO_MMU_BASE
#endif

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
inline bool brcc = true;
// for aot
inline bool llvmopt = true;
inline uint64_t threshold = 1000;
} // namespace dbt::config
