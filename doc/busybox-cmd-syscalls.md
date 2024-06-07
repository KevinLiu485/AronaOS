关于系统调用的详细信息，请参考[Linux手册](https://man7.org/linux/man-pages/man2/syscalls.2.html)。
> 要梯子
# busybox testcode syscalls
busybox testcode 实际调用的系统调用列表，少于busybox使用的系统调用。
<!-- brk -->
 - clock_gettime
<!-- close -->
<!-- dup3 -->
<!-- execve -->
 - faccessat
 - fcntl
 - fstat
<!-- getcwd -->
 - getdents64
<!-- getpid -->
<!-- getppid -->
 - getuid
 - ioctl
 - kill
 - lseek
<!-- mkdirat -->
<!-- mmap -->
 - mprotect
<!-- munmap -->
<!-- nanosleep -->
 - newfstatat
<!-- openat -->
<!-- read -->
 - readv
 - renameat2
 - rt_sigaction
 - rt_sigprocmask
 - sendfile
 - set_tid_address
 - statfs
 - sysinfo
 - syslog
<!-- uname -->
<!-- unlinkat -->
 - utimensat
<!-- write -->
 - writev

