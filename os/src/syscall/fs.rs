//! File and filesystem-related syscalls
use log::info;

use crate::config::SyscallRet;
use crate::fs::{open_file, OpenFlags};
use crate::mm::{translated_byte_buffer, translated_str, UserBuffer};
use crate::task::{current_task, current_user_token};

pub async fn sys_write(fd: usize, buf: usize, len: usize) -> SyscallRet {
    let token = current_user_token();
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
            .write(UserBuffer::new(translated_byte_buffer(
                token,
                buf as *const u8,
                len,
            )))
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
    let token = current_user_token();
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
            .read(UserBuffer::new(translated_byte_buffer(
                token,
                buf as *const u8,
                len,
            )))
            .await?;
        Ok(ret)
    } else {
        Err(1)
    }
}

pub fn sys_open(path: *const u8, flags: u32) -> SyscallRet {
    let task = current_task().unwrap();
    let token = current_user_token();
    let path = translated_str(token, path);
    if let Ok(inode) = open_file(path.as_str(), OpenFlags::from_bits(flags).unwrap()) {
        let mut inner = task.inner_lock();
        let fd = inner.alloc_fd();
        inner.fd_table[fd] = Some(inode);
        info!(
            "[sys_open] pid {} open file: {} -> fd: {}",
            task.pid, path, fd
        );
        Ok(fd)
    } else {
        Err(1)
    }
}

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
