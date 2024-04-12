//!Implementation of [`Processor`] and Intersection of control flow
// use super::__switch;
// use super::{fetch_task, TaskStatus};
use super::{TaskContext, TaskControlBlock};
use crate::sync::UPSafeCell;
use crate::trap::TrapContext;
use alloc::sync::Arc;
use lazy_static::*;
///Processor management structure
pub struct Processor {
    ///The task currently executing on the current processor
    current: Option<Arc<TaskControlBlock>>,
    // /The basic control flow of each core, helping to select and switch process
    // idle_task_cx: TaskContext,
}

impl Processor {
    ///Create an empty Processor
    pub fn new() -> Self {
        Self {
            current: None,
            // current: Some(Arc::new(TaskControlBlock::new_bare())),
            // idle_task_cx: TaskContext::zero_init(),
        }
    }
    ///Get mutable reference to `idle_task_cx`
    // fn get_idle_task_cx_ptr(&mut self) -> *mut TaskContext {
    //     &mut self.idle_task_cx as *mut _
    // }
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
    // pub fn pop_task(&mut self, task: &mut Arc<TaskControlBlock>) {
    //     core::mem::swap(self.current.as_mut().unwrap(), task);
    // }
}

lazy_static! {
    pub static ref PROCESSOR: UPSafeCell<Processor> = unsafe { UPSafeCell::new(Processor::new()) };
}

///The main part of process execution and scheduling
///Loop `fetch_task` to get the process that needs to run, and switch the process through `__switch`
// pub fn run_tasks() {
//     loop {
//         let mut processor = PROCESSOR.exclusive_access();
//         if let Some(task) = fetch_task() {
//             let idle_task_cx_ptr = processor.get_idle_task_cx_ptr();
//             // access coming task TCB exclusively
//             let mut task_inner = task.inner_exclusive_access();
//             let next_task_cx_ptr = &task_inner.task_cx as *const TaskContext;
//             task_inner.task_status = TaskStatus::Running;
//             drop(task_inner);
//             // release coming task TCB manually
//             processor.current = Some(task);
//             // release processor manually
//             drop(processor);
//             unsafe {
//                 __switch(idle_task_cx_ptr, next_task_cx_ptr);
//             }
//         }
//     }
// }

/// Switch task context, including pagetable
pub fn switch_task(task: &mut Option<Arc<TaskControlBlock>>) {
    // let mut processor = PROCESSOR.exclusive_access();
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

// pub fn schedule(switched_task_cx_ptr: *mut TaskContext) {
//     let mut processor = PROCESSOR.exclusive_access();
//     let idle_task_cx_ptr = processor.get_idle_task_cx_ptr();
//     drop(processor);
//     unsafe {
//         __switch(switched_task_cx_ptr, idle_task_cx_ptr);
//     }
// }

// pub fn push_kernel_task(/* task: &mut Arc<TaskControlBlock> */) {
//     todo!("Processer: push_kernel_task");
// }

// pub fn pop_kernel_task(/* task: &mut Arc<TaskControlBlock> */) {
//     todo!("Processer: pop_kernel_task");
// }
