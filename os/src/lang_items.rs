//! The panic handler
use crate::{sbi::shutdown, task::current_trap_cx};
use core::panic::PanicInfo;
use log::*;

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    let sepc = current_trap_cx().sepc;
    if let Some(location) = info.location() {
        error!(
            "[kernel] Panicked at {}:{} {}, user sepc: {:x}",
            location.file(),
            location.line(),
            info.message().unwrap(),
            sepc,
        );
    } else {
        error!(
            "[kernel] Panicked: {}, user sepc: {:x}",
            info.message().unwrap(),
            sepc
        );
    }
    shutdown(true)
}
