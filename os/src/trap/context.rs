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

impl TrapContext {
    ///set stack pointer to x_2 reg (sp)
    pub fn set_sp(&mut self, sp: usize) {
        self.x[2] = sp;
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
