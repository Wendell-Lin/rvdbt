#pragma once

#define RV32_LINUX_SYSCALL_NO(SC, SC_ARCH)                                                                   \
	SC(io_setup, 0)                                                                                      \
	SC(io_destroy, 1)                                                                                    \
	SC(io_submit, 2)                                                                                     \
	SC(io_cancel, 3)                                                                                     \
	SC(setxattr, 5)                                                                                      \
	SC(lsetxattr, 6)                                                                                     \
	SC(fsetxattr, 7)                                                                                     \
	SC(getxattr, 8)                                                                                      \
	SC(lgetxattr, 9)                                                                                     \
	SC(fgetxattr, 10)                                                                                    \
	SC(listxattr, 11)                                                                                    \
	SC(llistxattr, 12)                                                                                   \
	SC(flistxattr, 13)                                                                                   \
	SC(removexattr, 14)                                                                                  \
	SC(lremovexattr, 15)                                                                                 \
	SC(fremovexattr, 16)                                                                                 \
	SC(getcwd, 17)                                                                                       \
	SC(lookup_dcookie, 18)                                                                               \
	SC(eventfd2, 19)                                                                                     \
	SC(epoll_create1, 20)                                                                                \
	SC(epoll_ctl, 21)                                                                                    \
	SC(epoll_pwait, 22)                                                                                  \
	SC(dup, 23)                                                                                          \
	SC(dup3, 24)                                                                                         \
	SC(fcntl64, 25)                                                                                      \
	SC(inotify_init1, 26)                                                                                \
	SC(inotify_add_watch, 27)                                                                            \
	SC(inotify_rm_watch, 28)                                                                             \
	SC(ioctl, 29)                                                                                        \
	SC(ioprio_set, 30)                                                                                   \
	SC(ioprio_get, 31)                                                                                   \
	SC(flock, 32)                                                                                        \
	SC(mknodat, 33)                                                                                      \
	SC(mkdirat, 34)                                                                                      \
	SC(unlinkat, 35)                                                                                     \
	SC(symlinkat, 36)                                                                                    \
	SC(linkat, 37)                                                                                       \
	SC(umount2, 39)                                                                                      \
	SC(mount, 40)                                                                                        \
	SC(pivot_root, 41)                                                                                   \
	SC(nfsservctl, 42)                                                                                   \
	SC(statfs64, 43)                                                                                     \
	SC(fstatfs64, 44)                                                                                    \
	SC(truncate64, 45)                                                                                   \
	SC(ftruncate64, 46)                                                                                  \
	SC(fallocate, 47)                                                                                    \
	SC(faccessat, 48)                                                                                    \
	SC(chdir, 49)                                                                                        \
	SC(fchdir, 50)                                                                                       \
	SC(chroot, 51)                                                                                       \
	SC(fchmod, 52)                                                                                       \
	SC(fchmodat, 53)                                                                                     \
	SC(fchownat, 54)                                                                                     \
	SC(fchown, 55)                                                                                       \
	SC(openat, 56)                                                                                       \
	SC(close, 57)                                                                                        \
	SC(vhangup, 58)                                                                                      \
	SC(pipe2, 59)                                                                                        \
	SC(quotactl, 60)                                                                                     \
	SC(getdents64, 61)                                                                                   \
	SC(llseek, 62)                                                                                       \
	SC(read, 63)                                                                                         \
	SC(write, 64)                                                                                        \
	SC(readv, 65)                                                                                        \
	SC(writev, 66)                                                                                       \
	SC(pread64, 67)                                                                                      \
	SC(pwrite64, 68)                                                                                     \
	SC(preadv, 69)                                                                                       \
	SC(pwritev, 70)                                                                                      \
	SC(sendfile64, 71)                                                                                   \
	SC(signalfd4, 74)                                                                                    \
	SC(vmsplice, 75)                                                                                     \
	SC(splice, 76)                                                                                       \
	SC(tee, 77)                                                                                          \
	SC(readlinkat, 78)                                                                                   \
	SC(fstatat64, 79)                                                                                    \
	SC(fstat64, 80)                                                                                      \
	SC(sync, 81)                                                                                         \
	SC(fsync, 82)                                                                                        \
	SC(fdatasync, 83)                                                                                    \
	SC(sync_file_range, 84)                                                                              \
	SC(timerfd_create, 85)                                                                               \
	SC(acct, 89)                                                                                         \
	SC(capget, 90)                                                                                       \
	SC(capset, 91)                                                                                       \
	SC(personality, 92)                                                                                  \
	SC(exit, 93)                                                                                         \
	SC(exit_group, 94)                                                                                   \
	SC(waitid, 95)                                                                                       \
	SC(set_tid_address, 96)                                                                              \
	SC(unshare, 97)                                                                                      \
	SC(set_robust_list, 99)                                                                              \
	SC(get_robust_list, 100)                                                                             \
	SC(getitimer, 102)                                                                                   \
	SC(setitimer, 103)                                                                                   \
	SC(kexec_load, 104)                                                                                  \
	SC(init_module, 105)                                                                                 \
	SC(delete_module, 106)                                                                               \
	SC(timer_create, 107)                                                                                \
	SC(timer_getoverrun, 109)                                                                            \
	SC(timer_delete, 111)                                                                                \
	SC(syslog, 116)                                                                                      \
	SC(ptrace, 117)                                                                                      \
	SC(sched_setparam, 118)                                                                              \
	SC(sched_setscheduler, 119)                                                                          \
	SC(sched_getscheduler, 120)                                                                          \
	SC(sched_getparam, 121)                                                                              \
	SC(sched_setaffinity, 122)                                                                           \
	SC(sched_getaffinity, 123)                                                                           \
	SC(sched_yield, 124)                                                                                 \
	SC(sched_get_priority_max, 125)                                                                      \
	SC(sched_get_priority_min, 126)                                                                      \
	SC(restart_syscall, 128)                                                                             \
	SC(kill, 129)                                                                                        \
	SC(tkill, 130)                                                                                       \
	SC(tgkill, 131)                                                                                      \
	SC(sigaltstack, 132)                                                                                 \
	SC(rt_sigsuspend, 133)                                                                               \
	SC(rt_sigaction, 134)                                                                                \
	SC(rt_sigprocmask, 135)                                                                              \
	SC(rt_sigpending, 136)                                                                               \
	SC(rt_sigqueueinfo, 138)                                                                             \
	SC(rt_sigreturn, 139)                                                                                \
	SC(setpriority, 140)                                                                                 \
	SC(getpriority, 141)                                                                                 \
	SC(reboot, 142)                                                                                      \
	SC(setregid, 143)                                                                                    \
	SC(setgid, 144)                                                                                      \
	SC(setreuid, 145)                                                                                    \
	SC(setuid, 146)                                                                                      \
	SC(setresuid, 147)                                                                                   \
	SC(getresuid, 148)                                                                                   \
	SC(setresgid, 149)                                                                                   \
	SC(getresgid, 150)                                                                                   \
	SC(setfsuid, 151)                                                                                    \
	SC(setfsgid, 152)                                                                                    \
	SC(times, 153)                                                                                       \
	SC(setpgid, 154)                                                                                     \
	SC(getpgid, 155)                                                                                     \
	SC(getsid, 156)                                                                                      \
	SC(setsid, 157)                                                                                      \
	SC(getgroups, 158)                                                                                   \
	SC(setgroups, 159)                                                                                   \
	SC(uname, 160)                                                                                       \
	SC(sethostname, 161)                                                                                 \
	SC(setdomainname, 162)                                                                               \
	SC(getrlimit, 163)                                                                                   \
	SC(setrlimit, 164)                                                                                   \
	SC(getrusage, 165)                                                                                   \
	SC(umask, 166)                                                                                       \
	SC(prctl, 167)                                                                                       \
	SC(getcpu, 168)                                                                                      \
	SC(gettimeofday, 169)                                                                                \
	SC(getpid, 172)                                                                                      \
	SC(getppid, 173)                                                                                     \
	SC(getuid, 174)                                                                                      \
	SC(geteuid, 175)                                                                                     \
	SC(getgid, 176)                                                                                      \
	SC(getegid, 177)                                                                                     \
	SC(gettid, 178)                                                                                      \
	SC(sysinfo, 179)                                                                                     \
	SC(mq_open, 180)                                                                                     \
	SC(mq_unlink, 181)                                                                                   \
	SC(mq_notify, 184)                                                                                   \
	SC(mq_getsetattr, 185)                                                                               \
	SC(msgget, 186)                                                                                      \
	SC(msgctl, 187)                                                                                      \
	SC(msgrcv, 188)                                                                                      \
	SC(msgsnd, 189)                                                                                      \
	SC(semget, 190)                                                                                      \
	SC(semctl, 191)                                                                                      \
	SC(semop, 193)                                                                                       \
	SC(shmget, 194)                                                                                      \
	SC(shmctl, 195)                                                                                      \
	SC(shmat, 196)                                                                                       \
	SC(shmdt, 197)                                                                                       \
	SC(socket, 198)                                                                                      \
	SC(socketpair, 199)                                                                                  \
	SC(bind, 200)                                                                                        \
	SC(listen, 201)                                                                                      \
	SC(accept, 202)                                                                                      \
	SC(connect, 203)                                                                                     \
	SC(getsockname, 204)                                                                                 \
	SC(getpeername, 205)                                                                                 \
	SC(sendto, 206)                                                                                      \
	SC(recvfrom, 207)                                                                                    \
	SC(setsockopt, 208)                                                                                  \
	SC(getsockopt, 209)                                                                                  \
	SC(shutdown, 210)                                                                                    \
	SC(sendmsg, 211)                                                                                     \
	SC(recvmsg, 212)                                                                                     \
	SC(readahead, 213)                                                                                   \
	SC(brk, 214)                                                                                         \
	SC(munmap, 215)                                                                                      \
	SC(mremap, 216)                                                                                      \
	SC(add_key, 217)                                                                                     \
	SC(request_key, 218)                                                                                 \
	SC(keyctl, 219)                                                                                      \
	SC(clone, 220)                                                                                       \
	SC(execve, 221)                                                                                      \
	SC(mmap2, 222)                                                                                       \
	SC(fadvise64_64, 223)                                                                                \
	SC(swapon, 224)                                                                                      \
	SC(swapoff, 225)                                                                                     \
	SC(mprotect, 226)                                                                                    \
	SC(msync, 227)                                                                                       \
	SC(mlock, 228)                                                                                       \
	SC(munlock, 229)                                                                                     \
	SC(mlockall, 230)                                                                                    \
	SC(munlockall, 231)                                                                                  \
	SC(mincore, 232)                                                                                     \
	SC(madvise, 233)                                                                                     \
	SC(remap_file_pages, 234)                                                                            \
	SC(mbind, 235)                                                                                       \
	SC(get_mempolicy, 236)                                                                               \
	SC(set_mempolicy, 237)                                                                               \
	SC(migrate_pages, 238)                                                                               \
	SC(move_pages, 239)                                                                                  \
	SC(rt_tgsigqueueinfo, 240)                                                                           \
	SC(perf_event_open, 241)                                                                             \
	SC(accept4, 242)                                                                                     \
	SC(prlimit64, 261)                                                                                   \
	SC(fanotify_init, 262)                                                                               \
	SC(fanotify_mark, 263)                                                                               \
	SC(name_to_handle_at, 264)                                                                           \
	SC(open_by_handle_at, 265)                                                                           \
	SC(syncfs, 267)                                                                                      \
	SC(setns, 268)                                                                                       \
	SC(sendmmsg, 269)                                                                                    \
	SC(process_vm_readv, 270)                                                                            \
	SC(process_vm_writev, 271)                                                                           \
	SC(kcmp, 272)                                                                                        \
	SC(finit_module, 273)                                                                                \
	SC(sched_setattr, 274)                                                                               \
	SC(sched_getattr, 275)                                                                               \
	SC(renameat2, 276)                                                                                   \
	SC(seccomp, 277)                                                                                     \
	SC(getrandom, 278)                                                                                   \
	SC(memfd_create, 279)                                                                                \
	SC(bpf, 280)                                                                                         \
	SC(execveat, 281)                                                                                    \
	SC(userfaultfd, 282)                                                                                 \
	SC(membarrier, 283)                                                                                  \
	SC(mlock2, 284)                                                                                      \
	SC(copy_file_range, 285)                                                                             \
	SC(preadv2, 286)                                                                                     \
	SC(pwritev2, 287)                                                                                    \
	SC(pkey_mprotect, 288)                                                                               \
	SC(pkey_alloc, 289)                                                                                  \
	SC(pkey_free, 290)                                                                                   \
	SC(statx, 291)                                                                                       \
	SC(rseq, 293)                                                                                        \
	SC(kexec_file_load, 294)                                                                             \
	SC(clock_gettime64, 403)                                                                             \
	SC(clock_settime64, 404)                                                                             \
	SC(clock_adjtime64, 405)                                                                             \
	SC(clock_getres_time64, 406)                                                                         \
	SC(clock_nanosleep_time64, 407)                                                                      \
	SC(timer_gettime64, 408)                                                                             \
	SC(timer_settime64, 409)                                                                             \
	SC(timerfd_gettime64, 410)                                                                           \
	SC(timerfd_settime64, 411)                                                                           \
	SC(utimensat_time64, 412)                                                                            \
	SC(pselect6_time64, 413)                                                                             \
	SC(ppoll_time64, 414)                                                                                \
	SC(io_pgetevents_time64, 416)                                                                        \
	SC(recvmmsg_time64, 417)                                                                             \
	SC(mq_timedsend_time64, 418)                                                                         \
	SC(mq_timedreceive_time64, 419)                                                                      \
	SC(semtimedop_time64, 420)                                                                           \
	SC(rt_sigtimedwait_time64, 421)                                                                      \
	SC(futex_time64, 422)                                                                                \
	SC(sched_rr_get_interval_time64, 423)                                                                \
	SC(pidfd_send_signal, 424)                                                                           \
	SC(io_uring_setup, 425)                                                                              \
	SC(io_uring_enter, 426)                                                                              \
	SC(io_uring_register, 427)                                                                           \
	SC(open_tree, 428)                                                                                   \
	SC(move_mount, 429)                                                                                  \
	SC(fsopen, 430)                                                                                      \
	SC(fsconfig, 431)                                                                                    \
	SC(fsmount, 432)                                                                                     \
	SC(fspick, 433)                                                                                      \
	SC(pidfd_open, 434)                                                                                  \
	SC(clone3, 435)                                                                                      \
	SC(close_range, 436)                                                                                 \
	SC(openat2, 437)                                                                                     \
	SC(pidfd_getfd, 438)                                                                                 \
	SC(faccessat2, 439)                                                                                  \
	SC(process_madvise, 440)                                                                             \
	SC(epoll_pwait2, 441)                                                                                \
	SC(mount_setattr, 442)                                                                               \
	SC(landlock_create_ruleset, 444)                                                                     \
	SC(landlock_add_rule, 445)                                                                           \
	SC(landlock_restrict_self, 446)                                                                      \
	SC_ARCH(riscv_flush_icache, 244 + 15)

#define RV32_LINUX_SYSCALL_NO_END 447