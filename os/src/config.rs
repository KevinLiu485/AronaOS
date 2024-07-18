//! Constants and types used in rCore
#![allow(unused)]

// current qemu memsize: 128MB
// pub const USER_STACK_SIZE: usize = 4096 * 2;    // 8KB
pub const USER_STACK_SIZE: usize = 4096 * 256; // 1MB
                                               //pub const USER_HEAP_SIZE: usize = 4096 * 2;
                                               // pub const KERNEL_HEAP_SIZE: usize = 0x2_00000;   // 2MB
pub const KERNEL_HEAP_SIZE: usize = 0x300_0000; // 48MB
                                                // const BLOCK_CACHE_SIZE: usize = 16; // 16 * 512 = 8KB
pub const BLOCK_CACHE_SIZE: usize = 2048 * 24; // 24 * 2048 * 512 = 24MB

pub const KERNEL_BASE: usize = 0xffff_ffc0_0000_0000;
pub const KERNEL_DIRECT_OFFSET: usize = 0xf_ffff_fc00_0000;
pub const PAGE_SIZE: usize = 0x1000;
pub const PAGE_SIZE_BITS: usize = 0xc;
pub const USER_MAX_VA: usize = 0x0000_003f_ffff_ffff; // 256GB
                                                      // pub const MMAP_MIN_ADDR: usize = 65536;
pub const MMAP_MIN_ADDR: usize = 0x20_0000_0000; // mmap area: 128GB

pub const SIG_NUM: usize = 33;

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
