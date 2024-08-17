use core::borrow::BorrowMut;

use crate::{
    fs::{
        inode::{Inode, InodeMeta, InodeMode},
        path::Path,
    },
    utils::SyscallErr,
    AsyncResult, SysResult,
};
use alloc::{
    boxed::Box,
    format,
    string::{String, ToString},
    sync::Arc,
};
use ext4_rs::{Ext4, Ext4File, Ext4InodeRef, Ext4MountPoint, OpenFlag};
use log::{debug, error, warn};

pub struct Ext4Inode {
    fs: Arc<Ext4>,
    meta: Arc<InodeMeta>,
}

impl Ext4Inode {
    pub fn new(fs: Arc<Ext4>, meta: Arc<InodeMeta>) -> Self {
        Self { fs, meta }
    }

    /// update the `data_size` of the inode from disk
    fn update_size(&self) {
        let size = self.get_size();
        self.meta.inner.lock().data_size = size;
    }

    fn get_size(&self) -> usize {
        Ext4Inode::get_size_from_ino(&self.fs, self.meta.ino as u64)
    }

    fn get_size_from_ino(fs: &Arc<Ext4>, ino: u64) -> usize {
        let inode_ref = Ext4InodeRef::get_inode_ref(Arc::downgrade(fs), ino as u32);
        inode_ref.inner.inode.inode_get_size() as usize
    }

    fn create_ext4_file(&self, offset: usize) -> Ext4File {
        Ext4File {
            mp: Ext4MountPoint::new("/"),
            inode: self.meta.ino as u32,
            flags: OpenFlag::O_RDWR.bits(),
            fsize: self.meta.inner.lock().data_size as u64,
            fpos: offset,
        }
    }

    fn follow_symlink(&self, ino: u64) -> Path {
        let ext4_file = Ext4File {
            mp: Ext4MountPoint::new("/"),
            inode: ino as u32,
            flags: OpenFlag::O_RDWR.bits(),
            fsize: 0,
            fpos: 0,
        };
        let path_str = self.fs.ext4_follow_symlink(&ext4_file);
        path_str.into()
    }
}

impl Inode for Ext4Inode {
    fn read<'a>(&'a self, offset: usize, buf: &'a mut [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            let mut read_cnt = 0usize;
            let _ = self
                .fs
                .ext4_file_read(
                    &mut self.create_ext4_file(offset),
                    buf,
                    buf.len(),
                    &mut read_cnt,
                )
                .map_err(|ext4_err| {
                    error!("[Ext4Inode::read] {:?}", ext4_err);
                    ext4_err.error() as usize
                })?;
            Ok(read_cnt)
        })
    }

    fn write<'a>(&'a self, offset: usize, buf: &'a [u8]) -> AsyncResult<usize> {
        Box::pin(async move {
            let _ = self
                .fs
                .ext4_file_write(&mut self.create_ext4_file(offset), buf, buf.len());
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
        if self.meta.mode != InodeMode::FileDIR {
            return Err(1);
        }
        let new_path = self.get_meta().path.to_string() + "/" + name;
        let new_ino = if mode == InodeMode::FileDIR {
            let mut file_out = Ext4File::new();
            let _ = self.fs.ext4_open(&mut file_out, &new_path, "a+", false);
            file_out.inode
        } else if mode == InodeMode::FileREG {
            let mut file_out = Ext4File::new();
            let _ = self.fs.ext4_open(&mut file_out, &new_path, "a+", true);
            file_out.inode
        } else {
            return Err(1);
        };
        let name = self.meta.path.append_name(name);
        let meta = Arc::new(InodeMeta::new(
            Some(this.clone()),
            name,
            mode,
            0,
            new_ino as usize,
        ));
        Ok(Arc::new(Ext4Inode {
            fs: self.fs.clone(),
            meta,
        }))
    }

    fn get_meta(&self) -> Arc<InodeMeta> {
        self.meta.clone()
    }

    fn load_children_from_disk(&self, this: Arc<dyn Inode>) {
        // log::debug!(
        //     "[Ext4Inode::load_children_from_disk] dir path: \"{}\"",
        //     self.meta.path
        // );
        assert_eq!(self.meta.mode, InodeMode::FileDIR);
        let mut meta_inner = self.meta.inner.lock();
        let dir_entries = self.fs.read_dir_entry(self.meta.ino as u64);

        dir_entries.iter().for_each(|entry| {
            let ino = entry.inode as usize;
            let name = entry.get_name();
            if name == "." || name == ".." {
                return;
            }
            let path = self.meta.path.append_name(&name);
            let mode = dirent_inodetype_2_inodemode(unsafe { entry.inner.inode_type });
            let data_size = Self::get_size_from_ino(&self.fs, ino as u64);

            // handle symlink
            let link_target = if mode == InodeMode::FileLNK {
                // log::debug!(
                //     "[Ext4Inode::load_children_from_disk] load symlink: {}",
                //     path
                // );
                Some(self.follow_symlink(ino as u64))
            } else {
                None
            };

            let inode_meta =
                InodeMeta::new_symlink(Some(this.clone()), path, mode, link_target, data_size, ino);
            let inode = Arc::new(Ext4Inode {
                fs: self.fs.clone(),
                meta: Arc::new(inode_meta),
            });
            // debug!("[Ext4Inode::load_children_from_disk] insert: {}", name);
            meta_inner.children.insert(name, inode);
        });
    }

    fn clear(&self) {}
}

fn dirent_inodetype_2_inodemode(inode_type: u8) -> InodeMode {
    match inode_type {
        1 => InodeMode::FileREG,
        2 => InodeMode::FileDIR,
        3 => InodeMode::FileCHR,
        4 => InodeMode::FileBLK,
        5 => InodeMode::FileFIFO,
        6 => InodeMode::FileSOCK,
        7 => InodeMode::FileLNK,
        _ => panic!("[dirent_inodetype_2_inodemode] inode type should not be unknown"),
    }
}
