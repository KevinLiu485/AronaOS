//! Task management implementation
//!
//! Everything about task management, like starting and switching tasks is
//! implemented here.
//!
//! A single global instance of [`TaskManager`] called `TASK_MANAGER` controls
//! all the tasks in the whole operating system.
//!
//! A single global instance of [`Processor`] called `PROCESSOR` monitors running
//! task(s) for each core.
//!
//! A single global instance of [`PidAllocator`] called `PID_ALLOCATOR` allocates
//! pid for user apps.
//!
//! Be careful when you see `__switch` ASM function in `switch.S`. Control flow around this function
//! might not be what you expect.
mod pid;
mod processor;
pub mod schedule;
#[allow(clippy::module_inception)]
#[allow(rustdoc::private_intra_doc_links)]
mod task;

use crate::executor::init;
use crate::fs::{open_file, OpenFlags};
use crate::mm::{current_satp, VirtAddr};
use crate::sbi::shutdown;
use alloc::string;
use alloc::sync::Arc;
use alloc::vec::Vec;
use lazy_static::*;
use task::{TaskControlBlock, TaskStatus};

pub use pid::{pid_alloc, PidAllocator, PidHandle};
pub use processor::{
    current_task, current_trap_cx, current_user_token, take_current_task, Processor,
};
pub use schedule::yield_task;

/// pid of usertests app in make run TEST=1
pub const IDLE_PID: usize = 0;

/// Simply set exit_code and change status to Zombie.
/// More exiting works will de done by its parent.
pub fn exit_current(exit_code: i32) {
    let task = current_task().unwrap();

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
    let mut inner = task.inner_exclusive_access();
    // Change status to Zombie
    inner.task_status = TaskStatus::Zombie;
    // Record exit code
    inner.exit_code = exit_code;
    // do not move to its parent but under initproc

    // ++++++ access initproc TCB exclusively
    {
        let mut initproc_inner = INITPROC.inner_exclusive_access();
        for child in inner.children.iter() {
            child.inner_exclusive_access().parent = Some(Arc::downgrade(&INITPROC));
            initproc_inner.children.push(child.clone());
        }
    }
    // ++++++ release parent PCB

    inner.children.clear();
    // deallocate user space
    inner.memory_set.recycle_data_pages();
    // **** release current PCB
}

lazy_static! {
    ///Globle process that init user shell
    pub static ref INITPROC: Arc<TaskControlBlock> = Arc::new({
        let inode = open_file("initproc", OpenFlags::RDONLY).unwrap();
        let v: Vec<u8> = inode.read_all();
        let init_proc = TaskControlBlock::new(v.as_slice());
        //init_proc.inner.exclusive_access().memory_set.activate();
        init_proc
    });
}
///Add init process to the manager
pub fn add_initproc() {
    schedule::spawn_thread(INITPROC.clone());
}

#[allow(unused)]
/// debug info about INITPROC TaskContorlBlock
pub fn initproc_test() {
    let init_proc = &INITPROC.inner.exclusive_access();
    let page_table = &init_proc.memory_set.page_table;
    assert_eq!(page_table.root_ppn, current_satp());
    let entry = init_proc.trap_cx.sepc;
    let va: VirtAddr = entry.into();
    let pte = page_table.find_pte(va.into()).unwrap();
    println!("{:?}", pte);
    println!("{}", pte.flags().readable_flags());
}

use alloc::string::String;

#[allow(unused)]
/// debug
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
