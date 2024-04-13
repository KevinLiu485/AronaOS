//!Implementation of [`Processor`] and Intersection of control flow
use super::TaskControlBlock;
use crate::sync::UPSafeCell;
use crate::trap::TrapContext;
use alloc::sync::Arc;
use lazy_static::*;
///Processor management structure
pub struct Processor {
    ///The task currently executing on the current processor
    current: Option<Arc<TaskControlBlock>>,
}

impl Processor {
    ///Create an empty Processor
    pub fn new() -> Self {
        Self { current: None }
    }
    ///Get current task in moving semanteme
    pub fn take_current(&mut self) -> Option<Arc<TaskControlBlock>> {
        self.current.take()
    }
    ///Get current task in cloning semanteme
    pub fn current(&self) -> Option<Arc<TaskControlBlock>> {
        self.current.as_ref().map(Arc::clone)
    }
    /// Switch task context, including pagetable
    pub fn switch_task(&mut self, task: &mut Option<Arc<TaskControlBlock>>) {
        // pagetable is set accroding to `TaskControlBlock`, only need to switch `TaskControlBlock`
        // switch `TaskControlBlock`
        core::mem::swap(&mut self.current, task);
    }
}

lazy_static! {
    pub static ref PROCESSOR: UPSafeCell<Processor> = unsafe { UPSafeCell::new(Processor::new()) };
}

/// Switch task context, including pagetable
pub fn switch_task(task: &mut Option<Arc<TaskControlBlock>>) {
    PROCESSOR.exclusive_access().switch_task(task);
}
///Take the current task,leaving a None in its place
pub fn take_current_task() -> Option<Arc<TaskControlBlock>> {
    PROCESSOR.exclusive_access().take_current()
}
///Get running task
pub fn current_task() -> Option<Arc<TaskControlBlock>> {
    PROCESSOR.exclusive_access().current()
}
///Get token of the address space of current task
pub fn current_user_token() -> usize {
    let task = current_task().unwrap();
    let token = task.inner_exclusive_access().get_user_token();
    token
}
///Get the mutable reference to trap context of current task
pub fn current_trap_cx() -> &'static mut TrapContext {
    current_task()
        .unwrap()
        .inner_exclusive_access()
        .get_trap_cx()
}
