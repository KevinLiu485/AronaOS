//! Implementation of [`TrapContext`]
use riscv::register::sstatus::{self, Sstatus, SPP};

///trap context structure containing sstatus, sepc and registers
#[derive(Debug, Clone, Copy)]
#[repr(C)]
pub struct TrapContext {
    /// general regs[0..31]
    pub x: [usize; 32],
    /// CSR sstatus      
    pub sstatus: Sstatus, // 32
    /// CSR sepc
    pub sepc: usize, // 33
    /// kernel-to-user should save:
    pub kernel_sp: usize, // 34
    ///
    pub kernel_ra: usize, // 35
    ///
    pub kernel_s: [usize; 12], // 36-47
    ///
    pub kernel_fp: usize, // 48
    /// Addr of Page Table, should not be modified after init
    pub kernel_satp: usize, // 49
}

// x0 zero Constant 0
// x1 ra Return Address
// x2 sp Stack Pointer
// x3 gp Global Pointer
// x4 tp Thread Pointer
// x10 a0 and x11 a1 Function Arguments or Return Values

impl TrapContext {
    ///set stack pointer to x_2 reg (sp)
    pub fn set_sp(&mut self, sp: usize) {
        self.x[2] = sp;
    }
    pub fn set_entry_point(&mut self, entry_point: usize) {
        self.sepc = entry_point;
    }
    pub fn set_return_value(&mut self, return_value: usize) {
        self.x[10] = return_value;
    }
    pub fn set_thread_pointer(&mut self, thread_pointer: usize) {
        self.x[4] = thread_pointer;
    }
    pub fn set_global_pointer(&mut self, global_pointer: usize) {
        self.x[3] = global_pointer;
    }
    pub fn get_global_pointer(&self) -> usize {
        self.x[3]
    }

    ///init app context
    pub fn app_init_context(entry: usize, sp: usize, kernel_satp: usize) -> Self {
        let mut sstatus = sstatus::read();
        // set CPU privilege to User after trapping back
        sstatus.set_spp(SPP::User);
        let mut cx = Self {
            x: [0; 32],
            sstatus,
            sepc: entry,
            // The following regs will be stored in __return_to_user
            kernel_sp: 0,
            kernel_ra: 0,
            kernel_fp: 0,
            kernel_s: [0; 12],
            kernel_satp,
        };
        cx.set_sp(sp);
        cx
    }
    /// zero_init app context
    pub fn zero_init() -> Self {
        let sstatus = sstatus::read();
        Self {
            x: [0; 32],
            sstatus,
            sepc: 0,
            kernel_sp: 0,
            kernel_ra: 0,
            kernel_fp: 0,
            kernel_s: [0; 12],
            kernel_satp: 0,
        }
    }
}
