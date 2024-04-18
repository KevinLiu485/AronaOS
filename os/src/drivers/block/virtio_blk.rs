use core::ptr::NonNull;

use super::BlockDevice;
use crate::config::{KERNEL_BASE, PAGE_SIZE};
use crate::mm::{
    frame_alloc, frame_alloc_contig, frame_dealloc, kernel_token, FrameTracker, KernelAddr,
    PageTable, PhysAddr, PhysPageNum, StepByOne, VirtAddr,
};
use crate::sync::UPSafeCell;
use alloc::vec::Vec;
use lazy_static::*;
use virtio_drivers::device::blk::VirtIOBlk;
use virtio_drivers::transport::mmio::{MmioTransport, VirtIOHeader};
use virtio_drivers::{BufferDirection, Hal};

#[allow(unused)]
const VIRTIO0: usize = 0x10001000 + KERNEL_BASE;
// const VIRTIO0: usize = 0x10001000;

pub struct VirtIOBlock(UPSafeCell<VirtIOBlk<VirtioHal, MmioTransport>>);

lazy_static! {
    static ref QUEUE_FRAMES: UPSafeCell<Vec<FrameTracker>> = unsafe { UPSafeCell::new(Vec::new()) };
}

unsafe impl Send for VirtIOBlock {}
unsafe impl Sync for VirtIOBlock {}

impl BlockDevice for VirtIOBlock {
    fn read_block(&self, block_id: usize, buf: &mut [u8]) {
        self.0
            .exclusive_access()
            .read_blocks(block_id, buf)
            .expect("Error when reading VirtIOBlk");
    }
    fn write_block(&self, block_id: usize, buf: &[u8]) {
        self.0
            .exclusive_access()
            .write_blocks(block_id, buf)
            .expect("Error when writing VirtIOBlk");
    }
}

impl VirtIOBlock {
    // #[allow(unused)]
    // pub fn new() -> Self {
    //     unsafe {
    //         Self(UPSafeCell::new(
    //             VirtIOBlk::<VirtioHal>::new(&mut *(VIRTIO0 as *mut VirtIOHeader)).unwrap(),
    //         ))
    //     }
    // }
    pub fn new() -> Self {
        unsafe {
            let header = &mut *(VIRTIO0 as *mut VirtIOHeader);
            Self(UPSafeCell::new(
                VirtIOBlk::<VirtioHal, MmioTransport>::new(
                    MmioTransport::new(header.into()).unwrap(),
                )
                .unwrap(),
            ))
        }
    }
}

pub struct VirtioHal;

unsafe impl Hal for VirtioHal {
    fn dma_alloc(
        pages: usize,
        _direction: BufferDirection,
    ) -> (virtio_drivers::PhysAddr, NonNull<u8>) {
        let mut ppn_base = PhysPageNum(0);
        // We lock the queue in advance to ensure that we can get a contiguous area
        let mut queue_frames_inner = QUEUE_FRAMES.exclusive_access();
        let mut frames = frame_alloc_contig(pages);
        for i in 0..pages {
            let frame = frames.pop().unwrap();
            if i == pages - 1 {
                ppn_base = frame.ppn;
            }
            // println!("ppn {}", frame.ppn.0);
            // assert_eq!(frame.ppn.0, ppn_base.0 + i);
            queue_frames_inner.push(frame);
        }
        let pa: PhysAddr = ppn_base.into();
        (pa.0, unsafe {
            NonNull::new_unchecked(KernelAddr::from(pa).0 as *mut u8)
        })
    }

    unsafe fn dma_dealloc(
        paddr: virtio_drivers::PhysAddr,
        _vaddr: NonNull<u8>,
        pages: usize,
    ) -> i32 {
        let pa = PhysAddr::from(paddr);
        let mut ppn_base: PhysPageNum = pa.into();
        for _ in 0..pages {
            frame_dealloc(ppn_base);
            ppn_base.step();
        }
        0
    }

    unsafe fn mmio_phys_to_virt(
        paddr: virtio_drivers::PhysAddr,
        _size: usize,
    ) -> core::ptr::NonNull<u8> {
        // debug!("phy2virt: addr {:#x}", paddr);
        NonNull::new_unchecked(KernelAddr::from(PhysAddr::from(paddr)).0 as *mut u8)
    }

    unsafe fn share(
        buffer: core::ptr::NonNull<[u8]>,
        _direction: virtio_drivers::BufferDirection,
    ) -> virtio_drivers::PhysAddr {
        PageTable::from_token(kernel_token())
            .translate_va(VirtAddr::from(buffer.as_ptr() as *const usize as usize))
            .unwrap()
            .0
        // unsafe {
        //     (*KERNEL_SPACE
        //         .as_ref()
        //         .expect("KERENL SPACE not init yet")
        //         .page_table
        //         .get())
        //     .translate_va(VirtAddr::from(buffer.as_ptr() as *const usize as usize))
        //     .unwrap()
        //     .0
        // }
        // todo!()
    }

    unsafe fn unshare(
        _paddr: virtio_drivers::PhysAddr,
        _buffer: core::ptr::NonNull<[u8]>,
        _direction: virtio_drivers::BufferDirection,
    ) {
        // todo!()
    }
}

// impl Hal for VirtioHal {
// fn dma_alloc(pages: usize) -> usize {
//     let mut ppn_base = PhysPageNum(0);
//     for i in 0..pages {
//         let frame = frame_alloc().unwrap();
//         if i == pages - 1 {
//             ppn_base = frame.ppn;
//         }
//         // assert_eq!(frame.ppn.0, ppn_base.0 + i);
//         QUEUE_FRAMES.exclusive_access().push(frame);
//     }
//     let pa: PhysAddr = ppn_base.into();
//     pa.0
// }
//
// fn dma_dealloc(pa: usize, pages: usize) -> i32 {
//     let pa = PhysAddr::from(pa);
//     let mut ppn_base: PhysPageNum = pa.into();
//     for _ in 0..pages {
//         frame_dealloc(ppn_base);
//         ppn_base.step();
//     }
//     0
// }
//
// fn phys_to_virt(addr: usize) -> usize {
//     addr + KERNEL_BASE
//     // addr
// }
//
// fn virt_to_phys(vaddr: usize) -> usize {
//     PageTable::from_token(kernel_token())
//         .translate_va(VirtAddr::from(vaddr))
//         .unwrap()
//         .0
//     // vaddr - KERNEL_BASE
// }
// }
