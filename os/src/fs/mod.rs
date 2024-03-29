//! File system in os
mod inode;
mod stdio;

use crate::mm::UserBuffer;
/// File trait
pub trait File: Send + Sync {
    /// If readable
    fn readable(&self) -> bool;
    /// If writable
    fn writable(&self) -> bool;
    /// Read file to `UserBuffer`
    fn read(&self, buf: &mut [u8]) -> usize;
    /// Write `UserBuffer` to file
    fn write(&self, buf: &[u8]) -> usize;
}

pub use inode::{list_apps, open_file, OSInode, OpenFlags};
pub use stdio::{Stdin, Stdout};
