use super::{BlockDevice, VIRTIO_BLOCK_SIZE};
use crate::config::KERNEL_BASE;
use crate::mm::{
    frame_alloc, frame_dealloc, kernel_token, FrameTracker, PageTable, PhysAddr, PhysPageNum,
    StepByOne, VirtAddr,
};
use crate::sync::UPSafeCell;
use alloc::vec;
use alloc::vec::Vec;
use lazy_static::*;
use virtio_drivers::{Hal, VirtIOBlk, VirtIOHeader};

#[allow(unused)]
const VIRTIO0: usize = 0x10001000 + KERNEL_BASE;

pub struct VirtIOBlock(UPSafeCell<VirtIOBlk<'static, VirtioHal>>);

lazy_static! {
    static ref QUEUE_FRAMES: UPSafeCell<Vec<FrameTracker>> = unsafe { UPSafeCell::new(Vec::new()) };
}

impl BlockDevice for VirtIOBlock {
    fn read_block(&self, block_id: usize, buf: &mut [u8]) {
        self.0
            .exclusive_access()
            .read_block(block_id, buf)
            .expect("Error when reading VirtIOBlk");
    }
    fn write_block(&self, block_id: usize, buf: &[u8]) {
        self.0
            .exclusive_access()
            .write_block(block_id, buf)
            .expect("Error when writing VirtIOBlk");
    }
}

impl ext4_rs::BlockDevice for VirtIOBlock {
    // read data from offset in byte, return a Vec<u8> with length of ext4_rs::BLOCK_SIZE(4096 B)
    fn read_offset(&self, offset: usize) -> Vec<u8> {
        let mut block_id = offset / VIRTIO_BLOCK_SIZE;
        let mut buf = vec![0u8; VIRTIO_BLOCK_SIZE];
        let mut ret = Vec::<u8>::new();
        let aligned = offset % VIRTIO_BLOCK_SIZE == 0;
        let times = if aligned {
            ext4_rs::BLOCK_SIZE / VIRTIO_BLOCK_SIZE
        } else {
            ext4_rs::BLOCK_SIZE / VIRTIO_BLOCK_SIZE + 1
        };
        ret.reserve(times);
        for i in 0..times {
            self.0
                .exclusive_access()
                .read_block(block_id, &mut buf)
                .expect("Error when reading VirtIOBlk");
            block_id += 1;
            ret.extend_from_slice(&buf);
        }
        if aligned {
            ret
        } else {
            ret[offset % VIRTIO_BLOCK_SIZE..(offset % VIRTIO_BLOCK_SIZE + ext4_rs::BLOCK_SIZE)]
                .to_vec()
        }
    }

    // write data to offset in byte
    fn write_offset(&self, offset: usize, data: &[u8]) {
        let len = data.len();
        // we cannot write half blocks
        assert!(offset % VIRTIO_BLOCK_SIZE == 0);
        assert!(len % VIRTIO_BLOCK_SIZE == 0);
        let mut block_id = offset / VIRTIO_BLOCK_SIZE;
        for i in 0..len / VIRTIO_BLOCK_SIZE {
            self.0
                .exclusive_access()
                .write_block(
                    block_id,
                    &data[i * VIRTIO_BLOCK_SIZE..(i + 1) * VIRTIO_BLOCK_SIZE],
                )
                .expect("Error when writing VirtIOBlk");
            block_id += 1;
        }
    }
}

impl VirtIOBlock {
    #[allow(unused)]
    pub fn new() -> Self {
        unsafe {
            Self(UPSafeCell::new(
                VirtIOBlk::<VirtioHal>::new(&mut *(VIRTIO0 as *mut VirtIOHeader)).unwrap(),
            ))
        }
    }
}

pub struct VirtioHal;

impl Hal for VirtioHal {
    fn dma_alloc(pages: usize) -> usize {
        let mut ppn_base = PhysPageNum(0);
        for i in 0..pages {
            let frame = frame_alloc().unwrap();
            if i == 0 {
                ppn_base = frame.ppn;
            }
            assert_eq!(frame.ppn.0, ppn_base.0 + i);
            QUEUE_FRAMES.exclusive_access().push(frame);
        }
        let pa: PhysAddr = ppn_base.into();
        pa.0
    }

    fn dma_dealloc(pa: usize, pages: usize) -> i32 {
        let pa = PhysAddr::from(pa);
        let mut ppn_base: PhysPageNum = pa.into();
        for _ in 0..pages {
            frame_dealloc(ppn_base);
            ppn_base.step();
        }
        0
    }

    fn phys_to_virt(addr: usize) -> usize {
        addr + KERNEL_BASE
    }

    fn virt_to_phys(vaddr: usize) -> usize {
        PageTable::from_token(kernel_token())
            .translate_va(VirtAddr::from(vaddr))
            .unwrap()
            .0
    }
}
