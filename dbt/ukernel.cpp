#include "dbt/ukernel.h"
#include "dbt/execute.h"
#include "dbt/mmu.h"
#include "dbt/tcache/objprof.h"
#include "dbt/util/fsmanager.h"
#include <alloca.h>
#include <cstring>
#include <memory>
#include <vector>
#include <sstream>

#include "dbt/ukernel_syscalls.h"

extern "C" {
#include <elf.h>
#include <fcntl.h>
#include <libgen.h>
#include <linux/limits.h>
#include <linux/unistd.h>
#include <signal.h>
#include <sys/mman.h>
#include <sys/random.h>
#include <sys/resource.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/sysinfo.h>
#include <sys/time.h>
#include <sys/times.h>
#include <sys/types.h>
#include <sys/utsname.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/uio.h>
#include <unistd.h>
#include <dirent.h>
};

namespace dbt
{
LOG_STREAM(ukernel);

struct ukernel::ElfImage {
	Elf32_Ehdr ehdr{};
	uabi_ulong load_addr{};
	uabi_ulong stack_start{};
	uabi_ulong entry{};
	uabi_ulong brk{};
};

struct ukernel::Process {
	ElfImage elf_image{}; // boot, not related to ld

	std::unique_ptr<uthread> main_thread{};

	std::string fsroot;
	std::string guest_cwd;  // Guest's view of current working directory (absolute path)
	int exe_fd{-1};
	uabi_ulong brk{};
};

struct uthread {
	uthread() : state(this)
	{
		if (CPUState::Current() != nullptr) {
			Panic("uthread is already active in this host thread");
		}
		CPUState::SetCurrent(&state);
		ukernel::InitSignals(&state);
	}

	~uthread()
	{
		if (CPUState::Current() != &state) {
			Panic("uthread dies within a different host thread");
		}
		CPUState::SetCurrent(nullptr);
	}

	CPUState state;
	// per-thread/task OS data
	bool terminating{};
	int termination_code{};
};

ukernel::Process ukernel::process{};

static void DebugTrap(CPUState *state)
{
	state->DumpTrace("ebreak");
}

void ukernel::Execute()
{
	auto *state = CPUState::Current();
	auto *ut = state->GetUThread();

	while (!ut->terminating) {
		dbt::Execute(state);
		assert(!ut->terminating);
		switch (state->trapno) {
		case rv32::TrapCode::EBREAK:
			log_ukernel("ebreak");
			DebugTrap(state);
			state->ip += 4; // TODO:
			break;
		case rv32::TrapCode::ECALL:
			state->ip += 4; // TODO:
			ukernel::Syscall(state);
			break;
		case rv32::TrapCode::ILLEGAL_INSN:
			log_ukernel("illegal instruction at %08x", state->ip);
			EnqueueTermination(1);
			break;
		default:
			unreachable("no handle for trap");
		}
	}
}

void ukernel::InitMainThread(CPUState *state, ElfImage *elf)
{
	assert(!(elf->stack_start & 15));
	state->gpr[2] = elf->stack_start;
	state->ip = elf->entry;
}

static void dbt_sigaction_memory(int signo, siginfo_t *sinfo, void *uctx_raw)
{
	auto uc = static_cast<ucontext_t *>(uctx_raw);

	auto hpc = uc->uc_mcontext.gregs[REG_RIP];

	log_ukernel("dbt_sigaction_memory:host: signal=%d, pc=%p, si_addr=%p", signo, hpc, sinfo->si_addr);
	auto state = CPUState::Current();
	if (state == nullptr) {
		Panic("Memory fault while dbt cpu is inactive");
	}
	if (!mmu::check_h2g(sinfo->si_addr)) {
		Panic("Memory fault in host address space");
	}
	auto g_faddr = mmu::h2g(sinfo->si_addr);

	state->DumpTrace("signal");
	log_ukernel("\tfault:guest: pc=%08x, si_addr=%08x", state->ip, g_faddr);
	
	// Add more detailed error information
	log_ukernel("\tmemory access type: %s", 
		sinfo->si_code == SEGV_ACCERR ? "protection violation" :
		sinfo->si_code == SEGV_MAPERR ? "address not mapped" : "unknown");
	
	// Check if the address is in a valid page
	u32 page_addr = g_faddr & mmu::PAGE_MASK;
	log_ukernel("\tpage address: %08x", page_addr);
	
	Panic("Memory fault in guest address space. See logs for more details");
}

// TODO: emulate signals
void ukernel::InitSignals(CPUState *state)
{
	struct sigaction sa;
	sigset_t sset;

	sigfillset(&sset);
	sa.sa_flags = SA_SIGINFO;
	sa.sa_sigaction = dbt_sigaction_memory;

	sigaction(SIGSEGV, &sa, nullptr);
	sigaction(SIGBUS, &sa, nullptr);
}

// demo-kernel for debugging
void ukernel::SyscallDemo(CPUState *state)
{
	state->trapno = rv32::TrapCode::NONE;
	uabi_ulong id = state->gpr[10];
	switch (id) {
	case 1: {
		log_ukernel("syscall readnum");
		uabi_ulong res;
		fscanf(stdin, "%d", &res);
		state->gpr[10] = res;
		return;
	}
	case 2: {
		log_ukernel("syscall writenum");
		fprintf(stdout, "%d\n", state->gpr[11]);
		return;
	}
	case 3: {
		log_ukernel("syscall exit");
		EnqueueTermination(state->gpr[11]);
		return;
	}
	default:
		Panic("unknown syscall");
	}
}

static int HandleSpecialPath(char const *path, char *resolved)
{
	if (!strcmp(path, "/proc/self/exe")) {
		sprintf(resolved, "/proc/self/fd/%d", ukernel::process.exe_fd);
		log_ukernel("exe_fd: %s", resolved);
		return 1;
	}
	return 0;
}

void ukernel::SetFSRoot(const char *fsroot_)
{
	char buf[PATH_MAX];
	if (!realpath(fsroot_, buf)) {
		Panic("failed to resolve fsroot");
	}
	process.fsroot = std::string(buf) + "/";
	process.guest_cwd = "/";  // Initialize guest cwd to root
}

static int NormalizePath(char *&path)
{
	int j = 0;
	for (int i = 0; path[i] != '\0'; i++) {
		if (path[i] == '/' && path[i+1] == '/') {
			continue;
		}
		path[j++] = path[i];
	}
	path[j] = '\0';
	return 0;
}

static int PathResolution(int dirfd, char const *path, char *resolved)
{
	char rp_buf[PATH_MAX];
	
	log_ukernel("path resolution: input path='%s', fsroot='%s', guest_cwd='%s', dirfd=%d", 
		path, ukernel::process.fsroot.c_str(), ukernel::process.guest_cwd.c_str(), dirfd);
	auto const &fsroot = ukernel::process.fsroot;

	// Special case handling first
	if (HandleSpecialPath(path, resolved) > 0) {
		return 0;
	}

	// Handle absolute and relative paths
	if (path[0] == '/') {
		// For absolute paths, treat them as relative to fsroot
		// TODO: some path resolution use /a/b/c to get c under /a/b with fsroot = /a/b
		// but there might be a problem if the path is actually /a/b/a/b/c, but we get /a/b/c
		if (strstr(path, fsroot.c_str()) == path) {
			snprintf(rp_buf, sizeof(rp_buf), "%s", path);
		} else {
			snprintf(rp_buf, sizeof(rp_buf), "%s%s", fsroot.c_str(), path);
		}
	} else {
		// For relative paths with AT_FDCWD, treat as relative to fsroot
		if (dirfd == AT_FDCWD) {
			const auto &guest_cwd = ukernel::process.guest_cwd;
			std::string path_from_root;
			if (guest_cwd == "/") {
				path_from_root = path;
			} else {
				path_from_root = guest_cwd.substr(1) + "/" + path;
			}
			snprintf(rp_buf, sizeof(rp_buf), "%s%s", fsroot.c_str(), path_from_root.c_str());
		} else {
			char fdpath[64];
			sprintf(fdpath, "/proc/self/fd/%d", dirfd);
			ssize_t len = readlink(fdpath, rp_buf, sizeof(rp_buf) - 1);
			if (len < 0) {
				log_ukernel("bad dirfd");
				return -1;
			}
			rp_buf[len] = '\0';
			
			// For dirfd paths, ensure we're within fsroot
			if (strncmp(rp_buf, fsroot.c_str(), fsroot.length())) {
				log_ukernel("dirfd path escapes fsroot: %s", rp_buf);
				return -EACCES;
			}
			
			// Strip fsroot prefix to get guest path
			const char* guest_path = rp_buf + fsroot.length() - 1; // keep leading /
			
			// Append the relative path
			size_t pref_sz = strlen(guest_path);
			if (pref_sz + 1 + strlen(path) >= sizeof(rp_buf)) {
				return -ENAMETOOLONG;
			}
			strcpy(rp_buf + pref_sz, path);
		}
	}

	log_ukernel("path resolution: intermediate path='%s'", rp_buf);

	// Resolve the final path
	if (!realpath(rp_buf, resolved)) {
		log_ukernel("unresolved path %s: %s", rp_buf, strerror(errno));
		return -errno;
	}

	// Final check that we haven't escaped fsroot
	if (strncmp(resolved, fsroot.c_str(), fsroot.length() - 1)) {
		log_ukernel("resolved path %s escapes fsroot: %s", resolved, fsroot.c_str());

		return -EACCES;
	}

	log_ukernel("path resolution: final path='%s'", resolved);
	return 0;
}

enum class SyscallID : u32 {
#define SC(name, no) linux_##name = no,
	RV32_LINUX_SYSCALL_NO(SC, SC)
#undef SC
	    End = RV32_LINUX_SYSCALL_NO_END,
};

[[noreturn]] static uabi_long SyscallUnhandled(uabi_long no)
{
	static char const *const names[to_underlying(SyscallID::End)] = {
#define SC(name, no) [to_underlying(SyscallID::linux_##name)] = #name,
	    RV32_LINUX_SYSCALL_NO(SC, SC)
#undef SC
	};
	char const *name = (no > 0 && no < to_underlying(SyscallID::End)) ? names[no] : "UNKNOWN";

	log_ukernel("syscall %s (no=%4d) is unhandled", name, no);
	Panic(std::string("unhandled linux syscall: ") + name);
}

namespace ukernel_syscall
{

static inline uabi_long rcerrno(uabi_long rc)
{
	if (unlikely(rc < 0)) {
		return -errno;
	}
	return rc;
}

static uabi_long linux_openat(uabi_int dfd, const char __user *filename, uabi_int flags, mode_t mode)
{
	DBT_FS_LOCK();
	char pathbuf[PATH_MAX];
	PathResolution(dfd, filename, pathbuf);
	// the new path may not exist, so we don't need to check errno	
	return rcerrno(openat(AT_FDCWD, pathbuf, flags, mode));
}

static uabi_long linux_close(uabi_uint fd)
{
	DBT_FS_LOCK();
	if (fd < 3) { // TODO: split file descriptors
		return 0;
	}
	return rcerrno(close(fd));
}

static uabi_long uerrno(int e)
{
	return e;
}

static uabi_long linux_llseek(uabi_uint fd, uabi_ulong offset_high, uabi_ulong offset_low,
			      loff_t __user *result, uabi_uint whence)
{
	off_t off = ((u64)offset_high << 32) | offset_low;
	int rc = lseek(fd, off, whence);
	if (rc >= 0) {
		*result = rc;
	}
	return 0;
}

static uabi_long linux_read(uabi_uint fd, char __user *buf, uabi_size_t count)
{
	return rcerrno(read(fd, buf, count));
}

static uabi_long linux_write(uabi_uint fd, const char __user *buf, uabi_size_t count)
{
	return rcerrno(write(fd, buf, count));
}

static uabi_long linux_writev(uabi_uint fd, const struct iovec __user *iov, uabi_uint iovcnt)
{
	return rcerrno(writev(fd, iov, iovcnt));
}

static uabi_long linux_readlinkat(uabi_int dfd, const char __user *path, char __user *buf, uabi_int bufsiz)
{
	char pathbuf[PATH_MAX];
	if (*path) {
		if (PathResolution(dfd, path, pathbuf) < 0) {
			return rcerrno(-errno);
		}
	} else {
		pathbuf[0] = 0;
	}
	return rcerrno(readlinkat(dfd, pathbuf, buf, bufsiz));
}

using uabi_stat64 = struct stat;

static uabi_long linux_fstat64(uabi_uint fd, uabi_stat64 __user *statbuf)
{
	// TODO: verify!!!
	return rcerrno(fstatat(fd, "", statbuf, 0));
}

static uabi_long linux_set_tid_address(uabi_int __user *tidptr)
{
	int h_tidptr;
	long rc = syscall(SYS_set_tid_address, &h_tidptr);
	if (rc < 0) {
		return -errno;
	}
	*tidptr = h_tidptr;
	return rc;
}

static uabi_long linux_exit(uabi_int error_code)
{
	ukernel::EnqueueTermination(error_code);
	return 0;
}

static uabi_long linux_exit_group(uabi_int error_code)
{
	return linux_exit(error_code);
}

static uabi_long linux_tgkill(uabi_int tgid, uabi_int pid, int sig)
{
	return rcerrno(tgkill(tgid, pid, sig));
}

static uabi_long linux_rt_sigaction(int, const struct uabi_sigaction __user *, struct sigaction __user *,
				    uabi_size_t)
{
	log_ukernel("TODO: support signals");
	return 0;
}

using uabi_new_utsname = struct utsname;

static uabi_long linux_uname(uabi_new_utsname __user *name)
{
	uabi_long rc = uname(name);
	strcpy(name->machine, "riscv32");
	return rcerrno(rc);
}

static uabi_long linux_getuid()
{
	return getuid();
}

static uabi_long linux_getpid()
{
	return getpid();
}

static uabi_long linux_geteuid()
{
	return geteuid();
}

static uabi_long linux_getgid()
{
	return getgid();
}

static uabi_long linux_getegid()
{
	return getegid();
}

struct uabi_sysinfo {
	u32 uptime;
	u32 loads[3];
	u32 totalram;
	u32 freeram;
	u32 sharedram;
	u32 bufferram;
	u32 totalswap;
	u32 freeswap;
	u16 procs;
	u16 pad;
	u32 totalhigh;
	u32 freehigh;
	u32 mem_unit;
	char _f[20 - 2 * sizeof(u32) - sizeof(u32)];
};

static uabi_long linux_gettid()
{
	return gettid();
}

static uabi_long linux_sysinfo(struct uabi_sysinfo __user *info)
{
	struct sysinfo host_info;
	uabi_long rc = sysinfo(&host_info);

	if (rc > 0) {
		info->uptime = host_info.uptime;
		for (int i = 0; i < 3; ++i) {
			info->loads[i] = host_info.loads[i];
		}
		info->totalram = 1_GB;
		info->freeram = 500_MB;
		info->sharedram = info->bufferram = info->totalswap = info->freeswap = 1_MB;
		info->procs = host_info.procs;
		info->totalhigh = info->freehigh = 1_MB;
		info->mem_unit = 1;
	}
	return rcerrno(rc);
}

static uabi_long linux_brk(uabi_ulong newbrk)
{
	auto &brk = ukernel::process.brk;

	if (newbrk <= brk) {
		log_ukernel("do_sys_brk: newbrk is too small: %08x %08x", newbrk, brk);
		return brk;
	}
	uabi_ulong brk_p = roundup(brk, mmu::PAGE_SIZE);
	if (newbrk <= brk_p) {
		if (newbrk != brk_p) {
			memset(mmu::g2h(brk), 0, newbrk - brk);
		}
		return brk = newbrk;
	}
	void *mem =
	    mmu::mmap(brk_p, newbrk - brk_p, PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE | MAP_FIXED);
	if (mmu::h2g(mem) != brk_p) {
		log_ukernel("do_sys_brk: not enough mem");
		munmap(mem, newbrk - brk_p);
		return brk;
	}
	memset(mmu::g2h(brk), 0, brk_p - brk);
	return brk = newbrk;
}
	// if (newbrk == 0) {
	// 	return brk;
	// }

	// uabi_ulong old_brk = brk;
	// uabi_ulong old_brk_page_end = roundup(old_brk, mmu::PAGE_SIZE);
	// uabi_ulong new_brk_page_end = roundup(newbrk, mmu::PAGE_SIZE);

	// // Ensure the page containing the current brk is writable.
	// if (old_brk > 0) {
	// 	uabi_ulong old_brk_page_start = (old_brk - 1) & ~(mmu::PAGE_SIZE - 1);
	// 	if (mprotect(mmu::g2h(old_brk_page_start), mmu::PAGE_SIZE, PROT_READ | PROT_WRITE) != 0) {
	// 		log_ukernel("brk: mprotect failed on page %08lx: %s", old_brk_page_start,
	// 			    strerror(errno));
	// 		return old_brk;
	// 	}
	// }

	// // If we need *new* pages, map them.
	// if (new_brk_page_end > old_brk_page_end) {
	// 	uabi_ulong map_start = old_brk_page_end;
	// 	uabi_ulong map_size = new_brk_page_end - map_start;
	// 	void *mem = mmu::mmap(map_start, map_size, PROT_READ | PROT_WRITE,
	// 			      MAP_ANON | MAP_PRIVATE | MAP_FIXED);
	// 	if (mmu::h2g(mem) != map_start) {
	// 		log_ukernel("do_sys_brk: mmap for new pages failed");
	// 		munmap(mem, map_size);
	// 		return old_brk;
	// 	}
	// }

	// memset(mmu::g2h(old_brk), 0, newbrk - old_brk);
	// return brk = newbrk;
	// }

static uabi_long linux_munmap(uabi_ulong gaddr, uabi_size_t len)
{
	// TODO: implement in mmu
	log_ukernel("munmap addr: %x", mmu::g2h(gaddr));
	return rcerrno(munmap(mmu::g2h(gaddr), len));
}

static uabi_long linux_mremap(uabi_ulong old_addr, uabi_size_t old_size, 
                            uabi_size_t new_size, uabi_ulong flags)
{
    // Validate inputs
    if (old_addr & (mmu::PAGE_SIZE - 1)) {
        log_ukernel("mremap: misaligned old_addr %x", old_addr);
        return uerrno(-EINVAL);
    }

    // Align sizes to page boundaries
    size_t aligned_old_size = (old_size + mmu::PAGE_SIZE - 1) & ~(mmu::PAGE_SIZE - 1);
    size_t aligned_new_size = (new_size + mmu::PAGE_SIZE - 1) & ~(mmu::PAGE_SIZE - 1);

    log_ukernel("mremap: old=%x size=%x->%x flags=%x", 
                old_addr, aligned_old_size, aligned_new_size, flags);

    // If shrinking, just return the original address
    if (aligned_new_size <= aligned_old_size) {
        return old_addr;
    }

    // For expanding, allocate new memory and copy
    void* new_mem = mmu::mmap(0, aligned_new_size, PROT_READ | PROT_WRITE, 
                             MAP_PRIVATE | MAP_ANONYMOUS);
    
    if (new_mem == MAP_FAILED) {
        return uerrno(-errno);
    }

    // Copy old contents to new location
    memcpy(new_mem, mmu::g2h(old_addr), old_size);
    
    // Unmap old region
    munmap(mmu::g2h(old_addr), aligned_old_size);

    uabi_long new_addr = mmu::h2g(new_mem);
    log_ukernel("mremap: result old=%x new=%x", old_addr, new_addr);
    
    return new_addr;
}

static uabi_long linux_rt_sigprocmask(int how, const sigset_t *set, sigset_t *oldset, size_t sigsetsize)
{
    // Validate 'how' parameter
    switch (how) {
    case SIG_BLOCK:   // Add signals to blocked set
        break;
    case SIG_UNBLOCK: // Remove signals from blocked set
        break;
    case SIG_SETMASK: // Set the blocked set directly
        break;
    default:
        return -EINVAL;
    }

    sigset_t host_set, host_oldset;
    if (set) {
        memcpy(&host_set, set, sizeof(sigset_t));
    }

    int rc = sigprocmask(how, set ? &host_set : NULL, 
                        oldset ? &host_oldset : NULL);

    if (oldset && rc == 0) {
        memcpy(oldset, &host_oldset, sizeof(sigset_t));
    }

    return rcerrno(rc);
}

static uabi_long linux_mmap2(uabi_ulong gaddr, uabi_size_t len, uabi_ulong prot, uabi_ulong flags,
			     uabi_uint fd, uabi_ulong off)
{
	// TODO: file maps in mmu
	void *ret = mmu::mmap(gaddr, len, prot, flags, fd, off);
	if (ret == MAP_FAILED) {
		return uerrno(-errno);
	}
	uabi_long rc = mmu::h2g(ret);
	log_ukernel("mmap addr: %x", rc);
	return rc;
}

static uabi_long linux_mprotect(uabi_ulong start, uabi_size_t len, uabi_ulong prot)
{
	// TODO: implement in mmu
	return rcerrno(mprotect(mmu::g2h(start), len, prot));
}


using uabi_pid_t = uabi_int;

struct uabi_rlimit64 {
	uint64_t rlim_cur;
	uint64_t rlim_max;
};

static uabi_long linux_prlimit64(uabi_pid_t pid, uabi_uint resource,
				 const struct uabi_rlimit64 __user *new_rlim,
				 struct uabi_rlimit64 __user *old_rlim)
{
	rlimit64 h_new_rlim, h_old_rlim, *h_new_rlim_p;

	if (new_rlim && !(resource == RLIMIT_AS || resource == RLIMIT_STACK || resource == RLIMIT_DATA)) {
		h_new_rlim.rlim_cur = new_rlim->rlim_cur;
		h_new_rlim.rlim_max = new_rlim->rlim_max;
		h_new_rlim_p = &h_new_rlim;
	} else {
		// just ignore
		h_new_rlim_p = nullptr;
	}

	long rc = syscall(SYS_prlimit64, (pid_t)pid, (uint)resource, h_new_rlim_p, &h_old_rlim);
	if (rc < 0) {
		return -errno;
	}
	old_rlim->rlim_cur = h_old_rlim.rlim_cur;
	old_rlim->rlim_max = h_old_rlim.rlim_max;
	return rc;
}

static uabi_long linux_getrandom(char __user *buf, uabi_size_t count, uabi_uint flags)
{
	return rcerrno(getrandom(buf, count, flags));
}

using uabi_statx = struct statx;

static uabi_long linux_statx(uabi_int dfd, const char __user *path, unsigned flags, unsigned mask,
			     uabi_statx __user *buffer)
{
	char pathbuf[PATH_MAX];
	if (*path) {
		if (PathResolution(dfd, path, pathbuf) < 0) {
			return uerrno(-errno);
		}
	} else {
		pathbuf[0] = 0;
	}
	return rcerrno(statx(dfd, pathbuf, flags, mask, buffer));
}

struct uabi__kernel_timespec {
	uabi_llong tv_sec;
	uabi_llong tv_nsec;
};

static uabi_long linux_clock_gettime64(clockid_t which_clock, uabi__kernel_timespec __user *ktp)
{
	timespec tp;
	auto rc = clock_gettime(which_clock, &tp);
	ktp->tv_sec = tp.tv_sec;
	ktp->tv_nsec = tp.tv_nsec;
	return rcerrno(rc);
}

static uabi_long linux_gettimeofday(struct timeval __user *tv, struct timezone __user *tz) // tz is obsolete
{
	struct timespec tp;
	auto rc = clock_gettime(CLOCK_REALTIME, &tp);
	tv->tv_sec = tp.tv_sec;
	tv->tv_usec = tp.tv_nsec / 1000;

    return rcerrno(rc);
}

static uabi_long linux_renameat2(int olddfd, const char __user *oldpath, int newdfd, const char __user *newpath, unsigned flags)
{
	char old_pathbuf[PATH_MAX];
	if (PathResolution(olddfd, oldpath, old_pathbuf) < 0) {
		return rcerrno(-errno);
	}
	char new_pathbuf[PATH_MAX];
	if (PathResolution(newdfd, newpath, new_pathbuf) < 0) {
		return rcerrno(-errno);
	}
	return rcerrno(renameat2(AT_FDCWD, old_pathbuf, AT_FDCWD, new_pathbuf, flags));
}

static uabi_long linux_ioctl(uabi_uint fd, uabi_uint cmd, uabi_ulong arg)
{
	return rcerrno(ioctl(fd, cmd, arg));
}
static uabi_long linux_fcntl64(uabi_uint fd, uabi_uint cmd, uabi_ulong arg)
{
	return rcerrno(fcntl64(fd, cmd, arg));
}

static uabi_long linux_ftruncate64(uabi_uint fd, uabi_ulong length)
{
	return rcerrno(ftruncate64(fd, length));
}

static uabi_long linux_getcwd(char __user *buf, uabi_size_t size)
{
	char *host_buf = (char *)mmu::g2h(reinterpret_cast<uintptr_t>(buf));
	
	// Return the guest's view of cwd that we track
	const std::string& guest_cwd = ukernel::process.guest_cwd;
	size_t len = guest_cwd.length();
	
	// Check buffer size
	if (size < len + 1) {
		return -ERANGE;
	}
	
	// Copy the guest path to buffer
	memcpy(host_buf, guest_cwd.c_str(), len + 1);
	log_ukernel("getcwd: returning guest_cwd='%s'", host_buf);
	
	return len + 1;
}

static uabi_long linux_chdir(const char __user *filename)
{
    char *path = (char *)mmu::g2h(reinterpret_cast<uintptr_t>(filename));

    // Verify directory exists and is accessible
	NormalizePath(path);
    log_ukernel("chdir: input path='%s'", path);
    char pathbuf[PATH_MAX];
    if (PathResolution(AT_FDCWD, path, pathbuf) < 0) {
        return uerrno(-errno);
    }
    
    struct stat st;
    if (stat(pathbuf, &st) < 0 || !S_ISDIR(st.st_mode)) {
        return uerrno(-ENOTDIR);
    }

    // Update guest_cwd based on input path
    if (path[0] == '/') {
        // Absolute path - just use it directly
        ukernel::process.guest_cwd = path;
    } else {
        // Relative path - combine with current guest_cwd
        if (ukernel::process.guest_cwd == "/") {
            ukernel::process.guest_cwd = "/" + std::string(path);
        } else {
            ukernel::process.guest_cwd += "/" + std::string(path);
        }
    }

    log_ukernel("chdir: updated guest_cwd to '%s'", ukernel::process.guest_cwd.c_str());
    return 0;
}

static uabi_long linux_getdents64(uabi_uint fd, struct linux_dirent64 __user *dirp, uabi_uint count)
{
	struct linux_dirent64 *host_dirp = (struct linux_dirent64 *)mmu::g2h(reinterpret_cast<uintptr_t>(dirp));
	return rcerrno(getdents64(fd, host_dirp, count));
}

static uabi_long linux_unlinkat(int dfd, const char __user *path, int flags)
{
	char pathbuf[PATH_MAX];
	if (PathResolution(dfd, path, pathbuf) < 0) {
		return rcerrno(-errno);
	}
	
	log_ukernel("unlinkat: ignoring delete request for: %s", pathbuf);
	return rcerrno(unlinkat(dfd, pathbuf, flags));
}

} // namespace ukernel_syscall

void ukernel::Syscall(CPUState *state)
{
#ifdef DBT_LINUX_GUEST
	ukernel::SyscallLinux(state);
#else
	ukernel::SyscallDemo(state);
#endif
}

#define IMPLEMENTED_SYSCALLS(X)                                                                            \
	X(linux_fcntl64)                                                                                      \
	X(linux_ioctl)                                                                                         \
	X(linux_openat)                                                                                      \
	X(linux_close)                                                                                       \
	X(linux_llseek)                                                                                      \
	X(linux_read)                                                                                        \
	X(linux_write)                                                                                       \
	X(linux_writev)                                                                                      \
	X(linux_readlinkat)                                                                                  \
	X(linux_fstat64)                                                                                     \
	X(linux_set_tid_address)                                                                             \
	X(linux_exit)                                                                                        \
	X(linux_exit_group)                                                                                  \
	X(linux_tgkill)                                                                                      \	
	X(linux_rt_sigaction)                                                                                \
	X(linux_uname)                                                                                       \
	X(linux_getpid)																						\
	X(linux_getuid)                                                                                      \
	X(linux_geteuid)                                                                                     \
	X(linux_getgid)                                                                                      \
	X(linux_getegid)                                                                                     \
	X(linux_gettid)                                                                                      \	
	X(linux_sysinfo)                                                                                     \
	X(linux_brk)                                                                                         \
	X(linux_munmap)                                                                                      \
	X(linux_mremap)                                                                                      \
	X(linux_mmap2)                                                                                       \
	X(linux_mprotect)                                                                                    \
	X(linux_prlimit64)                                                                                   \
	X(linux_renameat2)                                                                                   \
	X(linux_getrandom)                                                                                   \
	X(linux_statx)                                                                                       \
	X(linux_clock_gettime64)                                                                             \
	X(linux_gettimeofday)                                                                                \
	X(linux_rt_sigprocmask)                                                                              \
	X(linux_ftruncate64)                                                                                 \
	X(linux_getcwd)                                                                                      \
	X(linux_chdir)                                                                                       \
	X(linux_getdents64)                                                                                 \
	X(linux_unlinkat)

#define SKIPPED_SYSCALLS(X) X(linux_set_robust_list)

void ukernel::SyscallLinux(CPUState *state)
{
	state->trapno = rv32::TrapCode::NONE;
	std::array<uabi_long, 7> args = {(uabi_long)state->gpr[10], (uabi_long)state->gpr[11],
					 (uabi_long)state->gpr[12], (uabi_long)state->gpr[13],
					 (uabi_long)state->gpr[14], (uabi_long)state->gpr[15],
					 (uabi_long)state->gpr[16]};
	uabi_long syscallno = state->gpr[17];

	auto dump_syscall = [state, syscallno](char const *name) {
		log_ukernel("%s (no=%d)\t ip=%08x", name, syscallno, state->ip);
	};

	auto do_syscall = [&args]<typename RV, typename... Args>(RV (*h)(Args...)) {
		static_assert(sizeof...(Args) <= args.size());
		auto conv = []<typename A>(uabi_ulong in) -> A {
			if constexpr (std::is_pointer_v<A>) {
				return (A)mmu::g2h(in);
			} else {
				return static_cast<A>(in);
			}
		};
		return ([&]<size_t... Idx>(std::index_sequence<Idx...>) {
			return h(decltype(conv)().template operator()<Args>(args[Idx])...);
		})(std::make_index_sequence<sizeof...(Args)>{});
	};

	auto dispatch = [&]() -> uabi_long {
		switch (SyscallID(syscallno)) {
#define HANDLE(name)                                                                                         \
	case SyscallID::name:                                                                                \
		dump_syscall(#name);                                                                         \
		return do_syscall(ukernel_syscall::name);
			IMPLEMENTED_SYSCALLS(HANDLE)
#undef HANDLE

#define SKIP(name)                                                                                           \
	case SyscallID::name:                                                                                \
		dump_syscall("skip " #name);                                                                 \
		return -ENOSYS;
			SKIPPED_SYSCALLS(SKIP)
#undef SKIP

		default:
			SyscallUnhandled(syscallno);
		}
	};

	uabi_long rc = dispatch();
	state->gpr[10] = rc;
	log_ukernel("    ret: %4d", rc);
}

void ukernel::InitElfMappings(const char *path, ElfImage *elf)
{
	DBT_FS_LOCK();
	int fd = open(path, O_RDONLY);
	if (fd < 0) {
		Panic("no such elf file");
	}

	{ // TODO: for AT_FDCWD resolution, remove it
		char buf[PATH_MAX];
		strncpy(buf, path, sizeof(buf));
		chdir(dirname(buf));
	}

	LoadElf(fd, elf);
	objprof::Announce(fd, true);
	process.exe_fd = fd;
	process.brk = elf->brk;

	static constexpr u32 stk_size = 32_MB; // Increased from 8MB to 32MB for large applications like xalancbmk
#if 0
	void *stk_ptr = mmu::MMap(0, stk_size, PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE);
#else
	[[maybe_unused]] void *stk_guard = mmu::mmap(mmu::ASPACE_SIZE - mmu::PAGE_SIZE, mmu::PAGE_SIZE, 0,
						     MAP_ANON | MAP_PRIVATE | MAP_FIXED);
	// ASAN somehow breaks MMap lookup if it's not MAP_FIXED
	void *stk_ptr = mmu::mmap(mmu::ASPACE_SIZE - mmu::PAGE_SIZE - stk_size, stk_size,
				  PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE | MAP_FIXED);
#endif
	elf->stack_start = mmu::h2g(stk_ptr) + stk_size;
}

void ukernel::MainThreadBoot(int argv_n, char **argv)
{
	process.main_thread = std::make_unique<uthread>();
	auto state = CPUState::Current();

	auto *elf = &process.elf_image;

	assert(argv_n > 0);
	std::string elf_path = process.fsroot + '/' + argv[0];
	InitElfMappings(elf_path.c_str(), elf);

#ifdef DBT_LINUX_GUEST
	InitAVectors(elf, argv_n, argv);
#endif
	InitMainThread(state, elf);
}

int ukernel::MainThreadExecute()
{
	auto state = CPUState::Current();
	auto ut = state->GetUThread();
	assert(ut == process.main_thread.get());
	// log the execute time
	auto start_time = std::chrono::high_resolution_clock::now();
	Execute();
	auto end_time = std::chrono::high_resolution_clock::now();
	auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end_time - start_time);
	log_dbt("rvdbt execute time: %ld ms", duration.count());
	if (config::trace) {
		log_dbt("ip2ip_counts size: %lu", state->ip2ip_counts.size());
		std::map<u32, u32> ip_counts;
		for (auto &[ip, gip_map] : state->ip2ip_counts) {
			for (auto &[gip, count] : gip_map) {
				log_dbt("ip=%08x, gip=%08x, count=%lu", ip, gip, count);
				ip_counts[gip] += count;
			}
		}
		for (auto &[gip, count] : ip_counts) {
			log_dbt("gip=%08x, count=%lu", gip, count);
		}
		for (auto &[ip, tb] : *state->cache_tb_exec_count) {
			if (tb && tb->flags.exec_count > 0) {
				log_dbt("ip=%08x, count=%lu", ip, tb->flags.exec_count);
			}
		}
	}
	assert(ut->terminating);
	// TODO(threading): make it a single exit point
	int rc = ut->termination_code;
	(void)process.main_thread.release();
	return rc;
}

void ukernel::EnqueueTermination(int code)
{
	auto ut = CPUState::Current()->GetUThread();
	ut->terminating = true;
	ut->termination_code = code;
	log_ukernel("thread issued termination with code=%d", code);
	// TODO(threading): issue a signal
	assert(ut == process.main_thread.get());
}

void ukernel::ReproduceElfMappings(const char *path)
{
	ElfImage elf;
	int fd = open(path, O_RDONLY);
	if (fd < 0) {
		Panic("no such elf file");
	}
	LoadElf(fd, &elf);
	objprof::Announce(fd, false);
	close(fd);
}

void ukernel::LoadElf(int fd, ElfImage *elf)
{
	auto &ehdr = elf->ehdr;

	if (pread(fd, &elf->ehdr, sizeof(ehdr), 0) != sizeof(ehdr)) {
		Panic("can't read elf header");
	}
	if (memcmp(ehdr.e_ident,
		   "\x7f"
		   "ELF",
		   4)) {
		Panic("that's not elf");
	}
	if (ehdr.e_machine != EM_RISCV) {
		Panic("elf's machine doesn't match");
	}
	if (ehdr.e_type != ET_EXEC) {
		Panic("unuspported elf type");
	}

	ssize_t phtab_sz = sizeof(Elf32_Phdr) * ehdr.e_phnum;
	auto *phtab = (Elf32_Phdr *)alloca(phtab_sz);
	if (pread(fd, phtab, phtab_sz, ehdr.e_phoff) != phtab_sz) {
		Panic("can't read phtab");
	}
	elf->load_addr = -1;
	elf->brk = 0;
	elf->entry = elf->ehdr.e_entry;

	for (size_t i = 0; i < ehdr.e_phnum; ++i) {
		auto *phdr = &phtab[i];
		if (phdr->p_type != PT_LOAD)
			continue;

		int prot = 0;
		if (phdr->p_flags & PF_R) {
			prot |= PROT_READ;
		}
		if (phdr->p_flags & PF_W) {
			prot |= PROT_WRITE;
		}
		if (phdr->p_flags & PF_X) {
			prot |= PROT_EXEC;
		}

		auto vaddr = phdr->p_vaddr;
		auto vaddr_ps = rounddown(phdr->p_vaddr, mmu::PAGE_SIZE);
		auto vaddr_po = vaddr - vaddr_ps;

		if (phdr->p_filesz != 0) {
			u32 len = roundup(phdr->p_filesz + vaddr_po, mmu::PAGE_SIZE);
			// shared flags
			mmu::mmap(vaddr_ps, len, prot, MAP_FIXED | MAP_PRIVATE, fd,
				  phdr->p_offset - vaddr_po);
			if (phdr->p_memsz > phdr->p_filesz) {
				auto bss_start = vaddr + phdr->p_filesz;
				auto bss_end = vaddr_ps + phdr->p_memsz;
				auto bss_start_nextp = roundup(bss_start, (u32)mmu::PAGE_SIZE);
				auto bss_len = roundup(bss_end - bss_start, (u32)mmu::PAGE_SIZE);
				mmu::mmap(bss_start_nextp, bss_len, prot, MAP_FIXED | MAP_PRIVATE | MAP_ANON);
				u32 prev_sz = bss_start_nextp - bss_start;
				if (prev_sz != 0) {
					memset(mmu::g2h(bss_start), 0, prev_sz);
				}
			}
		} else if (phdr->p_memsz != 0) {
			u32 len = roundup(phdr->p_memsz + vaddr_po, (u32)mmu::PAGE_SIZE);
			mmu::mmap(vaddr_ps, len, prot, MAP_FIXED | MAP_PRIVATE | MAP_ANON);
		}

		elf->load_addr = std::min(elf->load_addr, vaddr - phdr->p_offset);
		elf->brk = std::max(elf->brk, vaddr + phdr->p_memsz);
	}
}

static uabi_ulong AllocAVectorStr(uabi_ulong stk, void const *str, u16 sz)
{
	stk -= sz;
	memcpy(mmu::g2h(stk), str, sz);
	return stk;
}

static inline uabi_ulong AllocAVectorStr(uabi_ulong stk, char const *str)
{
	return AllocAVectorStr(stk, str, strlen(str) + 1);
}

// TODO: refactor
void ukernel::InitAVectors(ElfImage *elf, int argv_n, char **argv)
{
	uabi_ulong stk = elf->stack_start;

	uabi_ulong foo_str_g = stk = AllocAVectorStr(stk, "__foo_str__");
	uabi_ulong lc_all_str_g = stk = AllocAVectorStr(stk, "LC_ALL=C");
	char auxv_salt[16] = {0, 1, 2, 3, 4, 5, 6};
	uabi_ulong auxv_salt_g = stk = AllocAVectorStr(stk, auxv_salt, sizeof(auxv_salt));

	u32 *argv_strings_g = (u32 *)alloca(sizeof(char *) * argv_n);
	for (int i = 0; i < argv_n; ++i) {
		argv_strings_g[i] = stk = AllocAVectorStr(stk, argv[i]);
	}

	stk &= -4;

	int envp_n = 1;
	int auxv_n = 64;

	int stk_vsz = argv_n + envp_n + auxv_n + 3;
	stk -= stk_vsz * sizeof(uabi_ulong);
	stk &= -16;
	uabi_ulong argc_p = stk;
	uabi_ulong argv_p = argc_p + sizeof(uabi_ulong);
	uabi_ulong envp_p = argv_p + sizeof(uabi_ulong) * (argv_n + 1);
	uabi_ulong auxv_p = envp_p + sizeof(uabi_ulong) * (envp_n + 1);

	auto push_avval = [](uint32_t &vec, uint32_t val) {
		*(uabi_ulong *)mmu::g2h(vec) = (val);
		vec += sizeof(uabi_ulong);
	};
	auto push_auxv = [&](uint16_t idx, uint32_t val) {
		push_avval(auxv_p, idx);
		push_avval(auxv_p, val);
		/* log_ukernel("put auxv %08x=%08x", (idx), (val)); */
	};

	push_avval(argc_p, argv_n);

	for (int i = 0; i < argv_n; ++i) {
		push_avval(argv_p, argv_strings_g[i]);
	}
	push_avval(argv_p, 0);

	push_avval(envp_p, lc_all_str_g);
	push_avval(envp_p, 0);

	push_auxv(AT_PHDR, elf->ehdr.e_phoff + elf->load_addr);
	push_auxv(AT_PHENT, sizeof(Elf32_Phdr));
	push_auxv(AT_PHNUM, elf->ehdr.e_phnum);
	push_auxv(AT_PAGESZ, mmu::PAGE_SIZE);
	push_auxv(AT_BASE, 0);
	push_auxv(AT_FLAGS, 0);
	push_auxv(AT_ENTRY, elf->entry);

	push_auxv(AT_UID, getuid());
	push_auxv(AT_GID, getgid());
	push_auxv(AT_EUID, geteuid());
	push_auxv(AT_EGID, getegid());

	push_auxv(AT_EXECFN, foo_str_g);
	push_auxv(AT_SECURE, false);
	push_auxv(AT_HWCAP, 0);
	push_auxv(AT_CLKTCK, sysconf(_SC_CLK_TCK));
	push_auxv(AT_RANDOM, auxv_salt_g);

	push_auxv(AT_NULL, 0);

	elf->stack_start = stk;
}

} // namespace dbt
