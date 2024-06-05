//! Constants and types used in rCore
#![allow(unused)]

pub const USER_STACK_SIZE: usize = 4096 * 2;
//pub const USER_HEAP_SIZE: usize = 4096 * 2;
// pub const KERNEL_HEAP_SIZE: usize = 0x2_00000;   // 2MB
pub const KERNEL_HEAP_SIZE: usize = 0x30_00000; // 48MB

pub const KERNEL_BASE: usize = 0xffff_ffc0_0000_0000;
pub const KERNEL_DIRECT_OFFSET: usize = 0xffff_ffc0_0000_0;
pub const PAGE_SIZE: usize = 0x1000;
pub const PAGE_SIZE_BITS: usize = 0xc;
pub const USER_MAX_VA: usize = 0x0000_003f_ffff_ffff;
pub const MMAP_MIN_ADDR: usize = 65536;

// pub const TRAMPOLINE: usize = usize::MAX - PAGE_SIZE + 1;
// pub const TRAP_CONTEXT: usize = TRAMPOLINE - PAGE_SIZE;

use core::{future::Future, pin::Pin};

use alloc::boxed::Box;

pub use crate::board::{CLOCK_FREQ, MEMORY_END, MMIO};

pub type SysFuture<'a, T> = Pin<Box<dyn Future<Output = T> + Send + 'a>>;

// pub type SysResult<T> = Result<T, ()>;
pub type SysResult<T> = Result<T, usize>;
pub type SyscallRet = SysResult<usize>;

pub type AsyncResult<'a, T> = SysFuture<'a, SysResult<T>>;
pub type AsyncSyscallRet<'a> = SysFuture<'a, SyscallRet>;
