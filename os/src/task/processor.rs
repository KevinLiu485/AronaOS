//!Implementation of [`Processor`] and Intersection of control flow
use super::Thread;
use crate::config::PAGE_SIZE;
use crate::task::task::Process;
use crate::trap::TrapContext;
use alloc::sync::Arc;
use core::arch::asm;

/// 每个CPU核心对应的抽象
// #[derive(Debug)]
pub struct U7Hart {
    /// 每个CPU对应的id号
    pub hart_id: usize,

    ///The task currently executing on the current processor
    current: Option<Arc<Thread>>,
}

impl U7Hart {
    ///Get current task in moving semanteme
    pub fn take_current(&mut self) -> Option<Arc<Thread>> {
        self.current.take()
    }
    ///Get current task in cloning semanteme
    pub fn current(&self) -> Option<Arc<Thread>> {
        self.current.as_ref().map(Arc::clone)
    }
    /// Switch task context, including pagetable
    pub fn switch_task(&mut self, task: &mut Option<Arc<Thread>>) {
        // debug!("switch to {:?}", task.as_ref().unwrap().pid);
        // switch address space
        task.as_ref()
            .unwrap()
            .process
            .inner_lock()
            .memory_set
            .activate();
        // switch `TaskControlBlock`
        core::mem::swap(&mut self.current, task);
    }
}

/// 把对应的静态引用的id初始化，new之后 tp放的就是对应的hart_addr的地址，直接可以拿来用
pub fn new_local_hart(hart_id: usize) {
    unsafe {
        let sp: usize;
        asm!("mv {}, sp", out(reg) sp);
        // warn: 目前是硬编码,放到内核栈底，为了防止溢出, 如果内核栈的大小不是16PAGE，会出事情！
        let s = ((sp & !(PAGE_SIZE - 1)) - 15 * PAGE_SIZE) as *mut U7Hart;
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

/// Switch task context, including pagetable
pub fn switch_thread(task: &mut Option<Arc<Thread>>) {
    get_local_hart().switch_task(task);
}
///Take the current task,leaving a None in its place
pub fn take_current_thread() -> Option<Arc<Thread>> {
    get_local_hart().take_current()
}
///Get running task
pub fn current_thread() -> Option<Arc<Thread>> {
    get_local_hart().current()
}

///Get running task
pub fn current_thread_uncheck() -> Arc<Thread> {
    get_local_hart().current().unwrap()
}

pub fn current_process() -> Arc<Process> {
    current_thread().unwrap().process.clone()
}

///Get token of the address space of current task
pub fn current_user_token() -> usize {
    let task = current_process();
    let token = task.inner_lock().get_user_token();
    token
}
///Get the mutable reference to trap context of current task
pub fn current_trap_cx() -> &'static mut TrapContext {
    current_thread().unwrap().get_inner_mut().get_trap_context()
}
