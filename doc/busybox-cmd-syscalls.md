关于系统调用的详细信息，请参考[Linux手册](https://man7.org/linux/man-pages/man2/syscalls.2.html)。
> 要梯子
# busybox testcode syscalls
busybox testcode 实际调用的系统调用列表，少于busybox使用的系统调用。
<!-- brk -->
 <!-- - clock_gettime 113 -->
<!-- close -->
<!-- dup3 -->
<!-- execve -->
 <!-- - faccessat 48 -->
 <!-- - fcntl 25 -->
 <!-- - fstat 80 -->
<!-- getcwd -->
 <!-- - getdents64 61 -->
<!-- getpid -->
<!-- getppid -->
 <!-- - getuid 174 -->
 <!-- - ioctl 29 -->
 - kill 129
 - lseek 62
<!-- mkdirat -->
<!-- mmap -->
 - mprotect 226
<!-- munmap -->
<!-- nanosleep -->
 <!-- - newfstatat 79 -->
<!-- openat -->
<!-- read -->
 - readv 65
 - renameat2 276
 - rt_sig
 - action 134
 - rt_sigprocmask 135
 - sendfile 71
 - set_tid_address 96
 - statfs 43
 <!-- - sysinfo 179
 - syslog 116 -->
<!-- uname -->
<!-- unlinkat -->
 - utimensat 88
<!-- write -->
 <!-- - writev 66 -->
 <!-- - geteuid 175 -->
 - ppoll 73