//! Trap 处理函数
//! 对于这个系统, 我们仅拥有一个trap 的进入点（entry point）, 就是 `__alltraps`.
//! 在 [`init()`]的初始化中, 我们把 stvec 的 CSR指向它
//!
//! 所有的trap都需要经过 `__alltraps`, 他的定义在 `trap.S`中. 仅仅是做保存上下文的任务
//! 来确保Rust code 能够安全的运行 并且把控制权移交给 [`trap_handler()`].
//!
//! It then calls different functionality based on what exactly the exception
//! was. For example, timer interrupts trigger task preemption, and syscalls go
//! to [`syscall()`].
mod context;

use crate::mm::{frame_alloc, PTEFlags, PageTable, PageTableEntry, VirtAddr};
use crate::syscall::syscall;
use crate::task::{current_task, current_trap_cx, exit_current, yield_task};
use crate::timer::set_next_trigger;
use alloc::sync::Arc;
use core::arch::global_asm;
use log::{debug, error};
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

fn set_kernel_trap_entry() {
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
    match scause.cause() {
        Trap::Exception(Exception::UserEnvCall) => {
            // jump to next instruction anyway
            let mut cx = current_trap_cx();
            cx.sepc += 4;
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
        | Trap::Exception(Exception::StorePageFault)
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
            // page fault exit code
            exit_current(-2);
        }
        Trap::Exception(Exception::LoadPageFault) => {
            // recoverable page fault:
            // 1. fork COW area
            // 2. lazy allocation
            debug!(
                "[kernel] encounter page fault, addr {:#x}, instruction {:#x} scause {:?}",
                stval,
                current_trap_cx().sepc,
                scause.cause()
            );
            // stval is the faulting virtual address, current_trap_cx().sepc is the faulting instruction
            let vpn = VirtAddr::from(stval).floor();
            let satp = satp::read().bits();
            let page_table = PageTable::from_token(satp);
            if let Some(pte) = page_table.find_pte(vpn) {
                if pte.is_cow() {
                    // fork COW area
                    // 如果refcnt == 1, 则直接修改pte, 否则, 分配新的frame, 修改pte, 更新MemorySet
                    debug!("handle cow page fault(cow), vpn {:#x}", vpn.0);
                    let current_task = current_task().unwrap();
                    let memory_set = &mut current_task.inner_lock().memory_set;
                    for area in memory_set.areas.iter_mut() {
                        if area.vpn_range.contains(vpn) {
                            // 根据VPN找到对应的data_frame, 并查看Arc的引用计数
                            let data_frame = area.data_frames.get(&vpn).unwrap();
                            if Arc::strong_count(data_frame) == 1 {
                                // 直接修改pte
                                // clear COW bit and set valid bit
                                let mut flags = pte.flags();
                                flags.remove(PTEFlags::COW);
                                flags.insert(PTEFlags::W);
                                *pte = PageTableEntry::new(pte.ppn(), flags);
                            } else {
                                // 分配新的frame, 修改pte, 更新MemorySet
                                let frame = frame_alloc().unwrap();
                                let src_frame = pte.ppn().get_bytes_array();
                                let dst_frame = frame.ppn.get_bytes_array();
                                dst_frame.copy_from_slice(src_frame);
                                // clear COW bit and set valid bit, update pte
                                let mut flags = pte.flags();
                                flags.remove(PTEFlags::COW);
                                flags.insert(PTEFlags::W);
                                *pte = PageTableEntry::new(frame.ppn, flags);
                                // update MemorySet -> MapArea -> data_frames
                                area.data_frames.insert(vpn, Arc::new(frame));
                                // todo?: flush TLB
                            }
                        }
                    }
                } else {
                    // lazy allocation
                    todo!("unimplemented lazy allocation");
                }
            } else {
                error!("page fault but can't find valid pte");
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
    set_user_trap_entry();
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
