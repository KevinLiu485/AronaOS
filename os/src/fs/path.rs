use core::fmt::Display;

use crate::fs::inode::Inode;
use crate::fs::AT_FDCWD;
use crate::task::processor::current_process;
use crate::utils::SyscallErr;
use alloc::fmt::format;
use alloc::sync::Arc;
use alloc::{
    format,
    string::{String, ToString},
    vec::Vec,
};
use log::{debug, trace};

#[derive(Debug, Clone)]
pub struct Path {
    inner: Vec<String>,
    is_relative: bool,
}

impl From<&str> for Path {
    fn from(v: &str) -> Self {
        let is_relative = !v.starts_with("/");
        Self {
            inner: v
                .split("/")
                .filter(|s| s.len() > 0)
                .map(|s| s.to_string())
                .collect(),
            is_relative,
        }
    }
}

impl From<String> for Path {
    fn from(v: String) -> Self {
        Self::from(v.as_str())
    }
}

// you can call to_string() or println!("{}", path) to get path concated by "/"
impl Display for Path {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        if self.is_relative {
            write!(f, "{}", &self.inner.join("/"))
        } else {
            write!(f, "{}", "/".to_string() + &self.inner.join("/"))
        }
    }
}

impl Path {
    fn push(&mut self, s: &str) {
        self.inner.push(s.to_string());
    }

    #[allow(unused)]
    fn pop(&mut self) -> Option<String> {
        self.inner.pop() /* .unwrap_or(String::new()) */
    }

    pub fn root() -> Self {
        Self {
            inner: Vec::new(),
            is_relative: false,
        }
    }

    pub fn get_name(&self) -> String {
        self.inner.last().unwrap_or(&String::new()).to_string()
    }

    pub fn len(&self) -> usize {
        self.inner.len()
    }

    pub fn is_relative(&self) -> bool {
        self.is_relative
    }

    /// i.e. the path can be a global name, used to exec kernel linked apps
    pub fn is_global(&self) -> bool {
        self.is_relative && self.len() == 1
    }

    pub fn get_inner(&self) -> &Vec<String> {
        &self.inner
    }

    pub fn clone_and_append(&self, s: &str) -> Self {
        let mut ret = self.clone();
        ret.push(s);
        ret
    }
}
pub type GeneralRet<T> = Result<T, SyscallErr>;
// pub fn path_to_inode(
//     dirfd: isize,
//     path: Option<&str>,
// ) -> GeneralRet<(Option<Arc<dyn Inode>>, String, Option<Arc<dyn Inode>>)> {
//     match path {
//         None => {
//             match dirfd {
//                 AT_FDCWD => {
//                     debug!("[path_to_inode] path is null and dirfd is AT_FDCWD");
//                     return current_process().inner_handler(|proc| {
//                         // If it have file, it must have inode
//                         let (target, parent) = <dyn Inode>::lookup_from_root(&proc.cwd)?;
//                         Ok((target, proc.cwd.clone(), parent))
//                     });
//                 }
//                 _ => {
//                     debug!("[path_to_inode] path is null and dirfd is not AT_FDCWD");
//                     return current_process().inner_handler(|proc| {
//                         let wd_file = proc.fd_table.get_ref(dirfd as usize);
//                         match wd_file {
//                             Some(wd_file) => {
//                                 let inode = wd_file.file.metadata().inner.lock().inode.clone();
//                                 match inode {
//                                     None => Err(SyscallErr::EBADF),
//                                     Some(inode) => Ok((
//                                         Some(inode.clone()),
//                                         inode.metadata().path.clone(),
//                                         None,
//                                     )),
//                                 }
//                             }
//                             None => {
//                                 log::info!("[path_to_inode] no file for fd {}", dirfd);
//                                 Err(SyscallErr::EBADF)
//                             }
//                         }
//                     });
//                 }
//             }
//         }
//
//         Some(path) => {
//             debug!("[path_to_inode] path is not null");
//             debug!("[path_to_inode] get path: {}", path);
//             let mut path = format(&path);
//             debug!("[path_to_inode] get format path: {}", path);
//             if path.eq("/sys/kernel/debug/kcov") {
//                 log::info!("[path_to_inode] match /sys/kernel/debug/kcov change to /sys/kcov");
//                 // let path = "/sys/kcov".to_string();
//                 return Ok((
//                     Some(K_COV_INODE.get_unchecked_mut().as_ref().unwrap().clone()),
//                     path,
//                     None,
//                 ));
//             };
//             debug!("[path_to_inode] path is: {}", path);
//             if is_relative_path(&path) {
//                 if dirfd != AT_FDCWD {
//                     debug!("[path_to_inode] path is releative and dirfd isn't AT_FDCWD");
//                     return current_process().inner_handler(|proc| {
//                         let wd_file = proc.fd_table.get_ref(dirfd as usize);
//                         match wd_file {
//                             Some(wd_file) => {
//                                 let inode = wd_file.file.metadata().inner.lock().inode.clone();
//                                 if inode.is_none() {
//                                     return Err(SyscallErr::ENOENT);
//                                 }
//                                 let inode = inode.unwrap();
//                                 if check_double_dot(&path) {
//                                     // path has ..
//                                     // parent is not sure, return None
//                                     let path = change_relative_to_absolute(&path, &proc.cwd);
//                                     let (target, parent) = <dyn Inode>::lookup_from_root(&path)?;
//                                     Ok((target, path, parent))
//                                 } else {
//                                     // the path doesn't have ..
//                                     // inode is the parent which should be returned
//                                     let path = remove_dot(&path);
//                                     let absolute_path =
//                                         change_relative_to_absolute(&path, &proc.cwd);
//                                     let target = inode.lookup_from_current(&path)?;
//                                     Ok((target, absolute_path, Some(inode)))
//                                 }
//                             }
//                             None => Err(SyscallErr::EBADF),
//                         }
//                     });
//                 } else {
//                     debug!("[path_to_inode] path is releative and dirfd is AT_FDCWD");
//                     return current_process().inner_handler(|proc| {
//                         let path = change_relative_to_absolute(&path, &proc.cwd);
//                         let (target, parent) = <dyn Inode>::lookup_from_root(&path)?;
//                         Ok((target, path, parent))
//                     });
//                 }
//             } else {
//                 debug!("[path_to_inode] path is absolute");
//                 if path.eq("/dev/shm/testshm") {
//                     debug!("[path_to_inode] just for libc-test");
//                     path = "/testshm".to_string();
//                 }
//                 let (target, parent) = <dyn Inode>::lookup_from_root(&path)?;
//                 Ok((target, path, parent))
//             }
//         }
//     }
// }

pub fn remove_dot(path: &str) -> String {
    let path_vec: Vec<&str> = path
        .split('/')
        .filter(|name| *name != "" && *name != ".")
        .collect();
    path_vec.join("/")
}

pub fn check_double_dot(path: &str) -> bool {
    let path_vec = split_path(path);
    for name in path_vec {
        if name.eq("..") {
            return true;
        }
    }
    return false;
}

pub fn change_relative_to_absolute(relative_path: &str, cwd: &str) -> String {
    let absolute_path_vec = split_path(cwd);
    let relative_path_vec = split_path(relative_path);
    debug!("absolute path: {:?}", absolute_path_vec);
    debug!("relative path: {:?}", relative_path_vec);
    let mut res: Vec<&str> = Vec::new();
    res.push("");
    for i in 0..absolute_path_vec.len() {
        res.push(absolute_path_vec[i]);
    }
    for i in 0..relative_path_vec.len() {
        match relative_path_vec[i] {
            ".." => {
                if let Some(check) = res.pop() {
                    if check == "" {
                        return "/".to_string();
                    }
                }
            }
            "." => {}
            _ => {
                res.push(relative_path_vec[i]);
            }
        }
    }
    res.join("/")
}
pub fn is_relative_path(path: &str) -> bool {
    if path.starts_with("/") {
        return false;
    } else {
        return true;
    }
}

pub fn split_path(path_name: &str) -> Vec<&str> {
    path_name.split('/').filter(|name| *name != "").collect()
}
pub fn get_parent_dir(path_name: &str) -> Option<String> {
    let dentry_vec: Vec<&str> = split_path(path_name);
    debug!("[get_parent_dir] dentry vec {:?}", dentry_vec);
    if dentry_vec.is_empty() {
        return None;
    }
    let mut res = "".to_string();
    for i in 0..dentry_vec.len() - 1 {
        res += "/";
        res += dentry_vec[i];
    }
    if res == "" {
        res += "/";
    }
    Some(res)
}
pub fn get_name(path_name: &str) -> &str {
    let dentry_vec = split_path(path_name);
    let len = dentry_vec.len();
    trace!("[get_name] dentry_vec: {:?}, len: {}", dentry_vec, len);
    if len == 0 {
        ""
    } else {
        dentry_vec[dentry_vec.len() - 1]
    }
}
