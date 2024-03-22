//! Constants used in rCore
#[allow(unused)]

pub const USER_STACK_SIZE: usize = 4096 * 2;
pub const KERNEL_STACK_SIZE: usize = 4096 * 2;
pub const KERNEL_HEAP_SIZE: usize = 0x20_0000;
pub const KERNEL_BASE: usize = 0xffff_ffc0_0000_0000;
pub const USER_MAX_VA: usize = 0x0000_003f_ffff_ffff;
pub const KERNEL_MAX_VA: usize = usize::MAX;
pub const TRAP_CONTEXT: usize = USER_MAX_VA - PAGE_SIZE + 1;

pub const PAGE_SIZE: usize = 0x1000;
pub const PAGE_SIZE_BITS: usize = 0xc;

pub const TRAMPOLINE: usize = usize::MAX - PAGE_SIZE + 1;

pub use crate::board::{CLOCK_FREQ, MEMORY_END, MMIO};

pub fn kernel_stack_position(app_id: usize) -> (usize, usize) {
    let top = KERNEL_MAX_VA - app_id * (KERNEL_STACK_SIZE + PAGE_SIZE);
    let bottom = top - KERNEL_STACK_SIZE;
    (bottom, top)
}