//! Memory management implementation
//!
//! SV39 page-based virtual-memory architecture for RV64 systems, and
//! everything about memory management, like frame allocator, page table,
//! map area and memory set, is implemented here.
//!
//! Every task or process has a memory_set to control its virtual memory.
mod address;
mod frame_allocator;
mod heap_allocator;
mod memory_set;
mod page_table;

use address::VPNRange;
pub use address::{KernelAddr, PhysAddr, PhysPageNum, StepByOne, VirtAddr, VirtPageNum};
pub use frame_allocator::{frame_alloc, frame_dealloc, FrameTracker};
pub use memory_set::{dump_test, from_global_test, remap_test};
pub use memory_set::{kernel_token, MapPermission, MemorySet, KERNEL_SPACE};
use page_table::PTEFlags;
pub use page_table::{
    current_satp, translated_byte_buffer, translated_ref, translated_refmut, translated_str,
    PageTable, PageTableEntry, UserBuffer, UserBufferIterator,
};

use self::frame_allocator::frame_allocator_test;
use self::heap_allocator::heap_test;
/// initiate heap allocator, frame allocator and kernel space
pub fn init() {
    heap_allocator::init_heap();
    heap_test();
    frame_allocator::init_frame_allocator();
    frame_allocator_test();
    //KERNEL_SPACE.exclusive_access().activate
    memory_set::init_kernel_space();
    unsafe {
        KERNEL_SPACE
            .as_ref()
            .expect("KERNEL SPACE not init yet")
            .activate();
    }
}
