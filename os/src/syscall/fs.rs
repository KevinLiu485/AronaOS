//! File and filesystem-related syscalls

use core::mem::size_of;
use core::ptr::{self};

use alloc::sync::Arc;
// this statement causes strange bug...
// use alloc::vec::{self, Vec};
use alloc::vec;
use alloc::vec::Vec;
use log::{debug, error, info, trace, warn};

use crate::config::SyscallRet;
use crate::fs::fd_table::FdInfo;
use crate::fs::inode::{Inode, InodeMode};
use crate::fs::path::Path;
use crate::fs::pipe::Pipe;
use crate::fs::tty::TTY;
use crate::fs::{
    create_dir, open_fd, open_inode, open_osinode, Fstat, OpenFlags, AT_FDCWD, AT_REMOVEDIR,
};
use crate::mm::user_check::UserCheck;
// use crate::syscall::process;
// use crate::syscall::process;
// use crate::task::current_task;
use crate::task::processor::current_process;

use crate::timer::{current_time_duration, current_time_spec, TimeSpec};
use crate::utils::{c_str_to_string, SyscallErr};

pub async fn sys_write(fd: usize, buf: usize, len: usize) -> SyscallRet {
    // let task = current_task().unwrap();
    let process = current_process();
    // let fd_table_len = task.inner_handler(|inner| inner.fd_table.table.len());
    // if fd >= fd_table_len {
    //     return Err(1);
    // }
    let fdinfo = process.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
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
    let process = current_process();
    /* cannot use `inner` as MutexGuard will cross `await` that way */
    // let fd_table_len = task.inner_handler(|inner| inner.fd_table.table.len());
    // if fd >= fd_table_len {
    //     return Err(1);
    // }
    // let fdinfo = task.inner_handler(|inner| inner.fd_table.table[fd].clone());
    let fdinfo = process.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
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
    let process = current_process();
    trace!("[sys_close] enter. pid: {}, fd: {}", process.getpid(), fd);
    let ret = process.inner_lock().fd_table.close(fd);
    ret
}

pub fn sys_openat(dirfd: isize, pathname: *const u8, flags: u32, _mode: usize) -> SyscallRet {
    trace!("[sys_openat] enter.");
    let process = current_process();
    let path = Path::from(c_str_to_string(pathname));
    let flags = OpenFlags::from_bits(flags).ok_or(SyscallErr::EINVAL)?;
    debug!(
        "[sys_openat] dirfd: {}, pathname: {}, flags: {:?}",
        dirfd, path, flags,
    );

    if let Ok(osinode) = open_osinode(dirfd, &path, flags) {
        let mode = osinode.inner_handler(|inner| inner.inode.as_ref().unwrap().get_meta().mode);
        if mode == InodeMode::FileDIR
            && (flags.contains(OpenFlags::WRONLY) || flags.contains(OpenFlags::RDWR))
        {
            error!(
                "[sys_openat] pid {} fail to open file: {}",
                process.pid, path
            );
            return Err(SyscallErr::EISDIR as usize);
        }
        let fd = if mode == InodeMode::FileCHR {
            // let tty_file =
            //     TtyFile::new(osinode.inner_handler(|inner| inner.inode.clone().unwrap()));
            // let tty_file = Arc::new(tty_file);
            process
                .inner_lock()
                .fd_table
                .alloc_and_set(0, FdInfo::default_flags(TTY.clone()))?
        } else {
            process
                .inner_lock()
                .fd_table
                .alloc_and_set(0, FdInfo::default_flags(osinode))?
        };
        info!(
            "[sys_openat] pid {} succeed to open file: {} -> fd: {}",
            process.pid, path, fd
        );
        Ok(fd)
    } else {
        error!(
            "[sys_openat] pid {} fail to open file: {}",
            process.pid, path
        );
        Err(1)
    }
}

pub fn sys_chdir(pathname: *const u8) -> SyscallRet {
    let path = Path::from(c_str_to_string(pathname));
    trace!(
        "[sys_chdir] pid: {}, pathname: {}",
        current_process().getpid(),
        path
    );
    // simply examine validity of the path
    match open_osinode(AT_FDCWD, &path, OpenFlags::empty()) {
        Ok(inode) => {
            current_process().inner_handler(|inner| inner.cwd = inode.get_path());
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
    debug!("[sys_fstat] fd: {}", fd);
    let file = open_fd(fd).ok_or(SyscallErr::EBADF)?;
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
                // debug!("[sys_getdents64] d_name: {}", name);
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
}

// we don't compress the dirent buffer here, reducing the complexity, but increasing the syscall overhead
pub fn sys_getdents64(fd: usize, dirp: usize, size: usize) -> SyscallRet {
    trace!(
        "[sys_getdents64] enter. fd: {}, buf: {:#x}, len: {}",
        fd,
        dirp,
        size
    );
    let file = open_fd(fd).ok_or(SyscallErr::EBADF)?;
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

    dirents_dst[..src_len].copy_from_slice(&dirents_src);
    file_inner.dentry_index += src_len;
    info!(
        "[sys_getdents64] dirent_index iters from {} to {}",
        dirent_index,
        dirent_index + src_len
    );

    Ok(src_len * DIRENT_SIZE)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    debug!("[sys_dup] enter, fd: {}", fd);
    let task = current_process();
    let ret = task.inner_lock().fd_table.alloc_and_dup(fd, 0);
    debug!("[sys_dup] return, ret: {:?}", ret);
    ret
}

pub fn sys_dup3(oldfd: usize, newfd: usize) -> SyscallRet {
    trace!("[sys_dup3] enter");
    let task = current_process();
    let ret = task.inner_lock().fd_table.dup_to(oldfd, newfd);
    ret
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
    let process = current_process();
    let pipe_pair = Pipe::new_pair();
    // let fdret = process.inner_handler(|inner| {
    //     // let fd1 = inner.fd_table.allocate(0);
    //     // inner.fd_table.table[fd1] = Some(FdInfo::without_flags(pipe_pair.0.clone()));
    //     // let fd2 = inner.fd_table.allocate(0);
    //     // inner.fd_table.table[fd2] = Some(FdInfo::without_flags(pipe_pair.1.clone()));
    //     let fd1 = inner
    //         .fd_table
    //         .alloc_and_set(0, FdInfo::default_flags(pipe_pair.0.clone()))?;
    //     let fd2 = inner
    //         .fd_table
    //         .alloc_and_set(0, FdInfo::default_flags(pipe_pair.1.clone()))?;
    //     (fd1, fd2)
    // });
    let fd1 = process
        .inner_lock()
        .fd_table
        .alloc_and_set(0, FdInfo::default_flags(pipe_pair.0.clone()))?;
    let fd2 = process
        .inner_lock()
        .fd_table
        .alloc_and_set(0, FdInfo::default_flags(pipe_pair.1.clone()))?; // let fdret = (fd1, fd2);
                                                                        /* the FUCKING user fd is `i32` type! */
    // let fdret: [i32; 2] = [fdret.0 as i32, fdret.1 as i32];
    let fdret: [i32; 2] = [fd1 as i32, fd2 as i32];
    let fdset_ptr = fdset as *mut [i32; 2];
    unsafe {
        ptr::write(fdset_ptr, fdret);
    }
    Ok(0)
}

// pub fn sys_mount() -> SyscallRet {
//     trace!("[sys_mount] enter");
//     warn!("[sys_mount] not implemented");
//     Ok(0)
// }

// pub fn sys_umount2() -> SyscallRet {
//     trace!("[sys_umount2] enter");
//     warn!("[sys_umount2] not implemented");
//     Ok(0)
// }

pub fn sys_ioctl(fd: i32, request: usize, argp: usize) -> SyscallRet {
    trace!("[sys_ioctl] enter. fd: {}, request: {}", fd, request);
    warn!("[sys_ioctl] not fully implemented");

    let file = open_fd(fd as usize).ok_or(SyscallErr::EBADF as usize)?;
    file.ioctl(request, argp)?;
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
    let process = current_process();
    match cmd {
        F_DUPFD => {
            let least_fd = arg;
            process.inner_lock().fd_table.alloc_and_dup(fd, least_fd)
        }
        F_DUPFD_CLOEXEC => {
            let least_fd = arg;
            process.inner_handler(|inner| {
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
            let fdinfo = process
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
            process.inner_handler(|inner| {
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
            let fdinfo = process
                .inner_lock()
                .fd_table
                .get(fd)
                .ok_or(SyscallErr::EBADF as usize)?;
            Ok(fdinfo.flags.bits() as usize)
        }
        F_SETFL => {
            let new_flags = OpenFlags::from_bits(arg as u32).ok_or(SyscallErr::EINVAL as usize)?;
            process.inner_handler(|inner| {
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

fn iovec_to_slice_vec<'a>(iov: *const Iovec, iovcnt: i32) -> Vec<&'a mut [u8]> {
    let iovec = unsafe { core::slice::from_raw_parts(iov, iovcnt as usize) };
    iovec
        .iter()
        .map(|iov| unsafe { core::slice::from_raw_parts_mut(iov.iov_base as *mut u8, iov.iov_len) })
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
    // let task = current_task().unwrap();
    let process = current_process();
    let fdinfo = process.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
        let mut ret: usize = 0;
        for slice in iovec.iter() {
            ret += fdinfo.file.write(slice).await?;
        }
        Ok(ret)
    } else {
        Err(1)
    }
}

pub async fn sys_readv(fd: usize, iov: usize, iovcnt: i32) -> SyscallRet {
    trace!(
        "[readv] enter. fd: {}, iov: {:#x}, iovcnt: {}",
        fd,
        iov as usize,
        iovcnt
    );

    let mut iovec = iovec_to_slice_vec(iov as *const Iovec, iovcnt);
    let process = current_process();
    let fdinfo = process.inner_handler(|inner| inner.fd_table.get(fd));
    if let Some(fdinfo) = fdinfo {
        let mut ret: usize = 0;
        for slice in iovec.iter_mut() {
            ret += fdinfo.file.read(slice).await?;
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

bitflags! {
    /// Poll events
    pub struct PollEvents: i16 {
        /// There is data to read
        const POLLIN = 1 << 0;
        /// Execption about fd
        const POLLPRI = 1 << 1;
        /// There is data to write
        const POLLOUT = 1 << 2;
        /// Error condition
        const POLLERR = 1 << 3;
        /// Hang up
        const POLLHUP = 1 << 4;
        /// Invalid request: fd not open
        const POLLNVAL = 1 << 5;
    }
}

// do not support timeout and sigmask
pub fn sys_ppoll(
    fds_ptr: usize,
    nfds: usize,
    _timeout_ptr: usize,
    _sigmask_ptr: usize,
) -> SyscallRet {
    trace!(
        // "[sys_ppoll] enter. nfds: {}, timeout_ptr: {:#x}, sigmask_ptr: {:#x}",
        "[sys_ppoll] enter. nfds: {}",
        nfds,
        // timeout_ptr,
        // sigmask_ptr
    );
    warn!("[sys_ppoll] not fully implemented");
    let fds = unsafe { core::slice::from_raw_parts_mut(fds_ptr as *mut PollFd, nfds) };
    // let _timeout = unsafe { &*(timeout_ptr as *const TimeSpec) };
    // let _sigmask = unsafe { &*(sigmask_ptr as *const usize) };
    let mut ret = 0;
    for fd in fds {
        debug!("[sys_ppoll] fd: {}, events: {}", fd.fd, fd.events);
        fd.revents = fd.events;
        ret += 1;
    }
    Ok(ret)
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

/// for utimensat
pub const UTIME_NOW: usize = 1073741823;
pub const UTIME_OMIT: usize = 1073741822;

pub fn sys_utimensat(
    dirfd: i32,
    pathname: *const u8,
    times: *const TimeSpec,
    _flags: i32,
) -> SyscallRet {
    // return Ok(0);
    let path = Path::from(c_str_to_string(pathname));
    trace!("[sys_utimensat] enter. pathname: {}", path);
    warn!("[sys_utimensat] not fully implemented");

    let inode = open_inode(dirfd as isize, &path, OpenFlags::empty())
        .map_err(|_| SyscallErr::ENOENT as usize)?;

    debug!(
        "[sys_utimensat] get inode name: {}, ino: {}",
        inode.get_name(),
        inode.get_meta().ino
    );

    let meta_date = inode.get_meta();
    let mut inner_lock = meta_date.inner.lock();
    if times.is_null() {
        debug!("[sys_utimensat] times is null");
        // If times is null, then both timestamps are set to the current time.
        inner_lock.st_atim = current_time_spec();
    } else {
        // times[0] for atime, times[1] for mtime
        // todo: UserCheck::new().c(times as *const u8, 2 * size_of::<TimeSpec>())?;
        let atime = unsafe { &*times };
        let times = unsafe { times.add(1) };
        let mtime = unsafe { &*times };
        // change access time
        if atime.nsec == UTIME_NOW {
            debug!("[sys_utimensat] atime nsec is UTIME_NOW, set to now");
            inner_lock.st_atim = current_time_spec();
        } else if atime.nsec == UTIME_OMIT {
            debug!("[sys_utimensat] atime nsec is UTIME_OMIT, unchanged");
        } else {
            debug!("[sys_utimensat] atime normal nsec");
            inner_lock.st_atim = *atime;
        }
        debug!("[sys_utimensat] atime: {:?}", inner_lock.st_atim);
        // change modify time
        if mtime.nsec == UTIME_NOW {
            debug!("[sys_utimensat] mtime nsec is UTIME_NOW, set to now");
            inner_lock.st_mtim = current_time_spec();
        } else if mtime.nsec == UTIME_OMIT {
            debug!("[sys_utimensat] mtime nsec is UTIME_OMIT, unchanged");
        } else {
            debug!("[sys_utimensat] mtime normal nsec");
            inner_lock.st_mtim = *mtime;
        }
        debug!("[sys_utimensat] mtime: {:?}", inner_lock.st_mtim);
        // change state change time
        inner_lock.st_ctim = current_time_spec();
    }
    Ok(0)
}

pub async fn sys_sendfile(out_fd: i32, in_fd: i32, offset: usize, count: usize) -> SyscallRet {
    trace!(
        "[sys_sendfile] enter. out_fd: {}, in_fd: {}, offset: {:#x}, count: {}",
        out_fd,
        in_fd,
        offset as usize,
        count
    );
    let in_file = open_fd(in_fd as usize).ok_or(SyscallErr::EINVAL)?;
    let out_file = open_fd(out_fd as usize).ok_or(SyscallErr::EINVAL)?;
    let offset = offset as *mut isize;
    let mut buffer = vec![0u8; count];
    if offset.is_null() {
        // use and update in_fd inner offset

        // count >= bytes_read >= bytes_write
        let bytes_read = in_file.read(&mut buffer[..]).await?;
        let bytes_written = out_file.write(&buffer[..bytes_read]).await?;
        Ok(bytes_written)
    } else {
        // use and update user-given offset
        let offset = unsafe { &mut *offset };
        if *offset < 0 {
            // negative offset is invalid
            return Err(SyscallErr::EINVAL as usize);
        }
        let origin_offset = in_file.seek(*offset as usize).ok_or(SyscallErr::ESPIPE)?;
        let bytes_read = in_file.read(&mut buffer[..]).await?;
        let bytes_written = out_file.write(&buffer[..bytes_read]).await?;
        // not bytes_written, sepcified in linux man 2
        *offset += bytes_read as isize;
        in_file.seek(origin_offset);
        Ok(bytes_written)
    }
}

const SEEK_SET: i32 = 0; /* Seek from beginning of file.  */
const SEEK_CUR: i32 = 1; /* Seek from current position.  */
const SEEK_END: i32 = 2; /* Seek from end of file.  */
const SEEK_DATA: i32 = 3; /* Seek to next data.  */
const SEEK_HOLE: i32 = 4; /* Seek to next hole.  */

pub fn sys_lseek(fd: i32, offset: isize, whence: i32) -> SyscallRet {
    trace!(
        "[sys_lseek] enter. fd: {}, offset: {}, whence: {}",
        fd,
        offset,
        whence
    );
    warn!("[sys_lseek] not fully implemented.");
    let file = open_fd(fd as usize).ok_or(SyscallErr::EBADF)?;
    match whence {
        SEEK_SET => {
            if offset < 0 {
                return Err(SyscallErr::EINVAL as usize);
            }
            file.seek(offset as usize)
                .ok_or(SyscallErr::ESPIPE as usize)?;
            Ok(offset as usize)
        }
        SEEK_CUR => {
            let origin_offset = file.get_meta().inner.lock().offset;
            // offset may be negative
            let final_offset = origin_offset as isize + offset;
            if final_offset < 0 {
                return Err(SyscallErr::EINVAL as usize);
            }
            let final_offset = final_offset as usize;
            file.seek(final_offset).ok_or(SyscallErr::ESPIPE as usize)?;
            Ok(final_offset)
        }
        SEEK_END => {
            let inode = file
                .get_meta()
                .inner
                .lock()
                .inode
                .clone()
                .ok_or(SyscallErr::ESPIPE as usize)?;
            let data_size = inode.get_meta().inner.lock().data_size;
            let final_offset = data_size as isize + offset;
            if final_offset < 0 {
                return Err(SyscallErr::EINVAL as usize);
            }
            let final_offset = final_offset as usize;
            file.seek(final_offset).ok_or(SyscallErr::ESPIPE as usize)?;
            Ok(final_offset)
        }
        SEEK_DATA => {
            unimplemented!()
        }
        SEEK_HOLE => {
            unimplemented!()
        }
        _ => Err(SyscallErr::EINVAL as usize),
    }
}

pub fn sys_socketpair(domain: u32, socket_type: u32, protocol: u32, sv: usize) -> SyscallRet {
    trace!(
        "[sys_socketpair] domain: {}, socket_type: {}, protocol: {}, sv: {:#x}",
        domain,
        socket_type,
        protocol,
        sv
    );
    let process = current_process();
    let socket_pair = Pipe::new_socketpair();
    // let fdret = process.inner_handler(|inner| {
    //     let fd1 = inner
    //         .fd_table
    //         .alloc_and_set(0, FdInfo::default_flags(socket_pair.0.clone()))?;
    //     let fd2 = inner
    //         .fd_table
    //         .alloc_and_set(0, FdInfo::default_flags(socket_pair.1.clone()))?;
    //     (fd1, fd2)
    // });
    let fd1 = process
        .inner_lock()
        .fd_table
        .alloc_and_set(0, FdInfo::default_flags(socket_pair.0.clone()))?;
    let fd2 = process
        .inner_lock()
        .fd_table
        .alloc_and_set(0, FdInfo::default_flags(socket_pair.1.clone()))?;
    // let fdret: [i32; 2] = [fdret.0 as i32, fdret.1 as i32];
    let fdret = [fd1 as i32, fd2 as i32];
    let fdset_ptr = sv as *mut [i32; 2];
    unsafe {
        ptr::write(fdset_ptr, fdret);
    }
    Ok(0)
}

pub async fn sys_sync() -> SyscallRet {
    // todo: titanix fake implementation may need to do more
    trace!("[sys_sync] start to sync...");
    warn!("[sys_sync] not implemented.");
    trace!("[sys_sync] sync finished");
    Ok(0)
}
