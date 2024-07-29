use core::panic;

use alloc::{boxed::Box, sync::Arc};

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

pub struct CpuDmaLatencyInode {
    meta: Arc<InodeMeta>,
}

impl CpuDmaLatencyInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent.clone()),
            "/dev/cpu_dma_latency".into(),
            InodeMode::FileREG,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for CpuDmaLatencyInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        panic!("[CpuDmaLatencyInode::read] invalid");
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        // panic!("[CpuDmaLatencyInode::write] invalid");
        Box::pin(async move { Ok(_buf.len()) })
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[CpuDmaLatencyInode::mknod] invalid");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, _this: Arc<dyn Inode>) {
        panic!("[CpuDmaLatencyInode::load_children_from_disk] invalid");
    }
    fn clear(&self) {
        panic!("[CpuDmaLatencyInode::clear] invalid");
    }
}
