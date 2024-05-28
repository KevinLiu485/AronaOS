use alloc::{
    boxed::Box,
    string::{String, ToString},
    sync::{Arc, Weak},
    vec::Vec,
};
use log::error;
use riscv::register::marchid;

use crate::{
    config::{AsyncResult, SysFuture, SysResult},
    fat32::dentry::append_path,
    fs::{
        inode::{Inode, InodeMeta, InodeMode},
        path::Path,
    },
    mutex::SpinNoIrqLock,
};

use super::{
    dentry::{FAT32DentryContent, FAT32DirEntry, ATTR_DIRECTORY},
    fat::FAT32FileAllocTable,
    file::FAT32File,
    fs::FAT32FileSystem,
    time::{unix_time_to_timespec, FAT32_to_unix_time},
    FSMutex,
};

pub struct FAT32Inode {
    fat: Arc<FAT32FileAllocTable>,
    file: Arc<FSMutex<FAT32File>>,
    meta: Arc<InodeMeta>,
    // parent: Option<Weak<dyn Inode>>,
    // path: String, // in format of "/a/b" or ""(root)
    // mode: InodeMode,
}

impl FAT32Inode {
    pub fn new_root(
        fat: Arc<FAT32FileAllocTable>,
        fa_inode: Option<Arc<dyn Inode>>,
        path: &str,
        first_cluster: usize,
    ) -> Self {
        let file = FAT32File::new(Arc::clone(&fat), first_cluster, None);
        Self {
            fat: Arc::clone(&fat),
            file: Arc::new(FSMutex::new(file)),
            meta: Arc::new(InodeMeta::new(
                fa_inode,
                Path::from(path),
                InodeMode::FileDIR,
                0,
            )),
        }
    }

    pub fn from_dentry(
        fat: Arc<FAT32FileAllocTable>,
        fa_inode: Option<Arc<dyn Inode>>,
        dentry: &FAT32DirEntry,
    ) -> Self {
        let mode = if (dentry.attr & ATTR_DIRECTORY) == ATTR_DIRECTORY {
            InodeMode::FileDIR
        } else {
            InodeMode::FileREG
        };
        // let parent = match fa_inode {
        //     Some(fa_inode) => Some(Arc::downgrade(&fa_inode)),
        //     None => None,
        // };
        let file = FAT32File::new(
            Arc::clone(&fat),
            dentry.fstcluster as usize,
            match mode {
                InodeMode::FileREG => Some(dentry.filesize as usize),
                InodeMode::FileDIR => None,
            },
        );
        Self {
            fat: Arc::clone(&fat),
            file: Arc::new(FSMutex::new(file)),
            meta: Arc::new(InodeMeta::new(
                fa_inode,
                Path::from(dentry.fname()),
                mode,
                dentry.filesize as usize,
            )),
        }
    }

    pub fn new(
        fat: Arc<FAT32FileAllocTable>,
        fa_inode: Arc<dyn Inode>,
        name: &str,
        mode: InodeMode,
    ) -> Self {
        let parent_path = &fa_inode.get_meta().path;
        let path = parent_path.clone_and_append(name);
        log::debug!(
            "[FAT32Inode::new] parent_path: {}, path: {}",
            parent_path,
            path
        );
        let file = FAT32File::new(
            Arc::clone(&fat),
            0,
            match mode {
                InodeMode::FileREG => Some(0),
                InodeMode::FileDIR => None,
            },
        );
        Self {
            fat: Arc::clone(&fat),
            file: Arc::new(FSMutex::new(file)),
            meta: Arc::new(InodeMeta::new(
                Some(fa_inode),
                Path::from(path.clone()),
                mode,
                0,
            )),
        }
    }
}

impl Inode for FAT32Inode {
    fn read<'a>(&'a self, _offset: usize, _buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move { Ok(self.file.lock().read(_buf, _offset)) })
    }

    fn write<'a>(&'a self, _offset: usize, _buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move { Ok(self.file.lock().write(_buf, _offset)) })
    }

    fn mknod(
        &self,
        this: Arc<dyn Inode>,
        name: &str,
        mode: InodeMode,
    ) -> SysResult<Arc<dyn Inode>> {
        // stack_trace!();
        // if self.metadata().mode != InodeMode::FileDIR {
        //     return Err(SyscallErr::ENOTDIR);
        // }
        if self.meta.mode != InodeMode::FileDIR {
            return Err(());
        }
        let fat = Arc::clone(&self.fat);
        let s_inode = FAT32Inode::new(fat, this, name, mode);
        Ok(Arc::new(s_inode))
    }

    fn find(&self, this: Arc<dyn Inode>, name: &str) -> SysResult<Arc<dyn Inode>> {
        if self.meta.mode != InodeMode::FileDIR {
            return Err(());
        }
        let mut content = self.file.lock();
        let fat = self.fat.clone();
        let mut dentry_content = FAT32DentryContent::new(&mut content);
        while let Some(dentry) = FAT32DirEntry::read_dentry(&mut dentry_content) {
            let fname = dentry.fname();
            if fname == name {
                return Ok(Arc::new(FAT32Inode::from_dentry(fat, Some(this), &dentry)));
            }
        }
        Err(())
    }

    fn list(&self, this: Arc<dyn Inode>) -> SysResult<Vec<Arc<dyn Inode>>> {
        if self.meta.mode != InodeMode::FileDIR {
            return Err(());
        }
        let mut content = self.file.lock();
        let fat = self.fat.clone();
        let mut dentry_content = FAT32DentryContent::new(&mut content);
        let mut children: Vec<Arc<dyn Inode>> = Vec::new();
        while let Some(dentry) = FAT32DirEntry::read_dentry(&mut dentry_content) {
            let inode = FAT32Inode::from_dentry(fat.clone(), Some(this.clone()), &dentry);
            children.push(Arc::new(inode));
        }
        Ok(children)
    }

    fn get_meta(&self) -> Arc<InodeMeta> {
        Arc::clone(&self.meta)
    }

    /// as we call this method on `dyn Inode`, we need to use `Arc<dyn Inode>` as children's father inode
    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        assert_eq!(self.meta.mode, InodeMode::FileDIR);
        let meta = self.meta.clone();
        let mut meta_inner = meta.inner.lock();
        let mut content = self.file.lock();
        let fat = Arc::clone(&content.fat);
        let mut dentry_content = FAT32DentryContent::new(&mut content);
        while let Some(dentry) = FAT32DirEntry::read_dentry(&mut dentry_content) {
            let fname = dentry.fname();
            if fname == "." || fname == ".." {
                continue;
            }
            let inode = FAT32Inode::from_dentry(Arc::clone(&fat), Some(Arc::clone(&this)), &dentry);
            let inode_rc: Arc<dyn Inode> = Arc::new(inode);
            // inode_rc.create_page_cache_if_needed();
            meta_inner
                .children
                .insert(dentry.fname(), Arc::clone(&inode_rc));
        }
    }

    fn clear(&self) {
        self.file.lock().clear();
    }
}
