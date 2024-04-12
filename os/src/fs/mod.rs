//! File system in os
mod inode;
mod stdio;

use core::{future::Future, pin::Pin};

use crate::mm::UserBuffer;

pub type FileReadFuture<'a> = Pin<Box<dyn Future<Output = usize> + Send + 'a>>;

/// File trait
pub trait File: Send + Sync {
    /// If readable
    fn readable(&self) -> bool;
    /// If writable
    fn writable(&self) -> bool;
    /// Read file to `UserBuffer`
    fn read(&self, buf: UserBuffer) -> FileReadFuture;
    /// Write `UserBuffer` to file
    fn write(&self, buf: UserBuffer) -> usize;
}

use alloc::boxed::Box;
pub use inode::{list_apps, open_file, OSInode, OpenFlags};
pub use stdio::{Stdin, Stdout};
