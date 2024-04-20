//! Implementation of [`TrapContext`]
use riscv::register::sstatus::{self, Sstatus, SPP};

#[repr(C)]
#[derive(Debug, Clone, Copy)]
///trap context structure containing sstatus, sepc and registers
pub struct TrapContext {
    /// general regs[0..31]
    /* 0 */
    pub x: [usize; 32],
    /// CSR sstatus      
    /* 32 */
    pub sstatus: Sstatus,
    /// CSR sepc
    /* 33 */
    pub sepc: usize,

    /// kernel-to-user should save:
    /// general regs[0..31]
    /* 34 */
    pub kernel_s: [usize; 32],
    /// Addr of Page Table, should not be modified after init
    /* 66 */
    pub kernel_satp: usize,
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
            kernel_s: [0; 32],
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
            kernel_s: [0; 32],
            kernel_satp: 0,
        }
    }
}
