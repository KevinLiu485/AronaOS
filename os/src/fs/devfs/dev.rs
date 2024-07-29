use core::panic;

use alloc::sync::Arc;

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

use super::{cpu_dma_latency::CpuDmaLatencyInode, misc::MiscInode, null::NullInode, tty::TtyInode};

pub struct DevInode {
    meta: Arc<InodeMeta>,
}

impl DevInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent.clone()),
            "/dev".into(),
            InodeMode::FileDIR,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for DevInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        panic!("[DevInode::read] invalid");
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        panic!("[DevInode::write] invalid");
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[DevInode::read] invalid");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        let meta = self.meta.clone();
        let mut meta_inner = meta.inner.lock();
        let tty: Arc<dyn Inode> = Arc::new(TtyInode::new(this.clone()));
        let misc: Arc<dyn Inode> = Arc::new(MiscInode::new(this.clone()));
        let null: Arc<dyn Inode> = Arc::new(NullInode::new(this.clone()));
        let cpu_dma_latency: Arc<dyn Inode> = Arc::new(CpuDmaLatencyInode::new(this.clone()));
        meta_inner.children.insert(tty.get_name(), tty);
        meta_inner.children.insert(misc.get_name(), misc);
        meta_inner.children.insert(null.get_name(), null);
        meta_inner
            .children
            .insert(cpu_dma_latency.get_name(), cpu_dma_latency);
    }
    fn clear(&self) {
        panic!("[DevInode::clear] invalid");
    }
}
