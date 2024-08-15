//! 这里基本是关于和切换任务
//! [`TaskManager`] （单例）控制着所有的系统task （目前还没有对应的线程进程抽象）
//! [`U7Hart`] （单例）监听着核上面运行的任务。
//! [`PidAllocator`]（单例）分配所有的 pid
//! 用了异步无栈协程进行对应的相关调度

pub mod aux;
mod pid;
pub(crate) mod processor;
pub mod schedule;
#[allow(clippy::module_inception)]
#[allow(rustdoc::private_intra_doc_links)]
pub mod task;

use crate::loader::get_app_data_by_name;
use crate::sbi::shutdown;
use crate::task::processor::current_process;
use crate::task::task::{new_initproc, Process, PROCESS_MANAGER};
use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec::Vec;
use core::sync::atomic::Ordering::Relaxed;
use lazy_static::*;
use processor::current_thread;
// use log::info;
// use task::{TaskControlBlock, TaskStatus};

use log::info;
pub use pid::{pid_alloc, PidAllocator, PidHandle};
pub use processor::{current_trap_cx, current_user_token, take_current_thread};
pub use schedule::yield_task;
use task::Thread;

/// pid of usertests app in make run TEST=1
pub const IDLE_PID: usize = 0;

/// 退出当前的线程，如果这是最后一个线程，主线程会进行对应的回收
pub fn exit_current(exit_code: i32) {
    let process = current_process();
    info!(
        "[exit_current] exit task's pagetable: {:?}",
        process.inner_lock().memory_set.page_table.root_ppn
    );

    let pid = process.getpid();
    info!("[exit_current] pid = {}, exit_code = {}", pid, exit_code);

    if pid == IDLE_PID {
        println!(
            "[kernel] Idle process exit with exit_code {} ...",
            exit_code
        );
        if exit_code != 0 {
            shutdown(true) //crate::sbi::shutdown(255); //255 == -1 for err hint
        } else {
            shutdown(false) //crate::sbi::shutdown(0); //0 for success hint
        }
    }

    let current_thread = current_thread().unwrap();
    current_thread.is_terminated.store(true, Relaxed);

    let mut process_inner = process.inner_lock();
    process_inner.exit_code = exit_code; // Record exit code
    process_inner.threads.remove(&current_thread.getpid());

    PROCESS_MANAGER.lock().remove(&current_thread.getpid());

    if process_inner.threads.len() <= 0 {
        process.is_zombie.store(true, Relaxed);
        {
            let mut initproc_inner = INITPROC.inner_lock();
            for child in process_inner.children.iter() {
                child.inner_lock().parent = Some(Arc::downgrade(&INITPROC));
                initproc_inner.children.push(child.clone());
            }
        }

        process_inner.children.clear();
        // deallocate user space
        process_inner.memory_set.recycle_data_pages();
        process_inner.fd_table.table.clear();
    }
}

#[cfg(feature = "submit")]
lazy_static! {
    pub static ref INIT_THREAD: Arc<Thread> =
        new_initproc(get_app_data_by_name("submit_script").unwrap());
    pub static ref INITPROC: Arc<Process> = INIT_THREAD.process.clone();
}

#[cfg(not(feature = "submit"))]
lazy_static! {
    ///Globle process that init user shell
    pub static ref INIT_THREAD: Arc<Thread> = new_initproc(get_app_data_by_name("initproc").unwrap());
    pub static ref INITPROC: Arc<Process> = INIT_THREAD.process.clone();
}
///Add init process to the manager
pub fn add_initproc() {
    schedule::spawn_thread(INIT_THREAD.clone());
}

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
