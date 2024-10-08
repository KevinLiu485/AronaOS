use super::{handle_recoverable_page_fault, PageTable, VirtAddr};
use crate::trap::set_kernel_trap_entry;
use crate::SysResult;
use core::arch::global_asm;
use log::trace;
use riscv::register::satp;
use riscv::register::scause::{Exception, Scause, Trap};
use riscv::register::stvec::{self, TrapMode};

global_asm!(include_str!("check.S"));

pub struct UserCheck {}

#[repr(C)]
struct TryOpRet {
    is_err: usize,
    scause: Scause,
}

extern "C" {
    fn __try_access_user_error_trap();
    #[allow(improper_ctypes)]
    fn __try_write_user_u8(user_addr: usize) -> TryOpRet;
    #[allow(improper_ctypes)]
    fn __tray_read_user_u8(user_addr: usize) -> TryOpRet;
}

impl Drop for UserCheck {
    fn drop(&mut self) {
        set_kernel_trap_entry();
    }
}

impl UserCheck {
    pub fn new() -> Self {
        unsafe {
            stvec::write(__try_access_user_error_trap as usize, TrapMode::Direct);
        }
        Self {}
    }
    /// Check whether the pages are writable
    /// 1. the kernel try to write to the COW page in the user space
    pub fn check_writable_pages(&self, buf: *const u8, len: usize) -> SysResult<()> {
        trace!("[check_writable_pages] buf: {:p}, len: {:#x}", buf, len);
        let buf_start = VirtAddr::from(buf as usize).floor();
        let buf_end = VirtAddr::from(buf as usize + len).ceil();
        let mut vpn = buf_start;
        let satp = satp::read().bits();
        let page_table = PageTable::from_token(satp);

        while vpn < buf_end {
            if let Some(scause) = self.try_write_user(VirtAddr::from(vpn).0) {
                match scause.cause() {
                    Trap::Exception(Exception::LoadPageFault)
                    | Trap::Exception(Exception::StorePageFault) => {
                        handle_recoverable_page_fault(&page_table, vpn)?
                    }
                    _ => {}
                }
            }
            vpn.0 += 1;
        }
        Ok(())
    }
    fn try_write_user(&self, user_addr: usize) -> Option<Scause> {
        let ret = unsafe { __try_write_user_u8(user_addr) };
        match ret.is_err {
            0 => None,
            _ => Some(ret.scause),
        }
    }
    #[allow(unused)]
    fn try_read_user(&self, user_addr: usize) -> Option<Scause> {
        let ret = unsafe { __tray_read_user_u8(user_addr) };
        match ret.is_err {
            0 => None,
            _ => Some(ret.scause),
        }
    }
}
