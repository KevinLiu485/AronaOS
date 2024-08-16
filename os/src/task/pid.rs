//!Implementation of [`RecycleAllocator`]
use crate::mutex::SpinNoIrqLock;
use alloc::vec::Vec;
use core::fmt::Display;
use lazy_static::*;

///Pid Allocator struct
pub struct RecycleAllocator {
    current: usize,
    recycled: Vec<usize>,
}

impl RecycleAllocator {
    ///Create an empty `RecycleAllocator`
    pub const fn new() -> Self {
        RecycleAllocator {
            current: 0,
            recycled: Vec::new(),
        }
    }
    ///Allocate a pid
    pub fn id_alloc(&mut self) -> usize {
        if let Some(pid) = self.recycled.pop() {
            pid
        } else {
            self.current += 1;
            self.current - 1
        }
    }
    ///Recycle a pid
    pub fn dealloc(&mut self, pid: usize) {
        assert!(pid < self.current);
        assert_ne!(pid, 0);
        assert!(
            !self.recycled.iter().any(|ppid| *ppid == pid),
            "pid {} has been deallocated!",
            pid
        );
        self.recycled.push(pid);
    }
}

lazy_static! {
    pub static ref PID_ALLOCATOR: SpinNoIrqLock<RecycleAllocator> =
        SpinNoIrqLock::new(RecycleAllocator::new());
}

#[derive(PartialEq, Debug)]
///Bind pid lifetime to `PidHandle`
pub struct IdHandle(pub usize);

impl Drop for IdHandle {
    fn drop(&mut self) {
        // debug!("drop pid {}", self.0);
        PID_ALLOCATOR.lock().dealloc(self.0);
    }
}

impl Display for IdHandle {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        write!(f, "{}", self.0)
    }
}

///Allocate a pid from PID_ALLOCATOR
pub fn id_alloc() -> IdHandle {
    IdHandle(PID_ALLOCATOR.lock().id_alloc())
}
