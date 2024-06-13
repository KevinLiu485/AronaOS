//! File and filesystem-related syscalls

use core::mem::size_of;
use core::ptr::{self};

use alloc::sync::Arc;
use alloc::vec::Vec;
use log::{debug, info, trace, warn};

use crate::config::SyscallRet;
use crate::fs::fd_table::FdInfo;
use crate::fs::inode::{Inode, InodeMode};
use crate::fs::path::Path;
use crate::fs::pipe::Pipe;
use crate::fs::{
    create_dir, open_fd, open_inode, open_osinode, Fstat, OpenFlags, AT_FDCWD, AT_REMOVEDIR,
};
use crate::task::current_task;

use crate::timer::TimeSpec;
use crate::utils::{c_str_to_string, SyscallErr};

pub async fn sys_write(fd: usize, buf: usize, len: usize) -> SyscallRet {
    let task = current_task().unwrap();
    // let fd_table_len = task.inner_handler(|inner| inner.fd_table.table.len());
    // if fd >= fd_table_len {
    //     return Err(1);
    // }
    let fdinfo = task.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
        if !fdinfo.file.writable() {
            return Err(1);
        }
        // let fdinfo = fdinfo.clone();
        let ret = fdinfo
            .file
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
    // let fd_table_len = task.inner_handler(|inner| inner.fd_table.table.len());
    // if fd >= fd_table_len {
    //     return Err(1);
    // }
    // let fdinfo = task.inner_handler(|inner| inner.fd_table.table[fd].clone());
    let fdinfo = task.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
        // let fdinfo = fdinfo.clone();
        if !fdinfo.file.readable() {
            return Err(1);
        }
        let ret = fdinfo
            .file
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
    let ret = task.inner_lock().fd_table.close(fd);
    ret
    // let mut inner = task.inner_lock();
    // if fd >= inner.fd_table.table.len() {
    //     return Err(1);
    // }
    // if inner.fd_table.table[fd].is_none() {
    //     return Err(1);
    // }
    // if let Some(fdinfo) = inner.fd_table.get(fd) {
    //     fdinfo
    //     Ok(0)
    // } else {
    //     Err(1)
    // }
    // inner.fd_table.table[fd].take();
    // Ok(0)
}

pub fn sys_openat(dirfd: isize, pathname: *const u8, flags: u32, _mode: usize) -> SyscallRet {
    trace!("[sys_openat] enter");
    let task = current_task().unwrap();
    let path = Path::from(c_str_to_string(pathname));
    if let Ok(inode) = open_osinode(dirfd, &path, OpenFlags::from_bits(flags).unwrap()) {
        // let mut inner = task.inner_lock();
        // let fd = inner.fd_table.allocate(0);
        // inner.fd_table.table[fd] = Some(FdInfo::without_flags(inode));
        let fd = task
            .inner_lock()
            .fd_table
            .alloc_and_set(0, FdInfo::default_flags(inode));
        info!(
            "[sys_openat] pid {} succeed to open file: {} -> fd: {}",
            task.pid, path, fd
        );
        Ok(fd)
    } else {
        info!("[sys_openat] pid {} fail to open file: {}", task.pid, path);
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
    match open_osinode(AT_FDCWD, &path, OpenFlags::empty()) {
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

pub fn sys_fstat(fd: usize, buf: *mut Fstat) -> SyscallRet {
    trace!("[sys_fstat] enter");
    let file = open_fd(fd)?;
    let inode = file
        .get_meta()
        .inner
        .lock()
        .inode
        .clone()
        .ok_or(SyscallErr::EBADF as usize)?;
    let fstat = Fstat::new(&inode);
    unsafe {
        ptr::write(buf, fstat);
    }
    Ok(0)
}

pub const MAX_NAME_LEN: usize = 256;
pub const DIRENT_SIZE: usize = size_of::<Dirent>();

#[derive(Debug, Clone, Copy)]
#[repr(C)]
pub struct Dirent {
    /// 64-bit inode number
    pub d_ino: usize,
    /// 64-bit offset to next derent
    pub d_off: usize,
    /// Size of this dirent
    pub d_reclen: u16,
    /// File type
    pub d_type: u8,
    /// File name
    pub d_name: [u8; MAX_NAME_LEN],
}

fn get_dirents(inode: Arc<dyn Inode>, start_index: usize, len: usize) -> Vec<Dirent> {
    inode.get_meta().children_handler(inode, |children| {
        children
            .iter()
            .skip(start_index)
            .take(len)
            .map(|(name, inode)| {
                let mut d_name = name.clone().into_bytes();
                d_name.resize(MAX_NAME_LEN, 0u8);
                let d_type = inode.get_meta().mode as u8;
                debug!("[sys_getdents64] d_name: {}", name);
                Dirent {
                    d_ino: inode.get_meta().ino,
                    d_off: 0,
                    d_reclen: DIRENT_SIZE as u16,
                    d_type,
                    d_name: d_name.try_into().unwrap(),
                }
            })
            .collect()
    })
    // inode.get_meta().children_handler(inode, |children| {
    //     children
    //         .iter()
    //         .skip(start_index)
    //         .take(len)
    //         .map(|(name, inode)| {
    //             let mut d_name = name.clone().into_bytes();
    //             d_name.resize(MAX_NAME_LEN, 0u8);
    //             let d_type = inode.get_meta().mode as u8;
    //             let d_reclen = (DIRENT_SIZE - MAX_NAME_LEN + name.len() + 1) as u16;
    //             debug!("[sys_getdents64] d_reclen: {}, d_name: {}", d_reclen, name);
    //             Dirent {
    //                 d_ino: inode.get_meta().ino,
    //                 d_off: 0,
    //                 d_reclen,
    //                 d_type,
    //                 d_name: d_name.try_into().unwrap(),
    //             }
    //         })
    //         .collect()
    // })
}

// fn compact_dirents(dirents: Vec<Dirent>) -> Vec<u8> {
//     let ret: Vec<u8> = Vec::new();
//     dirents.iter().for_each(|dirent| {
//         let mut buf = Vec::new();
//         // buf.extend_from_slice(&dirent.d_ino.to_le_bytes());
//         buf.extend_from_slice(&dirent.d_ino.to_ne_bytes());
//         buf.extend_from_slice(&dirent.d_off.to_le_bytes());
//         buf.extend_from_slice(&dirent.d_reclen.to_le_bytes());
//         buf.push(dirent.d_type);
//         buf.extend_from_slice(&dirent.d_name);
//         ret.extend_from_slice(&buf);
//     });
// }

pub fn sys_getdents64(fd: usize, dirp: usize, size: usize) -> SyscallRet {
    trace!(
        "[sys_getdents64] enter. fd: {}, buf: {:#x}, len: {}",
        fd,
        dirp as usize,
        size
    );
    let file = open_fd(fd)?;
    let mut file_inner = file.get_meta().inner.lock();
    let inode = file_inner.inode.clone().ok_or(SyscallErr::EBADF as usize)?;
    if inode.get_meta().mode != InodeMode::FileDIR {
        return Err(1);
    }
    let dirent_index = file_inner.dentry_index;
    let dst_len = size / DIRENT_SIZE;
    let dirents_dst = unsafe { core::slice::from_raw_parts_mut(dirp as *mut Dirent, dst_len) };
    let dirents_src = get_dirents(inode, dirent_index, dst_len);
    let src_len = dirents_src.len();
    // let dirents: Vec<Dirent> = inode.get_meta().children_handler(inode, |children| {
    //     children
    //         .iter()
    //         .skip(dirent_index)
    //         .map(|(name, inode)| {
    //             let mut d_name = name.clone().into_bytes();
    //             d_name.resize(MAX_NAME_LEN, 0u8);
    //             let d_type = inode.get_meta().mode as u8;
    //             let d_reclen = (DIRENT_SIZE - MAX_NAME_LEN + name.len() + 1) as u16;
    //             Dirent {
    //                 d_ino: inode.get_meta().ino,
    //                 d_off: 0,
    //                 d_reclen,
    //                 d_type,
    //                 d_name: d_name.try_into().unwrap(),
    //             }
    //         })
    //         .collect()
    // });

    // debug!("[sys_getdents64] dirents: {:?}", dirents);

    // let mut num_bytes = 0;
    // let mut dirp = dirp;
    // let mut index: usize = 0;
    // for (i, dirent) in dirents.iter().enumerate() {
    //     let temp = num_bytes + dirent.d_reclen as usize;
    //     if temp > size {
    //         info!("[sys_getdents64] user buf size: {}, too small", size);
    //         index = i;
    //         break;
    //     }
    //     num_bytes = temp;
    //     unsafe {
    //         copy_nonoverlapping(&*dirent as *const Dirent, dirp as *mut Dirent, 1);
    //         dirp += dirent.d_reclen as usize;
    //     }
    //     index = i + 1;
    // }
    dirents_dst[..src_len].copy_from_slice(&dirents_src);
    file_inner.dentry_index += src_len;
    info!(
        "[sys_getdents64] dirent_index iters from {} to {}",
        dirent_index,
        dirent_index + src_len
    );

    Ok(src_len * DIRENT_SIZE)
    // Ok(num_bytes)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    trace!("[sys_dup] enter");
    let task = current_task().unwrap();
    let ret = task.inner_lock().fd_table.alloc_and_dup(fd, 0);
    ret
    // task.inner_handler(|inner| {
    //     inner.fd_table.alloc_and_dup(fd, 0)
    // if inner.fd_table.table.len() <= fd {
    //     return Err(1);
    // }
    // inner.fd_table.table[fd]
    //     .clone()
    //     .map(|file| {
    //         let new_fd = inner.fd_table.allocate(0);
    //         inner.fd_table.table[new_fd] = Some(file);
    //         Ok(new_fd)
    //     })
    //     .unwrap_or(Err(1))
    // })
}

pub fn sys_dup3(oldfd: usize, newfd: usize) -> SyscallRet {
    trace!("[sys_dup3] enter");
    let task = current_task().unwrap();
    let ret = task.inner_lock().fd_table.dup_to(oldfd, newfd);
    ret
    // task.inner_handler(|inner| {
    // inner.fd_table.dup_and_set(oldfd, newfd)
    // if inner.fd_table.table.len() <= oldfd {
    //     return Err(1);
    // }
    // inner.fd_table.get(oldfd)
    //     .clone()
    //     .map(|fdinfo| {
    //         inner.fd_table.set(newfd, fdinfo);
    //         // inner.fd_table.reserve(newfd);
    //         // inner.fd_table.table[newfd] = Some(file);
    //         Ok(newfd)
    //     })
    //     .unwrap_or(Err(1))
    // })
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
        // let fd1 = inner.fd_table.allocate(0);
        // inner.fd_table.table[fd1] = Some(FdInfo::without_flags(pipe_pair.0.clone()));
        // let fd2 = inner.fd_table.allocate(0);
        // inner.fd_table.table[fd2] = Some(FdInfo::without_flags(pipe_pair.1.clone()));
        let fd1 = inner
            .fd_table
            .alloc_and_set(0, FdInfo::default_flags(pipe_pair.0.clone()));
        let fd2 = inner
            .fd_table
            .alloc_and_set(0, FdInfo::default_flags(pipe_pair.1.clone()));
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
    // warn!("[sys_fcntl] not fully implemented");
    let task = current_task().unwrap();
    match cmd {
        F_DUPFD => {
            let least_fd = arg;
            task.inner_lock().fd_table.alloc_and_dup(fd, least_fd)
        }
        F_DUPFD_CLOEXEC => {
            let least_fd = arg;
            task.inner_handler(|inner| {
                let new_fd = inner.fd_table.alloc_and_dup(fd, least_fd)?;
                let fdinfo = inner
                    .fd_table
                    .get_mut(new_fd)
                    .ok_or(SyscallErr::EBADF as usize)?;
                fdinfo.flags.insert(OpenFlags::CLOEXEC);
                Ok(new_fd)
            })
        }
        F_GETFD => {
            let fdinfo = task
                .inner_lock()
                .fd_table
                .get(fd)
                .ok_or(SyscallErr::EBADF as usize)?;
            if fdinfo.flags.contains(OpenFlags::CLOEXEC) {
                Ok(FcntlFlags::FD_CLOEXEC.bits() as usize)
            } else {
                Ok(0)
            }
        }
        F_SETFD => {
            let new_flags = FcntlFlags::from_bits(arg as u32).ok_or(SyscallErr::EINVAL as usize)?;
            task.inner_handler(|inner| {
                let fdinfo = inner
                    .fd_table
                    .get_mut(fd)
                    .ok_or(SyscallErr::EBADF as usize)?;
                if new_flags.contains(FcntlFlags::FD_CLOEXEC) {
                    fdinfo.flags.insert(OpenFlags::CLOEXEC);
                }
                Ok(0)
            })
        }
        F_GETFL => {
            let fdinfo = task
                .inner_lock()
                .fd_table
                .get(fd)
                .ok_or(SyscallErr::EBADF as usize)?;
            Ok(fdinfo.flags.bits() as usize)
        }
        F_SETFL => {
            let new_flags = OpenFlags::from_bits(arg as u32).ok_or(SyscallErr::EINVAL as usize)?;
            task.inner_handler(|inner| {
                let fdinfo = inner
                    .fd_table
                    .get_mut(fd)
                    .ok_or(SyscallErr::EBADF as usize)?;
                fdinfo.flags = new_flags;
                Ok(0)
            })
        }
        _ => Err(0),
    }
}

#[repr(C)]
pub struct Iovec {
    /// user space buf starting address
    pub iov_base: usize,
    /// number of bytes to transfer
    pub iov_len: usize,
}

fn iovec_to_slice_vec<'a>(iov: *const Iovec, iovcnt: i32) -> Vec<&'a [u8]> {
    let iovec = unsafe { core::slice::from_raw_parts(iov, iovcnt as usize) };
    iovec
        .iter()
        .map(|iov| unsafe { core::slice::from_raw_parts(iov.iov_base as *const u8, iov.iov_len) })
        .collect()
}

pub async fn sys_writev(fd: usize, iov: usize, iovcnt: i32) -> SyscallRet {
    trace!(
        "[writev] enter. fd: {}, iov: {:#x}, iovcnt: {}",
        fd,
        iov as usize,
        iovcnt
    );

    let iovec = iovec_to_slice_vec(iov as *const Iovec, iovcnt);
    let task = current_task().unwrap();
    let fdinfo = task.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
        if !fdinfo.file.writable() {
            return Err(1);
        }
        let mut ret: usize = 0;
        for slice in iovec.iter() {
            ret += fdinfo.file.write(slice).await?;
        }
        Ok(ret)
    } else {
        Err(1)
    }
}

/// Poll Fd
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct PollFd {
    /// Fd
    pub fd: i32,
    /// Requested events
    pub events: i16,
    /// Returned events
    pub revents: i16,
}

pub fn sys_ppoll(
    fds_ptr: usize,
    nfds: usize,
    timeout_ptr: usize,
    sigmask_ptr: usize,
) -> SyscallRet {
    trace!(
        "[sys_ppoll] enter. nfds: {}, timeout_ptr: {:#x}, sigmask_ptr: {:#x}",
        nfds,
        timeout_ptr,
        sigmask_ptr
    );
    warn!("[sys_ppoll] not implemented");
    let _fds = unsafe { core::slice::from_raw_parts(fds_ptr as *const PollFd, nfds) };
    let _timeout = unsafe { &*(timeout_ptr as *const TimeSpec) };
    let _sigmask = unsafe { &*(sigmask_ptr as *const usize) };
    Ok(0)
}

pub fn sys_fstatat(dirfd: i32, pathname: *const u8, buf: *mut Fstat, flags: i32) -> SyscallRet {
    let pathname = c_str_to_string(pathname);
    trace!(
        "[sys_fstatat] enter. dirfd: {}, pathname: {}, flags: {}",
        dirfd,
        pathname,
        flags
    );
    let empty_path = pathname.is_empty();
    let path = Path::from(pathname);
    let inode = open_inode(dirfd as isize, &path, OpenFlags::empty())?;
    let flags = FcntlFlags::from_bits(flags as u32).ok_or(SyscallErr::EINVAL)?;

    if flags.contains(FcntlFlags::AT_EMPTY_PATH) && empty_path {
        unimplemented!()
    } else {
        let fstat = Fstat::new(&inode);
        unsafe {
            ptr::write(buf, fstat);
        }
    }
    Ok(0)
}

bitflags! {
    pub struct FaccessatFlags: u32 {
        const F_OK = 0;
        const R_OK = 1 << 2;
        const W_OK = 1 << 1;
        const X_OK = 1 << 0;
    }
}

pub fn sys_faccessat(fd: i32, path: *const u8, amode: u32, flag: u32) -> SyscallRet {
    trace!("[sys_faccessat] enter.");
    warn!("[sys_faccessat] not fully implemented.");
    let _amode = FaccessatFlags::from_bits(amode).ok_or(SyscallErr::EINVAL)?;
    let _flag = FcntlFlags::from_bits(flag).ok_or(SyscallErr::EINVAL)?;
    let path = Path::from(c_str_to_string(path));
    let _inode = open_inode(fd as isize, &path, OpenFlags::empty())?;
    Ok(0)
}

pub fn sys_utimensat(
    dirfd: i32,
    pathname: *const u8,
    _times: *const TimeSpec,
    _flags: i32,
) -> SyscallRet {
    let path = Path::from(c_str_to_string(pathname));
    trace!("[sys_utimensat] enter. pathname: {}", path);
    warn!("[sys_utimensat] not fully implemented");
    let _inode = open_inode(dirfd as isize, &path, OpenFlags::empty())
        .map_err(|_| SyscallErr::ENOENT as usize)?;
    debug!("[sys_utimensat] return Ok");
    Ok(0)
}
