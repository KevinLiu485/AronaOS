//! File and filesystem-related syscalls
use crate::config::SyscallRet;
use crate::fs::{open_file, OpenFlags};
use crate::mm::{translated_byte_buffer, translated_str, UserBuffer};
use crate::task::{current_task, current_user_token};

pub async fn sys_write(fd: usize, buf: usize, len: usize) -> SyscallRet {
    let token = current_user_token();
    let task = current_task().unwrap();
    // let inner = task.inner_lock();
    // let fd_table = task.get_inner_fd_table();
    let fd_table_len = task.inner_handler(|inner| inner.fd_table.len());
    if fd >= fd_table_len {
        return Err(());
    }
    let file = task.inner_handler(|inner| inner.fd_table[fd].clone());
    if let Some(file) = file {
        if !file.writable() {
            return Err(());
        }
        let file = file.clone();
        // release current task TCB manually to avoid multi-borrow
        // drop(inner);
        let ret = file
            .write(UserBuffer::new(translated_byte_buffer(
                token,
                buf as *const u8,
                len,
            )))
            .await?;
        Ok(ret)
    } else {
        Err(())
    }
}

pub async fn sys_read(
    fd: usize,
    buf: usize, /* cannot use `*const u8` here as it does not satisfy `Send` trait */
    len: usize,
) -> SyscallRet {
    let token = current_user_token();
    let task = current_task().unwrap();
    // let inner = task.inner_lock();
    /* cannot use `inner` as MutexGuard will cross `await` that way */
    // let fd_table = task.get_inner_fd_table();
    let fd_table_len = task.inner_handler(|inner| inner.fd_table.len());
    if fd >= fd_table_len {
        return Err(());
    }
    // if let Some(file) = &fd_table[fd] {
    let file = task.inner_handler(|inner| inner.fd_table[fd].clone());
    if let Some(file) = file {
        let file = file.clone();
        if !file.readable() {
            return Err(());
        }
        // release current task TCB manually to avoid multi-borrow
        // drop(inner);
        let ret = file
            .read(UserBuffer::new(translated_byte_buffer(
                token,
                buf as *const u8,
                len,
            )))
            .await?;
        Ok(ret)
    } else {
        Err(())
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
        Ok(fd)
    } else {
        Err(())
    }
}

pub fn sys_close(fd: usize) -> SyscallRet {
    let task = current_task().unwrap();
    let mut inner = task.inner_lock();
    if fd >= inner.fd_table.len() {
        return Err(());
    }
    if inner.fd_table[fd].is_none() {
        return Err(());
    }
    inner.fd_table[fd].take();
    Ok(0)
}
