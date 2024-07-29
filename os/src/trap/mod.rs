//! Trap 处理函数
//! 对于这个系统, 用户态的trap 的进入点（entry point）, 就是 `__trap_from_user`.
//! 在`trap_return`时, 我们把 stvec 的 CSR指向它
//!
//! 所有的用户态trap都需要经过 `__trap_from_user`, 他的定义在 `trap.S`中. 仅仅是做保存上下文的任务,
//! 然后通过ret把控制权交给`trap_handler()`, ra是在 [`thread_loop()`]中设置
//! 来确保Rust code 能够安全的运行 并且把控制权移交给 [`trap_handler()`].
//!
//! It then calls different functionality based on what exactly the exception
//! was. For example, timer interrupts trigger task preemption, and syscalls go
//! to [`syscall()`].
mod context;
mod irq;

use crate::mm::{handle_recoverable_page_fault, PageTable, VirtAddr};
use crate::signal::handle_signals;
use crate::syscall::syscall;
use crate::task::processor::current_thread;
use crate::task::{current_trap_cx, exit_current, yield_task};
use crate::timer::set_next_trigger;
use core::arch::global_asm;
use log::error;
use riscv::register::satp;
use riscv::register::{
    mtvec::TrapMode,
    scause::{self, Exception, Interrupt, Trap},
    sie, stval, stvec,
};

global_asm!(include_str!("trap.S"));

extern "C" {
    fn __trap_from_kernel();
    fn __trap_from_user();
}
/// initialize CSR `stvec` as the entry of `__alltraps`
pub fn init() {
    set_kernel_trap_entry();
}

pub fn set_kernel_trap_entry() {
    unsafe {
        stvec::write(trap_from_kernel as usize, TrapMode::Direct);
    }
}

fn set_user_trap_entry() {
    unsafe {
        stvec::write(__trap_from_user as usize, TrapMode::Direct);
    }
}
/// enable timer interrupt in sie CSR
pub fn enable_timer_interrupt() {
    unsafe {
        sie::set_stimer();
    }
}

#[no_mangle]
/// handle an interrupt, exception, or system call from user space
pub async fn trap_handler() {
    // debug!("trap_handler(): enter");
    set_kernel_trap_entry();
    let scause = scause::read();
    let stval = stval::read();
    //open_interrupt();
    match scause.cause() {
        Trap::Exception(Exception::UserEnvCall) => {
            // jump to next instruction anyway
            let mut cx = current_trap_cx();
            cx.set_entry_point(cx.sepc + 4);
            // get system call return value
            let result = syscall(
                cx.x[17],
                [cx.x[10], cx.x[11], cx.x[12], cx.x[13], cx.x[14], cx.x[15]],
            )
            .await;
            // cx is changed during sys_exec, so we have to call it again
            cx = current_trap_cx();
            cx.x[10] = result.unwrap_or_else(|err_code| (-(err_code as isize)) as usize);
        }
        Trap::Exception(Exception::StoreFault)
        | Trap::Exception(Exception::InstructionFault)
        | Trap::Exception(Exception::InstructionPageFault)
        | Trap::Exception(Exception::LoadFault) => {
            let satp = satp::read().bits();
            let page_table = PageTable::from_token(satp);
            page_table.dump_all();
            error!(
                "[kernel] {:?} in application, bad addr = {:#x}, bad instruction = {:#x}, kernel killed it.",
                scause.cause(),
                stval,
                current_trap_cx().sepc,
            );
            let pte = page_table.find_pte(VirtAddr::from(stval).floor()).unwrap();
            error!("pte: {:?}", pte);
            // page fault exit code
            exit_current(-2);
        }
        Trap::Exception(Exception::LoadPageFault) | Trap::Exception(Exception::StorePageFault) => {
            // recoverable page fault:
            // 1. fork COW area
            // 2. lazy allocation
            // debug!(
            //     "[kernel] encounter page fault, addr {:#x}, instruction {:#x} scause {:?}",
            //     stval,
            //     current_trap_cx().sepc,
            //     scause.cause()
            // );
            // stval is the faulting virtual address, current_trap_cx().sepc is the faulting instruction
            let vpn = VirtAddr::from(stval).floor();
            let satp = satp::read().bits();
            let page_table = PageTable::from_token(satp);
            if handle_recoverable_page_fault(&page_table, vpn).is_err() {
                error!(
                    "[kernel] unrecoverable page fault in application, bad addr = {:#x}, bad instruction = {:#x}, kernel killed it.",
                    stval,
                    current_trap_cx().sepc,
                );
                page_table.dump_all();
                // page fault exit code
                exit_current(-2);
            }
            // we should jump back to the faulting instruction after handling the page fault
        }
        Trap::Exception(Exception::IllegalInstruction) => {
            error!("[kernel] IllegalInstruction in application, kernel killed it.");
            // illegal instruction exit code
            exit_current(-3);
        }
        Trap::Interrupt(Interrupt::SupervisorTimer) => {
            set_next_trigger();
            yield_task().await;
        }
        _ => {
            panic!(
                "Unsupported trap {:?}, stval = {:#x}!",
                scause.cause(),
                stval
            );
        }
    }
}

#[no_mangle]
/// set the new addr of __restore asm function in TRAMPOLINE page,
/// set the reg a0 = trap_cx_ptr, reg a1 = phy addr of usr page table,
/// finally, jump to new addr of __restore asm function
pub fn trap_return() {
    // debug!("trap_return(): enter");
    // 关闭中断
    //close_interrupt();
    set_user_trap_entry();
    // todo: 信号嵌套
    // 现在不支持信号嵌套
    if current_thread().unwrap().get_inner_mut().handling_signo == 0 {
        handle_signals();
    }
    let cx = current_trap_cx();
    //let user_satp = current_user_token();
    extern "C" {
        #[allow(improper_ctypes)]
        fn __return_to_user(cx: *mut TrapContext);
    }
    unsafe {
        __return_to_user(cx);
    }
}

#[no_mangle]
/// Unimplement: traps/interrupts/exceptions from kernel mode
/// Todo: Chapter 9: I/O device
pub fn trap_from_kernel() -> ! {
    use riscv::register::sepc;
    error!("stval = {:#x}, sepc = {:#x}", stval::read(), sepc::read());
    panic!("a trap {:?} from kernel!", scause::read().cause());
}

pub use context::TrapContext;
