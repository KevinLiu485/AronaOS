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
        println!("[kernel] Hello, world!");

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
            println!("[kernel] start to wake up hart {}... status {}", i, status);
        }

        task::run_tasks();
        panic!("Unreachable in rust_main!");
    } else {
        //todo: 先loop着，后续再加支持
        // 以及sbi相关的东西可能需要相关的引入。
        while !INIT_FINISHED.load(Ordering::SeqCst) {}
        // while(started == 0){} //
        // __sync_synchronize(); // 内存屏障
        //
        //
        // kvminithart();    // turn on paging
        // trapinithart();   // install kernel trap vector
        // plicinithart();   // ask PLIC for device interrupts
        //
        //
        // // barrier
        // while !INIT_FINISHED.load(Ordering::SeqCst) {}
        // trap::init();
        println!("cpu: {}", hart_id);
        loop {
        }
    }
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