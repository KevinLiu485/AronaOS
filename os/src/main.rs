//! The main module and entrypoint
//!
//! Various facilities of the kernels are implemented as submodules. The most
//! important ones are:
//!
//! - [`trap`]: Handles all cases of switching from userspace to the kernel
//! - [`task`]: Task management
//! - [`syscall`]: System call handling and implementation
//! - [`mm`]: Address map using SV39
//! - [`sync`]: Wrap a static data structure inside it so that we are able to access it without any `unsafe`.
//! - [`fs`]: Separate user from file system with some structures
//!
//! The operating system also starts in this module. Kernel code starts
//! executing from `entry.asm`, after which [`rust_main()`] is called to
//! initialize various pieces of functionality. (See its source code for
//! details.)
//!
//! We then call [`task::run_tasks()`] and for the first time go to
//! userspace.

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

#[path = "boards/qemu.rs"]
mod board;

#[macro_use]
mod console;
mod config;
pub mod ctypes;
mod drivers;
mod executor;
pub mod fat32;
pub mod fs;
pub mod lang_items;
pub mod logging;
pub mod mm;
pub mod mutex;
pub mod sbi;
pub mod sync;
pub mod syscall;
pub mod task;
pub mod timer;
pub mod trap;
pub mod utils;

use core::arch::{asm, global_asm};
use riscv::register::sstatus;

use crate::config::*;

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
/// the rust entry-point of os
pub fn rust_main() -> ! {
    clear_bss();
    println!("[kernel] Hello, world!");
    logging::init();
    // error!("current satp: {:?}", current_satp());
    mm::init();
    // error!("current satp: {:?}", current_satp());
    //mm::remap_test();
    //mm::from_global_test();
    //mm::dump_test();
    executor::init();
    trap::init();
    trap::enable_timer_interrupt();
    timer::set_next_trigger();
    // fat32::init();
    fs::list_apps();
    // 允许S mode访问U mode的页面, 需要localctx的env_context进行管理, 目前就保持全局开启
    unsafe {
        sstatus::set_sum();
    }
    task::add_initproc();

    executor::run_forever();
}
