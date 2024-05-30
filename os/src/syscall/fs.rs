//! File and filesystem-related syscalls

use log::info;

use crate::config::SyscallRet;
use crate::fs::inode::InodeMode;
use crate::fs::path::Path;
use crate::fs::{create_dir, open_file, open_inode, OpenFlags, AT_FDCWD, AT_REMOVEDIR};
use crate::task::current_task;

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

// pub fn sys_open(path: *const u8, flags: u32) -> SyscallRet {
//     let task = current_task().unwrap();
//     let token = current_user_token();
//     let path = c_str_to_string(path);
//     if let Ok(inode) = open_file(path.as_str(), OpenFlags::from_bits(flags).unwrap()) {
//         let mut inner = task.inner_lock();
//         let fd = inner.alloc_fd();
//         inner.fd_table[fd] = Some(inode);
//         info!(
//             "[sys_open] pid {} open file: {} -> fd: {}",
//             task.pid, path, fd
//         );
//         Ok(fd)
//     } else {
//         Err(1)
//     }
// }

pub fn sys_close(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
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
    let task = current_task().unwrap();
    let path = Path::from(c_str_to_string(pathname));
    if let Ok(inode) = open_file(dirfd, &path, OpenFlags::from_bits(flags).unwrap()) {
        let mut inner = task.inner_lock();
        let fd = inner.alloc_fd();
        inner.fd_table[fd] = Some(inode);
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
    let path = Path::from(c_str_to_string(pathname));
    create_dir(dirfd, &path)
}

pub fn sys_fstat(_fd: usize, _buf: *const u8) -> SyscallRet {
    
    Ok(0)
}

pub fn sys_getdents64(_fd: usize, buf: *const u8, len: usize) -> SyscallRet {
    let slice = unsafe { core::slice::from_raw_parts_mut(buf as *mut u8, len) };
    let dent = "12345678123456781211";
    slice[..20].copy_from_slice(dent.as_bytes());
    Ok(0)
}

pub fn sys_dup(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    task.inner_handler(|inner| {
        if inner.fd_table.len() <= fd {
            return Err(1);
        }
        inner.fd_table[fd]
            .clone()
            .map(|file| {
                let new_fd = inner.alloc_fd();
                inner.fd_table[new_fd] = Some(file);
                Ok(new_fd)
            })
            .unwrap_or(Err(1))
    })
}

pub fn sys_dup3(oldfd: usize, newfd: usize) -> SyscallRet {
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
    todo!()
}
