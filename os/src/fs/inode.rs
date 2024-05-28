use core::sync::atomic::{AtomicUsize, Ordering};

use alloc::{
    collections::BTreeMap,
    string::{String, ToString},
    sync::{Arc, Weak},
    vec::Vec,
};

use crate::{
    config::{AsyncResult, SysResult},
    fat32::FSMutex,
    timer::TimeSpec,
};

use super::path::Path;

#[derive(PartialEq, Debug, Clone, Copy)]
pub enum InodeMode {
    FileDIR,
    FileREG,
}

pub trait Inode: Send + Sync {
    // fn find(&self, name: &str) -> Option<Arc<dyn Inode>>;
    // fn create(&self, name: &str) -> Option<Arc<dyn Inode>>;
    // fn clear(&self);
    // fn write_at(&self, offset: usize, buf: &[u8]) -> AsyncResult<usize>;
    // fn read_at(&self, offset: usize, buf: &mut [u8]) -> AsyncResult<usize>;
    // fn ls(&self) -> Vec<String>;
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize>;
    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize>;
    fn mknod(&self, this: Arc<dyn Inode>, name: &str, mode: InodeMode)
        -> SysResult<Arc<dyn Inode>>;
    fn find(&self, this: Arc<dyn Inode>, name: &str) -> SysResult<Arc<dyn Inode>>;
    fn list(&self, this: Arc<dyn Inode>) -> SysResult<Vec<Arc<dyn Inode>>>;
    fn get_meta(&self) -> Arc<InodeMeta>;
    fn load_children_from_disk(&self, this: Arc<dyn Inode>);
    fn clear(&self);
}

impl dyn Inode {
    pub fn insert_child(&self, name: String, inode: Arc<dyn Inode>) {
        self.get_meta().inner.lock().children.insert(name, inode);
    }

    pub fn sync(&self) {
        todo!();
        // if self.get_meta().mode == InodeMode::FileREG {
        //     // sync self
        // } else {
        //     // sync self and all children
        // }
    }

    pub fn get_name(&self) -> String {
        self.get_meta().name.clone()
    }

    pub fn mkdir_v(self: &Arc<Self>, name: &str, mode: InodeMode) -> SysResult<Arc<dyn Inode>> {
        let child = self.mknod(self.clone(), name, mode)?;
        log::info!("[mkdir_v] child inode name {}", name);
        self.get_meta()
            .inner
            .lock()
            .children
            .insert(name.to_string(), child.clone());
        // insert to cache
        // let key = HashKey::new(self.metadata().ino, name.to_string());
        // log::info!("[mkdir_v] insert {:?} into INODE_CACHE", key);
        // INODE_CACHE.insert(key, child.clone());
        Ok(child)
    }

    pub fn mknod_v(
        self: &Arc<Self>,
        name: &str,
        mode: InodeMode,
        // dev_id: Option<usize>,
    ) -> SysResult<Arc<dyn Inode>> {
        // stack_trace!();
        let child = self.mknod(self.clone(), name, mode)?;
        self.get_meta()
            .inner
            .lock()
            .children
            .insert(name.to_string(), child.clone());
        // insert to cache
        // let key = HashKey::new(self.metadata().ino, child.metadata().name.clone());
        // log::info!(
        //     "[mknod_v] child inode name {}, parent ino {}, key {:?}",
        //     name,
        //     self.metadata().ino,
        //     key
        // );
        // INODE_CACHE.insert(key, child.clone());

        // child.create_page_cache_if_needed();
        Ok(child)
    }

    // pub fn drop(&self) {
    //     todo!();
    // }
}

pub struct InodeMeta {
    /// inode number
    pub ino: usize,
    /// type of inode
    pub mode: InodeMode,
    /// name which doesn't have slash
    pub name: String,
    /// path
    pub path: Path,
    pub inner: FSMutex<InodeMetaInner>,
}

impl InodeMeta {
    pub fn new(
        parent: Option<Arc<dyn Inode>>,
        path: Path,
        mode: InodeMode,
        data_len: usize,
    ) -> Self {
        let parent = match parent {
            Some(parent) => Some(Arc::downgrade(&parent)),
            None => None,
        };

        Self {
            ino: INODE_NUMBER.fetch_add(1, Ordering::Relaxed),
            mode,
            name: path.get_name(),
            path,
            inner: FSMutex::new(InodeMetaInner {
                st_atim: TimeSpec::new(),
                st_mtim: TimeSpec::new(),
                st_ctim: TimeSpec::new(),
                parent,
                children: BTreeMap::new(),
                data_len,
            }),
        }
    }
}

#[derive(Clone)]
pub struct InodeMetaInner {
    /// last access time, need to flush to disk.
    pub st_atim: TimeSpec,
    /// last modification time, need to flush to disk
    pub st_mtim: TimeSpec,
    /// last status change time, need to flush to disk
    pub st_ctim: TimeSpec,
    /// parent
    pub parent: Option<Weak<dyn Inode>>,
    /// children list (name, inode)
    pub children: BTreeMap<String, Arc<dyn Inode>>,
    /// file content len
    pub data_len: usize,
    // inode state
    // pub state: InodeState,
    // elf data
    // pub elf_data: Arc<SyncUnsafeCell<Vec<u8>>>,
}

static INODE_NUMBER: AtomicUsize = AtomicUsize::new(0);
