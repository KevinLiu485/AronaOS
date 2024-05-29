//! File system in os
pub mod inode;
mod os_inode;
pub mod path;
mod stdio;

use crate::{
    config::{AsyncResult, AsyncSyscallRet},
    // mm::UserBuffer,
};

/// File trait
pub trait File: Send + Sync {
    /// If readable
    fn readable(&self) -> bool;
    /// If writable
    fn writable(&self) -> bool;
    /// Read file to `UserBuffer`
    // fn read(&self, buf: UserBuffer) -> AsyncSyscallRet;
    fn read<'a>(&'a self, buf: &'a mut [u8]) -> AsyncSyscallRet;
    /// Write `UserBuffer` to file
    // fn write(&self, buf: UserBuffer) -> AsyncResult<usize>;
    fn write<'a>(&'a self, buf: &'a [u8]) -> AsyncResult<usize>;
}

pub use os_inode::{list_apps, open_file, OSInode, OpenFlags};
pub use stdio::{Stdin, Stdout};
