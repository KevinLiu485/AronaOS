//! The panic handler
use crate::{sbi::shutdown, task::processor::current_thread};
use core::panic::PanicInfo;

#[macro_export]
macro_rules! kernel {
    ($fmt: literal $(, $($arg: tt)+)?) => {
        $crate::console::print(format_args!(concat!("\u{1B}[31m[kernel] ", $fmt, "\u{1B}[0m", "\n") $(, $($arg)+)?));
    }
}

// DO NOT CALL ANY FUNCTION THAT MAY PANIC, CAUSING PANIC LOOP
// e.g. unwrap(), current_trap_cx()
#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    kernel!("Panic.");
    if let Some(thread) = current_thread() {
        let sepc = thread.get_inner_mut().get_trap_context().sepc;
        kernel!("user sepc: {:#x}", sepc);
    }
    if let Some(location) = info.location() {
        kernel!("at file: {}, line: {}", location.file(), location.line());
    }
    if let Some(message) = info.message() {
        kernel!("{}", message);
    }
    shutdown(true)
}
