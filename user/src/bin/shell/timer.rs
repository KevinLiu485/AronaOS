use user_lib::{defs::TimeVal, gettime};

pub struct Timer {
    start: TimeVal,
}

impl Timer {
    pub fn new() -> Self {
        Timer {
            start: TimeVal { sec: 0, usec: 0 },
        }
    }

    pub fn start(&mut self) {
        self.start = gettime().unwrap();
    }

    pub fn timeval_to_ms(tv: TimeVal) -> u64 {
        tv.sec as u64 * 1000 + tv.usec as u64 / 1000
    }

    /// return elapsed time in ms, then end the timer
    pub fn elapsed_ms(&self) -> u64 {
        let now = gettime().unwrap();
        let start_ms = Self::timeval_to_ms(self.start);
        let now_ms = Self::timeval_to_ms(now);
        now_ms - start_ms
    }
}