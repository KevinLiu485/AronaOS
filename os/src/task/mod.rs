//! 这里基本是关于和切换任务
//! [`TaskManager`] （单例）控制着所有的系统task （目前还没有对应的线程进程抽象）
//! [`U7Hart`] （单例）监听着核上面运行的任务。
//! [`PidAllocator`]（单例）分配所有的 pid
//! 用了异步无栈协程进行对应的相关调度

mod pid;
pub(crate) mod processor;
pub mod schedule;
#[allow(clippy::module_inception)]
#[allow(rustdoc::private_intra_doc_links)]
mod task;

use crate::loader::get_app_data_by_name;
use crate::sbi::shutdown;
use alloc::sync::Arc;
use alloc::vec::Vec;
use lazy_static::*;
use log::info;
use task::{TaskControlBlock, TaskStatus};

pub use pid::{pid_alloc, PidAllocator, PidHandle};
pub use processor::{current_task, current_trap_cx, current_user_token, take_current_task};
pub use schedule::yield_task;

/// pid of usertests app in make run TEST=1
pub const IDLE_PID: usize = 0;

/// Simply set exit_code and change status to Zombie.
/// More exiting works will de done by its parent.
pub fn exit_current(exit_code: i32) {
    let task = current_task().unwrap();

    info!(
        "exit task's pagetable: {:?}",
        task.inner_lock().memory_set.page_table.root_ppn
    );

    let pid = task.getpid();
    if pid == IDLE_PID {
        println!(
            "[kernel] Idle process exit with exit_code {} ...",
            exit_code
        );
        if exit_code != 0 {
            //crate::sbi::shutdown(255); //255 == -1 for err hint
            shutdown(true)
        } else {
            //crate::sbi::shutdown(0); //0 for success hint
            shutdown(false)
        }
    }

    // **** access current TCB exclusively
    let mut inner = task.inner_lock();
    // Change status to Zombie
    inner.task_status = TaskStatus::Zombie;

    task.is_zombie.store(true, Relaxed);
    // Record exit code
    inner.exit_code = exit_code;
    // do not move to its parent but under initproc

    // ++++++ access initproc TCB exclusively
    {
        let mut initproc_inner = INITPROC.inner_lock();
        for child in inner.children.iter() {
            child.inner_lock().parent = Some(Arc::downgrade(&INITPROC));
            initproc_inner.children.push(child.clone());
        }
    }
    // ++++++ release parent PCB

    inner.children.clear();
    // deallocate user space
    inner.memory_set.recycle_data_pages();
    // **** release current PCB
}

#[cfg(feature = "submit")]
lazy_static! {
    pub static ref INITPROC: Arc<TaskControlBlock> = Arc::new(TaskControlBlock::new(
        get_app_data_by_name("submit_script").unwrap()
    ));
}

#[cfg(not(feature = "submit"))]
lazy_static! {
    ///Globle process that init user shell
    pub static ref INITPROC: Arc<TaskControlBlock> = Arc::new(TaskControlBlock::new(
        get_app_data_by_name("initproc").unwrap()
    ));
}
///Add init process to the manager
pub fn add_initproc() {
    schedule::spawn_thread(INITPROC.clone());
}

use alloc::string::String;
use core::sync::atomic::Ordering::Relaxed;

/// debug
#[allow(unused)]
pub fn elf_data_info(v: &Vec<u8>) {
    let mut elf_data = String::new();
    let len = v.len();
    println!("elf: ");
    println!("{}", elf_data);
    let mut i = 0;
    while i < len {
        match core::str::from_utf8(&v[i..]) {
            Ok(valid) => {
                elf_data.push_str(valid);
                break;
            }
            Err(error) => {
                let valid_up_to = error.valid_up_to();
                let valid = core::str::from_utf8(&v[i..(i + valid_up_to)]).unwrap_or("\u{FFFD}"); // 使用unwrap_or来处理不正确的UTF-8序列
                elf_data.push_str(valid);
                if let Some(error_len) = error.error_len() {
                    i += valid_up_to + error_len; // 跳过无效的字节
                } else {
                    // 如果 error_len 是 None，则意味着错误在字节序列的末尾
                    break;
                }
            }
        }
    }
}
