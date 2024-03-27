//![`U7Hart`] and Intersection of control flow
//! 用于进程调度，维护进程的处理器状态

use super::__switch;
use super::{fetch_task, TaskStatus};
use super::{TaskContext, TaskControlBlock};
use crate::sync::UPSafeCell;
use crate::trap::TrapContext;
use alloc::sync::Arc;
use core::arch::asm;
use core::mem::size_of;
use lazy_static::*;
use crate::config::PAGE_SIZE;

/// 每个CPU核心对应的抽象
pub struct U7Hart {
    hart_id: usize, // 每个CPU对应的id号

    ///The task currently executing on the current processor
    current: Option<Arc<TaskControlBlock>>,
    ///The basic control flow of each core, helping to select and switch process
    idle_task_cx: TaskContext,
}

impl U7Hart {
    ///Create an empty Processor
    pub const fn new() -> Self {
        Self {
            hart_id: 0,
            current: None,
            idle_task_cx: TaskContext::zero_init(),
        }
    }
    ///Get mutable reference to `idle_task_cx`
    fn get_idle_task_cx_ptr(&mut self) -> *mut TaskContext {
        &mut self.idle_task_cx as *mut _
    }
    ///Get current task in moving semanteme
    pub fn take_current(&mut self) -> Option<Arc<TaskControlBlock>> {
        self.current.take()
    }
    ///Get current task in cloning semanteme
    pub fn current(&self) -> Option<Arc<TaskControlBlock>> {
        self.current.as_ref().map(Arc::clone)
    }
}

// const HART_NUM: usize = 4;

/// 把对应的静态引用的id初始化，new之后 tp放的就是对应的hart_addr的地址，直接可以拿来用
pub fn new_local_hart(hart_id: usize) {
    unsafe {
        let sp: usize;
        asm!("mv {}, sp", out(reg) sp);
        let s = ((sp & !(PAGE_SIZE - 1)) - 15 * PAGE_SIZE) as *mut U7Hart; // todo :目前是硬编码
        (*s).hart_id = hart_id;
        asm!("mv tp, {}", in(reg) s as *const _ as usize);
    }
}

/// tp里面装的每个CPU对应OS结构体的地址，看[`new_local_hart`]
pub fn get_local_hart() -> &'static mut U7Hart {
    unsafe {
        let tp: usize;
        asm!("mv {}, tp", out(reg) tp);
        &mut *(tp as *mut U7Hart)
    }
}

///The main part of process execution and scheduling
///Loop `fetch_task` to get the process that needs to run, and switch the process through `__switch`
pub fn run_tasks() {
    loop {
        // 得到对应的CPU
        let processor = get_local_hart();

        if let Some(task) = fetch_task() {

            let idle_task_cx_ptr = processor.get_idle_task_cx_ptr();

            // access coming task TCB exclusively
            let mut task_inner = task.inner_exclusive_access();

            let next_task_cx_ptr = &task_inner.task_cx as *const TaskContext;
            task_inner.task_status = TaskStatus::Running;
            drop(task_inner);

            // release coming task TCB manually
            processor.current = Some(task);

            unsafe {
                __switch(idle_task_cx_ptr, next_task_cx_ptr);
            }
        }
    }
}
///Take the current task,leaving a None in its place
pub fn take_current_task() -> Option<Arc<TaskControlBlock>> {
    get_local_hart().take_current()
}
///Get running task
pub fn current_task() -> Option<Arc<TaskControlBlock>> {
    get_local_hart().current()
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
///Return to idle control flow for new scheduling
pub fn schedule(switched_task_cx_ptr: *mut TaskContext) {
    let processor = get_local_hart();
    let idle_task_cx_ptr = processor.get_idle_task_cx_ptr();
    unsafe {
        __switch(switched_task_cx_ptr, idle_task_cx_ptr);
    }
}
