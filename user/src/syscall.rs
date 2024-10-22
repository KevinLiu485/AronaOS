#![allow(unused)]

use core::arch::asm;

use alloc::vec::Vec;

use crate::{
    CloneFlags, Dirent, Kstat, OpenFlags, TimeSpec, TimeVal, Tms, Utsname, WaitOption, MMAPFLAGS,
    MMAPPROT,
};

// const SYSCALL_OPEN: usize = 56;
// const SYSCALL_CLOSE: usize = 57;
// const SYSCALL_READ: usize = 63;
// const SYSCALL_WRITE: usize = 64;
// const SYSCALL_EXIT: usize = 93;
// const SYSCALL_YIELD: usize = 124;
// const SYSCALL_GET_TIME: usize = 169;
// const SYSCALL_GETPID: usize = 172;
// const SYSCALL_FORK: usize = 220;
// const SYSCALL_EXEC: usize = 221;
// const SYSCALL_WAITPID: usize = 260;

const SYS_GETCWD: usize = 17;
const SYS_PIPE2: usize = 59;
const SYS_DUP: usize = 23;
const SYS_DUP3: usize = 24;
const SYS_CHDIR: usize = 49;
const SYS_OPENAT: usize = 56;
const SYS_CLOSE: usize = 57;
const SYS_GETDENTS64: usize = 61;
const SYS_READ: usize = 63;
const SYS_WRITE: usize = 64;
const SYS_LINKAT: usize = 37;
const SYS_UNLINKAT: usize = 35;
const SYS_MKDIRAT: usize = 34;
const SYS_UMOUNT2: usize = 39;
const SYS_MOUNT: usize = 40;
const SYS_FSTAT: usize = 80;

const SYS_CLONE: usize = 220;
const SYS_EXECVE: usize = 221;
const SYS_WAIT4: usize = 260;
const SYS_EXIT: usize = 93;
const SYS_GETPPID: usize = 173;
const SYS_GETPID: usize = 172;

const SYS_BRK: usize = 214;
const SYS_MUNMAP: usize = 215;
const SYS_MMAP: usize = 222;
const SYS_TIMES: usize = 153;
const SYS_UNAME: usize = 160;
const SYS_SCHED_YIELD: usize = 124;
const SYS_GETTIMEOFDAY: usize = 169;
const SYS_NANOSLEEP: usize = 101;

const SYS_SET_TID_ADDRESS: usize = 96;
const SYS_GETUID: usize = 174;
const SYS_IOCTL: usize = 29;
const SYS_EXIT_GROUP: usize = 94;
const SYS_SIGACTION: usize = 134;
const SYS_SIGPROCMASK: usize = 135;
const SYS_FCNTL: usize = 25;
const SYS_WRITEV: usize = 66;
const SYS_GETEUID: usize = 175;
const SYS_PPOLL: usize = 73;
const SYS_CLOCK_GETTIME: usize = 113;
const SYS_SYSINFO: usize = 179;
const SYS_SYSLOG: usize = 116;
const SYS_FSTATAT: usize = 79;
const SYS_FACCESSAT: usize = 48;
const SYS_KILL: usize = 129;
const SYS_MPROTECT: usize = 226;
const SYS_UTIMENSAT: usize = 88;
const SYS_SENDFILE: usize = 71;
const SYS_LSEEK: usize = 62;

fn syscall(id: usize, args: [usize; 6]) -> isize {
    let mut ret: isize;
    unsafe {
        asm!(
            "ecall",
            inlateout("x10") args[0] => ret,
            in("x11") args[1],
            in("x12") args[2],
            in("x13") args[3],
            in("x14") args[4],
            in("x15") args[5],
            in("x17") id
        );
    }
    ret
}

pub fn sys_getcwd(buffer: &mut [u8]) -> *const u8 {
    syscall(
        SYS_GETCWD,
        [buffer.as_ptr() as usize, buffer.len(), 0, 0, 0, 0],
    ) as *const u8
}

pub fn sys_pipe2(fd: &mut [i32; 2]) -> isize {
    syscall(SYS_PIPE2, [fd.as_ptr() as usize, 0, 0, 0, 0, 0])
}

pub fn sys_dup(fd: i32) -> isize {
    syscall(SYS_DUP, [fd as usize, 0, 0, 0, 0, 0])
}

pub fn sys_dup3(oldfd: i32, newfd: i32) -> isize {
    syscall(SYS_DUP3, [oldfd as usize, newfd as usize, 0, 0, 0, 0])
}

pub fn sys_chdir(path: &str) -> isize {
    syscall(SYS_CHDIR, [path.as_ptr() as usize, 0, 0, 0, 0, 0])
}
// pub fn sys_chdir(path: &Vec<u8>) -> isize {
//     syscall(SYS_CHDIR, [path.as_ptr() as usize, 0, 0, 0, 0, 0])
// }

pub fn sys_openat(fd: i32, filename: &str, flags: OpenFlags, mode: i32) -> isize {
    syscall(
        SYS_OPENAT,
        [
            fd as usize,
            filename.as_ptr() as usize,
            flags.bits() as usize,
            mode as usize,
            0,
            0,
        ],
    )
}

pub fn sys_close(fd: i32) -> isize {
    syscall(SYS_CLOSE, [fd as usize, 0, 0, 0, 0, 0])
}

/// fake
pub fn sys_getdents64(fd: i32, dirent_buf: &mut [Dirent]) -> isize {
    syscall(
        SYS_GETDENTS64,
        [
            fd as usize,
            dirent_buf.as_ptr() as usize,
            dirent_buf.len(),
            0,
            0,
            0,
        ],
    )
}

pub fn sys_read(fd: i32, buf: &mut [u8]) -> isize {
    syscall(
        SYS_READ,
        [fd as usize, buf.as_ptr() as usize, buf.len(), 0, 0, 0],
    )
}

pub fn sys_write(fd: i32, buf: &[u8]) -> isize {
    syscall(
        SYS_WRITE,
        [fd as usize, buf.as_ptr() as usize, buf.len(), 0, 0, 0],
    )
}

/// fake
pub fn sys_linkat() -> isize {
    syscall(SYS_LINKAT, [0, 0, 0, 0, 0, 0])
}

pub fn sys_unlinkat(dirfd: i32, path: &str, flags: i32) -> isize {
    syscall(
        SYS_UNLINKAT,
        [
            dirfd as usize,
            path.as_ptr() as usize,
            flags as usize,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_mkdirat(dirfd: i32, path: &str, mode: i32) -> isize {
    syscall(
        SYS_MKDIRAT,
        [
            dirfd as usize,
            path.as_ptr() as usize,
            mode as usize,
            0,
            0,
            0,
        ],
    )
}

/// fake
pub fn sys_umount2() -> isize {
    syscall(SYS_UMOUNT2, [0, 0, 0, 0, 0, 0])
}

/// fake
pub fn sys_mount() -> isize {
    syscall(SYS_MOUNT, [0, 0, 0, 0, 0, 0])
}

/// fake
pub fn sys_fstat(fd: usize, buf: &mut Kstat) -> isize {
    syscall(SYS_FSTAT, [fd, buf as *const _ as usize, 0, 0, 0, 0])
}

pub fn sys_clone(flags: CloneFlags, stack: usize, ptid: usize, tls: usize, ctid: usize) -> isize {
    syscall(
        SYS_CLONE,
        [flags.bits() as usize, stack, ptid, tls, ctid, 0],
    )
}

pub fn sys_execve(path: &str, argv: &[*const u8], envp: &[*const u8]) -> isize {
    syscall(
        SYS_EXECVE,
        [
            path.as_ptr() as usize,
            argv.as_ptr() as usize,
            envp.as_ptr() as usize,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_wait4(pid: isize, status: &mut i32, options: WaitOption) -> isize {
    syscall(
        SYS_WAIT4,
        [
            pid as usize,
            status as *const i32 as usize,
            options.bits() as usize,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_exit(exit_code: i32) -> ! {
    syscall(SYS_EXIT, [exit_code as usize, 0, 0, 0, 0, 0]);
    unreachable!("sys_exit never returns!");
}

pub fn sys_getppid() -> isize {
    syscall(SYS_GETPPID, [0, 0, 0, 0, 0, 0])
}

pub fn sys_getpid() -> isize {
    syscall(SYS_GETPID, [0, 0, 0, 0, 0, 0])
}

pub fn sys_brk(brk: *const u8) -> isize {
    syscall(SYS_BRK, [brk as usize, 0, 0, 0, 0, 0])
}

pub fn sys_munmap(start: *const u8, len: usize) -> isize {
    syscall(SYS_MUNMAP, [start as usize, len, 0, 0, 0, 0])
}

pub fn sys_mmap(
    start: *const u8,
    len: usize,
    prot: MMAPPROT,
    flags: MMAPFLAGS,
    fd: i32,
    offset: usize,
) -> isize {
    syscall(
        SYS_MMAP,
        [
            start as usize,
            len,
            prot.bits() as usize,
            flags.bits() as usize,
            fd as usize,
            offset as usize,
        ],
    )
}

/// fake
pub fn sys_times(tms: &mut Tms) -> isize {
    syscall(SYS_TIMES, [tms as *const Tms as usize, 0, 0, 0, 0, 0])
}

pub fn sys_uname(uts: &mut Utsname) -> isize {
    syscall(SYS_UNAME, [uts as *const Utsname as usize, 0, 0, 0, 0, 0])
}

pub fn sys_sched_yield() -> isize {
    syscall(SYS_SCHED_YIELD, [0, 0, 0, 0, 0, 0])
}

pub fn sys_gettimeofday(ts: &mut TimeVal) -> isize {
    syscall(
        SYS_GETTIMEOFDAY,
        [ts as *const TimeVal as usize, 0, 0, 0, 0, 0],
    )
}

pub fn sys_nanosleep(req: &TimeSpec, rem: &mut TimeSpec) -> isize {
    syscall(
        SYS_NANOSLEEP,
        [
            req as *const TimeSpec as usize,
            rem as *const TimeSpec as usize,
            0,
            0,
            0,
            0,
        ],
    )
}

pub fn sys_sendfile(out_fd: i32, in_fd: i32, offset: &mut usize, count: usize) -> isize {
    syscall(
        SYS_SENDFILE,
        [
            out_fd as usize,
            in_fd as usize,
            offset as *mut usize as usize,
            count,
            0,
            0,
        ],
    )
}

pub fn sys_lseek(fd: i32, offset: isize, whence: i32) -> isize {
    syscall(
        SYS_LSEEK,
        [fd as usize, offset as usize, whence as usize, 0, 0, 0],
    )
}
