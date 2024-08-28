use alloc::{boxed::Box, sync::Arc, vec::Vec};

use crate::{
    fs::inode::{Inode, InodeMeta, InodeMode},
    mutex::SpinNoIrqLock,
    AsyncResult, SysResult,
};

pub struct Ext4RamInode {
    meta: Arc<InodeMeta>,
    inner: SpinNoIrqLock<Ext4RamInodeInner>,
}

struct Ext4RamInodeInner {
    data: Vec<u8>,
}

impl Ext4RamInode {
    pub fn new(meta: Arc<InodeMeta>) -> Self {
        assert_eq!(meta.mode, InodeMode::FileREG);
        Self {
            meta,
            inner: SpinNoIrqLock::new(Ext4RamInodeInner { data: Vec::new() }),
        }
    }

    fn update_size(&self) {
        self.meta.inner.lock().data_size = self.inner.lock().data.len();
    }

    fn get_size(&self) -> usize {
        self.meta.inner.lock().data_size
    }
}
impl Inode for Ext4RamInode {
    fn read<'a>(&'a self, offset: usize, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            let inner_lock = self.inner.lock();
            let read_size = core::cmp::min(buf.len(), inner_lock.data.len() - offset);
            buf[..read_size].copy_from_slice(&inner_lock.data[offset..offset + read_size]);
            Ok(read_size)
        })
    }
    fn write<'a>(&'a self, offset: usize, buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            log::debug!(
                "[Ext4RamInode::write] offset = {}, buf.len() = {}",
                offset,
                buf.len()
            );
            let mut inner_lock = self.inner.lock();
            let old_size = inner_lock.data.len();
            if offset < old_size {
                let new_size = core::cmp::max(old_size, offset + buf.len());
                inner_lock.data.resize(new_size, 0);
                inner_lock.data[offset..offset + buf.len()].copy_from_slice(buf);
            } else {
                inner_lock.data.resize(old_size + buf.len(), 0);
                inner_lock.data[offset..offset + buf.len()].copy_from_slice(buf);
            }
            drop(inner_lock);
            self.update_size();
            Ok(buf.len())
        })
    }
    fn mknod(
        &self,
        this: Arc<dyn Inode>,
        name: &str,
        mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        panic!("[Ext4RamInode::mknod] not a directory");
    }
    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }
    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        panic!("[Ext4RamInode::load_children_from_disk] not a directory");
    }
    fn clear(&self) {
        self.inner.lock().data.clear();
        self.update_size();
    }
}
