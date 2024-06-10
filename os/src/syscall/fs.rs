//! File and filesystem-related syscalls

use core::ptr;

use alloc::task;
use log::{trace, warn};

use crate::config::SyscallRet;
use crate::fs::inode::InodeMode;
use crate::fs::path::Path;
use crate::fs::pipe::Pipe;
use crate::fs::{create_dir, open_file, open_inode, Kstat, OpenFlags, AT_FDCWD, AT_REMOVEDIR};
use crate::task::current_task;

use crate::timer::TimeSpec;
use crate::utils::c_str_to_string;

pub async fn sys_write(fd: usize, buf: usize, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let fd_table_len = task.inner_handler(|inner| inner.fd_table.len());
    if fd >= fd_table_len {
        return Err(1);
    }
    let file = task.inner_handler(|inner| inner.fd_table[fd].clone());
    if let Some(file) = file {
        if !file.writable() {
            return Err(1);
        }
        let file = file.clone();
        let ret = file
            .write(unsafe { core::slice::from_raw_parts(buf as *const u8, len) })
            .await?;
        Ok(ret)
    } else {
        Err(1)
    }
}
pub async fn sys_read(
    fd: usize,
    buf: usize, /* cannot use `*const u8` here as it does not satisfy `Send` trait */
    len: usize,
) -> SyscallRet {
    let task = current_task().unwrap();
    /* cannot use `inner` as MutexGuard will cross `await` that way */
    let fd_table_len = task.inner_handler(|inner| inner.fd_table.len());
    if fd >= fd_table_len {
        return Err(1);
    }
    let file = task.inner_handler(|inner| inner.fd_table[fd].clone());
    if let Some(file) = file {
        let file = file.clone();
        if !file.readable() {
            return Err(1);
        }
        let ret = file
            .read(unsafe { core::slice::from_raw_parts_mut(buf as *mut u8, len) })
            .await?;
        Ok(ret)
    } else {
        Err(1)
    }
}

pub fn sys_close(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    trace!("[sys_close] enter. pid: {}, fd: {}", task.getpid(), fd);
    let mut inner = task.inner_lock();
    if fd >= inner.fd_table.len() {
        return Err(1);
    }
    if inner.fd_table[fd].is_none() {
        return Err(1);
    }
    inner.fd_table[fd].take();
    Ok(0)
}

pub fn sys_openat(dirfd: isize, pathname: *const u8, flags: u32, _mode: usize) -> SyscallRet {
    trace!("[sys_openat] enter");
    let task = current_task().unwrap();
    let path = Path::from(c_str_to_string(pathname));
    if let Ok(inode) = open_file(dirfd, &path, OpenFlags::from_bits(flags).unwrap()) {
        let mut inner = task.inner_lock();
        let fd = inner.alloc_fd(0);
        inner.fd_table[fd] = Some(inode);
        trace!(
            "[sys_openat] pid {} succeed to open file: {} -> fd: {}",
            task.pid,
            path,
            fd
        );
        Ok(fd)
    } else {
        trace!("[sys_openat] pid {} fail to open file: {}", task.pid, path);
        Err(1)
    }
}

pub fn sys_chdir(pathname: *const u8) -> SyscallRet {
    let path = Path::from(c_str_to_string(pathname));
    trace!(
        "[sys_chdir] pid: {}, pathname: {}",
        current_task().unwrap().getpid(),
        path
    );
    // simply examine validity of the path
    match open_file(AT_FDCWD, &path, OpenFlags::empty()) {
        Ok(inode) => {
            current_task()
                .unwrap()
                .inner_handler(|inner| inner.cwd = inode.get_path());
            Ok(0)
        }
        Err(_) => Err(1),
    }
}

pub fn sys_mkdirat(dirfd: isize, pathname: *const u8, _mode: usize) -> SyscallRet {
    trace!("[sys_mkdirat] enter");
    let path = Path::from(c_str_to_string(pathname));
    trace!("[sys_mkdirat] dirfd: {}, pathname: {}", dirfd, path);
    create_dir(dirfd, &path)
}

/// fake
pub fn sys_fstat(_fd: usize, buf: *const u8) -> SyscallRet {
    trace!("[sys_fstat] enter");
    warn!("[sys_fstat] not implemented");
    let stat = Kstat {
        st_dev: 0,
        st_ino: 0,
        st_mode: 0,
        st_nlink: 1,
        st_uid: 0,
        st_gid: 0,
        st_rdev: 0,
        __pad1: 0,
        st_size: 28,
        st_blksize: 0,
        __pad2: 0,
        st_blocks: 0,
        st_atim: TimeSpec::new(),
        st_mtim: TimeSpec::new(),
        st_ctim: TimeSpec::new(),
    };
    let kstat_ptr = buf as *mut Kstat;
    unsafe {
        ptr::write(kstat_ptr, stat);
    }
    Ok(0)
}

/// fake
pub fn sys_getdents64(_fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    trace!("[sys_getdents64] enter");
    warn!("[sys_getdents64] not implemented");
    let slice = unsafe { core::slice::from_raw_parts_mut(buf as *mut u8, len) };
    let dent = "12345678123456781211";
    slice[..20].copy_from_slice(dent.as_bytes());
    Ok(2)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    trace!("[sys_dup] enter");
    let task = current_task().unwrap();
    task.inner_handler(|inner| {
        if inner.fd_table.len() <= fd {
            return Err(1);
        }
        inner.fd_table[fd]
            .clone()
            .map(|file| {
                let new_fd = inner.alloc_fd(0);
                inner.fd_table[new_fd] = Some(file);
                Ok(new_fd)
            })
            .unwrap_or(Err(1))
    })
}

pub fn sys_dup3(oldfd: usize, newfd: usize) -> SyscallRet {
    trace!("[sys_dup3] enter");
    let task = current_task().unwrap();
    task.inner_handler(|inner| {
        if inner.fd_table.len() <= oldfd {
            return Err(1);
        }
        inner.fd_table[oldfd]
            .clone()
            .map(|file| {
                inner.reserve_fd(newfd);
                inner.fd_table[newfd] = Some(file);
                Ok(newfd)
            })
            .unwrap_or(Err(1))
    })
}

pub fn sys_unlinkat(dirfd: isize, pathname: *const u8, flags: u32) -> SyscallRet {
    trace!("[sys_unlinkat] enter");
    warn!("[sys_unlinkat] not fully implemented");
    let path = Path::from(c_str_to_string(pathname));
    match open_inode(dirfd, &path, OpenFlags::empty()) {
        Ok(inode) => {
            let mode = inode.get_meta().mode;
            if mode == InodeMode::FileREG || (mode == InodeMode::FileDIR && flags == AT_REMOVEDIR) {
                inode.delete();
                Ok(0)
            } else {
                Err(1)
            }
        }
        Err(_) => Err(1),
    }
}

pub fn sys_pipe2(fdset: *const u8) -> SyscallRet {
    trace!("[sys_pipe2] enter");
    let task = current_task().unwrap();
    let pipe_pair = Pipe::new_pair();
    let fdret = task.inner_handler(|inner| {
        let fd1 = inner.alloc_fd(0);
        inner.fd_table[fd1] = Some(pipe_pair.0.clone());
        let fd2 = inner.alloc_fd(0);
        inner.fd_table[fd2] = Some(pipe_pair.1.clone());
        (fd1, fd2)
    });
    /* the FUCKING user fd is `i32` type! */
    let fdret: [i32; 2] = [fdret.0 as i32, fdret.1 as i32];
    let fdset_ptr = fdset as *mut [i32; 2];
    unsafe {
        ptr::write(fdset_ptr, fdret);
    }
    Ok(0)
}

pub fn sys_mount() -> SyscallRet {
    trace!("[sys_mount] enter");
    warn!("[sys_mount] not implemented");
    Ok(0)
}

pub fn sys_umount2() -> SyscallRet {
    trace!("[sys_umount2] enter");
    warn!("[sys_umount2] not implemented");
    Ok(0)
}

pub fn sys_ioctl() -> SyscallRet {
    trace!("[sys_ioctl] enter");
    warn!("[sys_ioctl] not implemented");
    Ok(0)
}

bitflags! {
    pub struct FcntlFlags: u32 {
        const FD_CLOEXEC = 1;
        const AT_EMPTY_PATH = 1 << 0;
        const AT_SYMLINK_NOFOLLOW = 1 << 8;
        const AT_EACCESS = 1 << 9;
        const AT_NO_AUTOMOUNT = 1 << 11;
        const AT_DUMMY = 1 << 12;
    }
}

const F_DUPFD: i32 = 0;
const F_DUPFD_CLOEXEC: i32 = 1030;
const F_GETFD: i32 = 1;
const F_SETFD: i32 = 2;
const F_GETFL: i32 = 3;
const F_SETFL: i32 = 4;

pub fn sys_fcntl(fd: usize, cmd: i32, arg: usize) -> SyscallRet {
    trace!("[sys_fcntl] enter. fd: {}, cmd: {}, arg: {}", fd, cmd, arg);
    match cmd {
        F_DUPFD => {
            let least_fd = arg;
            let task = current_task().unwrap();
            return Ok(task.inner_handler(|inner| {
                inner.alloc_fd(least_fd)
            });)
        };
        F_DUPFD_CLOEXEC => {}
        F_GETFD => {}
        F_SETFD => {}
        F_GETFL => {}
        F_SETFL => {}
        _ => return Err(0),
    }
    warn!("[sys_fcntl] not implemented");
    Ok(0)
}
