use alloc::{sync::Arc, vec::Vec};

use crate::{SysResult, SyscallRet};

use super::{File, OpenFlags};

#[derive(Clone)]
pub struct FdInfo {
    pub file: Arc<dyn File + Send + Sync>,
    pub flags: OpenFlags,
}

impl FdInfo {
    pub fn without_flags(file: Arc<dyn File + Send + Sync>) -> Self {
        Self {
            file,
            flags: OpenFlags::empty(),
        }
    }
}

pub struct FdTable {
    pub table: Vec<Option<FdInfo>>,
}

impl FdTable {
    /// alloc lowest-numbered available fd greater than or equal to least_fd
    fn allocate(&mut self, least_fd: usize) -> usize {
        if least_fd < self.table.len() {
            if let Some(fd) = (0..self.table.len()).find(|fd| self.table[*fd].is_none()) {
                fd
            } else {
                self.table.push(None);
                self.table.len() - 1
            }
        } else {
            self.reserve(least_fd);
            self.table[least_fd] = None;
            least_fd
        }
    }

    /// resize fdtable to reserve fd
    fn reserve(&mut self, fd: usize) {
        // len is at least (fd + 1)
        if fd + 1 > self.table.len() {
            self.table.resize(fd + 1, None);
        }
    }

    /// set none-empty fdinfo by fd, resize table if fd out of range
    /// force overwrite existing fd
    fn set(&mut self, fd: usize, fdinfo: FdInfo) {
        self.reserve(fd);
        self.table[fd] = Some(fdinfo);
    }
}

impl FdTable {
    pub fn new_bare() -> Self {
        Self { table: Vec::new() }
    }

    pub fn new(table: Vec<Option<FdInfo>>) -> Self {
        Self { table }
    }

    /// clone fdtable and set all fdinfo with `CLOEXEC` flag to `None`  
    /// used in `sys_exec()`
    pub fn exec_clone(&self) -> Self {
        Self {
            table: self
                .table
                .iter()
                .map(|fd| {
                    if fd.is_some() && fd.as_ref().unwrap().flags.contains(OpenFlags::CLOEXEC) {
                        None
                    } else {
                        fd.clone()
                    }
                })
                .collect(),
        }
    }

    /// get cloned fdinfo by fd, return `None` if fd out of range  
    pub fn get(&self, fd: usize) -> Option<FdInfo> {
        // self.table.get(fd)
        // self.table.get(fd).and_then(|fd_info| fd_info)
        if fd < self.table.len() {
            // self.table[fd]
            self.table[fd].clone()
        } else {
            None
        }
    }

    /// close fd, return `Ok(0)` on success, return `Err(1)` if `fd` does not exist
    pub fn close(&mut self, fd: usize) -> SyscallRet {
        if let Some(_fdinfo) = self.get(fd) {
            self.table[fd] = None;
            Ok(0)
        } else {
            Err(1)
        }
    }

    /// allocate with `least_fd` and set none-empty `fdinfo`
    pub fn alloc_and_set(&mut self, least_fd: usize, fdinfo: FdInfo) -> usize {
        let fd = self.allocate(least_fd);
        self.set(fd, fdinfo);
        fd
    }

    /// alloc a new fd with `least_fd` and dup `oldfd`
    /// return `Ok(newfd)` on success, return Err if `oldfd` does not exist
    pub fn alloc_and_dup(&mut self, oldfd: usize, least_fd: usize) -> SysResult<usize> {
        if let Some(fdinfo) = self.get(oldfd) {
            let newfd = self.allocate(least_fd);
            self.set(newfd, fdinfo.clone());
            Ok(newfd)
        } else {
            Err(1)
        }
    }

    /// dup `oldfd` to `newfd`
    /// return `Ok(newfd)` on success, return Err if `oldfd` does not exist
    pub fn dup_to(&mut self, oldfd: usize, newfd: usize) -> SysResult<usize> {
        if let Some(fdinfo) = self.get(oldfd) {
            self.set(newfd, fdinfo.clone());
            Ok(newfd)
        } else {
            Err(1)
        }
    }
}
