use core::panic;

use alloc::sync::Arc;

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    AsyncResult, SysResult,
};

use super::{meminfo::MeminfoInode, mounts::MountsInode};

pub struct ProcInode {
    meta: Arc<InodeMeta>,
}

impl ProcInode {
    pub fn new(parent: Arc<dyn Inode>) -> Self {
        let meta = Arc::new(InodeMeta::new(
            Some(parent.clone()),
            "/proc".into(),
            InodeMode::FileDIR,
            0,
            0,
        ));
        Self { meta }
    }
}

impl Inode for ProcInode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        panic!("[ProcInode::read] invalid");
    }
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        panic!("[ProcInode::write] invalid");
    }
    fn mknod(
        &self,
        _this: Arc<dyn Inode>,
        _name: &str,
        _mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[ProcInode::read] invalid");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        let meta = self.meta.clone();
        let mut meta_inner = meta.inner.lock();
        let mounts: Arc<dyn Inode> = Arc::new(MountsInode::new(this.clone()));
        let meminfo: Arc<dyn Inode> = Arc::new(MeminfoInode::new(this.clone()));
        meta_inner.children.insert(mounts.get_name(), mounts);
        meta_inner.children.insert(meminfo.get_name(), meminfo);
    }
    fn clear(&self) {
        panic!("[ProcInode::clear] invalid");
    }
}
