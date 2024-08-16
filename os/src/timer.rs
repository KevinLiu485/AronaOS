//! RISC-V timer-related functionality

use crate::config::{SyscallRet, CLOCK_FREQ};
use crate::ctypes::NSEC_PER_SEC;
use crate::sbi::set_timer;
use core::future::Future;
use core::pin::Pin;
use core::task::{Context, Poll};
use core::time::Duration;
use riscv::register::time;

const TICKS_PER_SEC: usize = 100;
const MSEC_PER_SEC: usize = 1000;

#[derive(Clone, Copy, Debug)]
#[repr(C)]
pub struct TimeSpec {
    pub sec: usize,
    pub nsec: usize,
}

impl TimeSpec {
    pub fn new() -> Self {
        // new a time spec with machine time
        let current_time = get_time_ms();
        Self {
            sec: current_time / 1000,
            nsec: current_time % 1000000 * 1000000,
        }
    }
    /// turn the TimeSecs to nano seconds
    pub fn turn_to_nanos(&self) -> usize {
        self.sec * NSEC_PER_SEC + self.nsec
    }
}

impl From<Duration> for TimeSpec {
    fn from(duration: Duration) -> Self {
        Self {
            sec: duration.as_secs() as usize,
            nsec: duration.subsec_nanos() as usize,
        }
    }
}

/// Return the current clock time in `core::time::Duration`
pub fn current_time_duration() -> Duration {
    let time = get_time_ms();
    Duration::from_millis(time as u64)
}

/// get current time as TimeSpec
pub fn current_time_spec() -> TimeSpec {
    // stack_trace!();
    current_time_duration().into()
}

///get current time
pub fn get_time() -> usize {
    time::read()
}
/// get current time in microseconds
pub fn get_time_ms() -> usize {
    time::read() / (CLOCK_FREQ / MSEC_PER_SEC)
}
/// set the next timer interrupt
pub fn set_next_trigger() {
    set_timer(get_time() + CLOCK_FREQ / TICKS_PER_SEC);
}

pub struct TimeoutFuture {
    expired_time: Duration,
}

impl TimeoutFuture {
    pub fn new(duration: Duration) -> Self {
        Self {
            expired_time: Duration::from_millis(get_time_ms() as u64) + duration,
        }
    }
}

impl Future for TimeoutFuture {
    type Output = SyscallRet;
    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = unsafe { self.get_unchecked_mut() };
        if get_time_ms() >= this.expired_time.as_millis() as usize {
            Poll::Ready(Ok(0))
        } else {
            cx.waker().wake_by_ref();
            Poll::Pending
        }
    }
}
