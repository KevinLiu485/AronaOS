//! Memory management implementation
//!
//! SV39 page-based virtual-memory architecture for RV64 systems, and
//! everything about memory management, like frame allocator, page table,
//! map area and memory set, is implemented here.
//!
//! Every task or process has a memory_set to control its virtual memory.
mod address;
mod cow;
mod frame_allocator;
mod heap_allocator;
mod memory_set;
mod page_table;
pub mod user_check;

use address::VPNRange;
pub use address::{KernelAddr, PhysAddr, PhysPageNum, StepByOne, VirtAddr, VirtPageNum};
pub use cow::handle_recoverable_page_fault;
pub use frame_allocator::{frame_alloc, frame_dealloc, FrameTracker};
pub use memory_set::{dump_test, from_global_test, remap_test};
pub use memory_set::{kernel_token, MapPermission, MemorySet, KERNEL_SPACE};
pub use page_table::PTEFlags;
pub use page_table::{
    current_satp, /* translated_byte_buffer,  */ PageTable,
    PageTableEntry, /* UserBuffer, UserBufferIterator ,*/
};

/// initiate heap allocator, frame allocator and kernel space
pub fn init() {
    heap_allocator::init_heap();
    // heap_test();
    frame_allocator::init_frame_allocator();
    // frame_allocator_test();
    //KERNEL_SPACE.exclusive_access().activate

    KERNEL_SPACE.lock().activate();
}
