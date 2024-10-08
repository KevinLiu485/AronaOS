//! 之后调用 [`executor::run_forever()`] 这也是第一次进入userspace
//! 各类功能在以下的子模块被实现
//! - [`trap`] :解决用户空间和内核空间的切换
//! - [`task`] :管理任务
//! - [`syscall`]: System call 的处理和实现
//! - [`mm`]: SV39 的 vm 管理
//! - [`sync`]: 包装所有的static data structure，这样我们就不需要用unsafe访问他们
//! - [`fs`]: Separate user from file system with some structures

// #![deny(missing_docs)]
// #![deny(warnings)]
// #![allow(unused_imports)]
#![no_std]
#![no_main]
#![feature(panic_info_message)]
#![feature(alloc_error_handler)]
#![feature(error_in_core)]
#![feature(negative_impls)]

extern crate alloc;

#[macro_use]
extern crate bitflags;

// #[path = "boards/qemu.rs"]
// mod board;

pub mod boards;

#[macro_use]
mod console;
mod config;
pub mod ctypes;
mod drivers;
mod executor;
// pub mod fat32;
pub mod fs;
pub mod futex;
pub mod lang_items;
pub mod loader;
pub mod logging;
pub mod mm;
pub mod mutex;
pub mod sbi;
mod signal;
pub mod sync;
pub mod syscall;
pub mod task;
pub mod timer;
pub mod trap;
pub mod utils;

use core::arch::{asm, global_asm};
// use core::sync::atomic::{AtomicBool, Ordering};

use riscv::register::sstatus;
// use sbi::hart_start;

use crate::config::*;
// use crate::mm::KERNEL_SPACE;
// use crate::sbi::hart_start;
use crate::task::processor::new_local_hart;

global_asm!(include_str!("entry.asm"));
global_asm!(include_str!("link_app.S"));

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

///
#[no_mangle]
pub fn fake_main(hart_id: usize) {
    unsafe {
        asm!("add sp, sp, {}", in(reg) KERNEL_BASE);
        asm!("la t0, rust_main");
        asm!("add t0, t0, {}", in(reg) KERNEL_BASE);
        asm!("mv a0, {}", in(reg) hart_id);
        asm!("jalr zero, 0(t0)");
    }
}

#[no_mangle]
#[rustfmt::skip]
/// the rust entry-point of os
pub fn rust_main(hart_id: usize) -> ! {
    new_local_hart(hart_id);

    // if FIRST_HART
    //     .compare_exchange(true, false, Ordering::SeqCst, Ordering::SeqCst)
    //     .is_ok()
    // {
    print!("\u{1B}[38;5;14m");
    println!("");
    println!("    :::     :::::::::   ::::::::  ::::    :::     :::            ::::::::   ::::::::  ");
    println!("  :+: :+:   :+:    :+: :+:    :+: :+:+:   :+:   :+: :+:         :+:    :+: :+:    :+: ");
    println!(" +:+   +:+  +:+    +:+ +:+    +:+ :+:+:+  +:+  +:+   +:+        +:+    +:+ +:+        ");
    println!("+#++:++#++: +#++:++#:  +#+    +:+ +#+ +:+ +#+ +#++:++#++:       +#+    +:+ +#++:++#++ ");
    println!("+#+     +#+ +#+    +#+ +#+    +#+ +#+  +#+#+# +#+     +#+       +#+    +#+        +#+ ");
    println!("#+#     #+# #+#    #+# #+#    #+# #+#   #+#+# #+#     #+#       #+#    #+# #+#    #+# ");
    println!("###     ### ###    ###  ########  ###    #### ###     ###        ########   ########  ");
    println!("");
    // println!("~*^*~ Bug bug flying away! ~*^*~");
    print!("\u{1B}[0m");

    // 允许S mode访问U mode的页面, 需要localctx的env_context进行管理, 目前就保持全局开启
    unsafe {
        sstatus::set_sum();
    }
    clear_bss();
    logging::init();
    mm::init();
    trap::init();
    executor::init();
    trap::enable_timer_interrupt();
    timer::set_next_trigger();
    fs::init::init();
    // 允许S mode访问U mode的页面, 需要localctx的env_context进行管理, 目前就保持全局开启
    unsafe {
        sstatus::set_sum();
    }
    loader::list_apps();
    task::add_initproc();

    // INIT_FINISHED.store(true, Ordering::SeqCst);
    // start_all_cpu(hart_id);
    // }
    // else {
    //     while !INIT_FINISHED.load(Ordering::SeqCst) {} // todo:实际上这里似乎并不需要这条语句，不过还是先留着。

    //     // 允许S mode访问U mode的页面, 需要localctx的env_context进行管理, 目前就保持全局开启
    //     unsafe {
    //         sstatus::set_sum();
    //     }
    //     trap::init();
    //     trap::enable_timer_interrupt();
    //     timer::set_next_trigger();

    //     KERNEL_SPACE.lock().activate();
    //     // info!("cpu: {} start!", hart_id);
    // }

    executor::run_forever();
    // if hart_id == 0 {
    //     executor::run_forever();
    // } else {
    //     loop {}
    // }
}

// #[allow(unused)]
// fn start_all_cpu(hart_id: usize) {
//     // info!("cpu:{} Hello, world!", hart_id);
//     for i in 0..4 {
//         if i == hart_id {
//             continue;
//         }
//         let status = hart_start(i, 0x80200000);
//         // info!(
//         //     "hart {} start to wake up hart {}... status {}",
//         //     hart_id, i, status
//         // );
//     }
// }

// static FIRST_HART: AtomicBool = AtomicBool::new(true);
// static INIT_FINISHED: AtomicBool = AtomicBool::new(false);
