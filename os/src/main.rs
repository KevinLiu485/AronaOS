//! main函数，以及程序的进入点，先跑entry.S之后就是rust_main.rs todo:（之前可能有opensbi相关的东西？）
//! 之后调用 [`task::run_tasks()`] 这也是第一次进入userspace
//! 各类功能在以下的子模块被实现
//! - [`trap`] :解决用户空间和内核空间的切换
//! - [`task`] :管理任务
//! - [`syscall`]: System call 的处理和实现
//! - [`mm`]: SV39 的 vm 管理
//! - [`sync`]: 包装所有的static data structure，这样我们就不需要用unsafe访问他们
//! - [`fs`]: Separate user from file system with some structures

#![deny(missing_docs)]
#![deny(warnings)]
#![allow(unused_imports)]
#![no_std]
#![no_main]
#![feature(panic_info_message)]
#![feature(alloc_error_handler)]

extern crate alloc;

#[macro_use]
extern crate bitflags;

#[path = "boards/qemu.rs"]
mod board;

#[macro_use]
mod console;
mod config;
mod drivers;
pub mod fs;
pub mod lang_items;
pub mod mm;
pub mod sbi;
pub mod sync;
pub mod syscall;
pub mod task;
pub mod timer;
pub mod trap;

use core::arch::{asm, global_asm};
use core::sync::atomic::{AtomicBool, Ordering};
use riscv::interrupt::Mutex;
use riscv::register::satp;
use crate::mm::KERNEL_SPACE;
use crate::task::processor::new_local_hart;


// todo: 为什么跑os前要clear_bss
global_asm!(include_str!("entry.asm"));
/// clear BSS segment
fn clear_bss() {
    extern "C" {
        fn sbss();
        fn ebss();
    }
    unsafe {
        core::slice::from_raw_parts_mut(sbss as usize as *mut u8, ebss as usize - sbss as usize)
            .fill(0);
    }
}

static FIRST_HART: AtomicBool = AtomicBool::new(true);
static INIT_FINISHED: AtomicBool = AtomicBool::new(false);

#[no_mangle]
/// the rust entry-point of os
pub fn rust_main(hart_id: usize) -> ! {
    if FIRST_HART
        .compare_exchange(true, false, Ordering::SeqCst, Ordering::SeqCst)
        .is_ok()
    {
        clear_bss();
        mm::init();
        mm::remap_test();

        trap::init();

        trap::enable_timer_interrupt();
        timer::set_next_trigger();

        fs::list_apps();
        task::add_initproc();

        INIT_FINISHED.store(true, Ordering::SeqCst);
        for i in 0..4 {
            if i == hart_id {
                continue;
            }
            let status = sbi_call((0x48534d, 0), i, 0x80200000, 0);
            println!("[kernel] {} start to wake up hart {}... status {}", hart_id, i, status);
        }
        println!("[kernel] cpu:{} Hello, world!", hart_id);
    } else {
        //todo: 先loop着，后续再加支持, 以及sbi相关的东西可能需要相关的引入。
        while !INIT_FINISHED.load(Ordering::SeqCst) {} // todo:实际上这里似乎并不需要这条语句吧。不过还是先留着。
        trap::init();
        KERNEL_SPACE.exclusive_access().activate();
        println!("cpu: {} start!", hart_id);
    }

    new_local_hart(hart_id);

    if hart_id == 0 {
        task::run_tasks();
    } else {
        loop {}
    }
    panic!("run task should not reach!")
}

#[inline(always)]
fn sbi_call(eid_fid: (usize, usize), arg0: usize, arg1: usize, arg2: usize) -> usize {
    let mut ret;
    unsafe {
        asm!(
        // "li x16, 0",
        "ecall",
        inlateout("x10") arg0 => ret,
        in("x11") arg1,
        in("x12") arg2,
        in("x16") eid_fid.1,
        in("x17") eid_fid.0,
        );
    }
    ret
}