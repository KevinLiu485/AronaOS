.altmacro
.macro SAVE_GP n
    sd x\n, \n*8(sp)
.endm
.macro LOAD_GP n
    ld x\n, \n*8(sp)
.endm
    .section .text.trampoline
    .globl __trap_from_user
    .globl __return_to_user
    .globl __trap_from_kernel
    .align 2

# user -> kernel
__trap_from_user:
    csrrw sp, sscratch, sp
    # now sp->*TrapContext in kernel space, sscratch->user stack
    # save other general purpose registers
    sd x1, 1*8(sp)
    # skip sp(x2), we will save it later
    # save x3~x31 (x4 is tp)
    .set n, 3
    .rept 29
        SAVE_GP %n
        .set n, n+1
    .endr
    # we can use t0/t1/t2 freely, because they have been saved in TrapContext
    csrr t0, sstatus
    csrr t1, sepc
    sd t0, 32*8(sp)
    sd t1, 33*8(sp)
    # read user stack from sscratch and save it in TrapContext
    csrr t2, sscratch
    sd t2, 2*8(sp)

    # load kernel GP regs
    ld x1, 35*8(sp)
    # skip sp(x2), we will save it later
    ld x3, 37*8(sp)
    ld x4, 38*8(sp)
    ld x5, 39*8(sp)
    ld x6, 40*8(sp)
    ld x7, 41*8(sp)
    ld x8, 42*8(sp)
    ld x9, 43*8(sp)
    ld x10, 44*8(sp)
    ld x11, 45*8(sp)
    ld x12, 46*8(sp)
    ld x13, 47*8(sp)
    ld x14, 48*8(sp)
    ld x15, 49*8(sp)
    ld x16, 50*8(sp)
    ld x17, 51*8(sp)
    ld x18, 52*8(sp)
    ld x19, 53*8(sp)
    ld x20, 54*8(sp)
    ld x21, 55*8(sp)
    ld x22, 56*8(sp)
    ld x23, 57*8(sp)
    ld x24, 58*8(sp)
    ld x25, 59*8(sp)
    ld x26, 60*8(sp)
    ld x27, 61*8(sp)
    ld x28, 62*8(sp)
    ld x29, 63*8(sp)
    ld x30, 64*8(sp)
    ld x31, 65*8(sp)

    # load kernel satp
    ld t0, 66*8(sp)
    # load sp
    ld sp, 36*8(sp)
    # write satp
    csrw satp, t0
    sfence.vma
    ret # = jr ra

# kernel -> user
__return_to_user:
    # a0: *TrapContext in user space(Constant); a1: user space token
    # switch to user space
    # csrw satp, a1
    # sfence.vma
    # ssratch: *TrapContext
    csrw sscratch, a0
    # save sp first
    sd sp, 36*8(a0)
    mv sp, a0
    # now sp: *TrapContext
    # save kernel GP regs
    sd x1, 35*8(sp)
    # sp(x2) is saved before
    sd x3, 37*8(sp)
    sd x4, 38*8(sp)
    sd x5, 39*8(sp)
    sd x6, 40*8(sp)
    sd x7, 41*8(sp)
    sd x8, 42*8(sp)
    sd x9, 43*8(sp)
    sd x10, 44*8(sp)
    sd x11, 45*8(sp)
    sd x12, 46*8(sp)
    sd x13, 47*8(sp)
    sd x14, 48*8(sp)
    sd x15, 49*8(sp)
    sd x16, 50*8(sp)
    sd x17, 51*8(sp)
    sd x18, 52*8(sp)
    sd x19, 53*8(sp)
    sd x20, 54*8(sp)
    sd x21, 55*8(sp)
    sd x22, 56*8(sp)
    sd x23, 57*8(sp)
    sd x24, 58*8(sp)
    sd x25, 59*8(sp)
    sd x26, 60*8(sp)
    sd x27, 61*8(sp)
    sd x28, 62*8(sp)
    sd x29, 63*8(sp)
    sd x30, 64*8(sp)
    sd x31, 65*8(sp)

    # restore sstatus/sepc
    ld t0, 32*8(sp)
    ld t1, 33*8(sp)
    csrw sstatus, t0
    csrw sepc, t1
    # restore general purpose registers except x0/sp/
    ld x1, 1*8(sp)
    .set n, 3
    .rept 29
        LOAD_GP %n
        .set n, n+1
    .endr
    # back to user stack
    ld sp, 2*8(sp)
    sret

# trap from kernel is NOT SUPPORTED YET
# kernel -> kernel
__trap_from_kernel:
    # only need to save caller-saved regs
    # note that we don't save sepc & stvec here
    # addi sp, sp, -17*8
    # sd  ra,  1*8(sp)
    # sd  t0,  2*8(sp)
    # sd  t1,  3*8(sp)
    # sd  t2,  4*8(sp)
    # sd  t3,  5*8(sp)
    # sd  t4,  6*8(sp)
    # sd  t5,  7*8(sp)
    # sd  t6,  8*8(sp)
    # sd  a0,  9*8(sp)
    # sd  a1, 10*8(sp)
    # sd  a2, 11*8(sp)
    # sd  a3, 12*8(sp)
    # sd  a4, 13*8(sp)
    # sd  a5, 14*8(sp)
    # sd  a6, 15*8(sp)
    # sd  a7, 16*8(sp)
    call trap_from_kernel
    # ld  ra,  1*8(sp)
    # ld  t0,  2*8(sp)
    # ld  t1,  3*8(sp)
    # ld  t2,  4*8(sp)
    # ld  t3,  5*8(sp)
    # ld  t4,  6*8(sp)
    # ld  t5,  7*8(sp)
    # ld  t6,  8*8(sp)
    # ld  a0,  9*8(sp)
    # ld  a1, 10*8(sp)
    # ld  a2, 11*8(sp)
    # ld  a3, 12*8(sp)
    # ld  a4, 13*8(sp)
    # ld  a5, 14*8(sp)
    # ld  a6, 15*8(sp)
    # ld  a7, 16*8(sp)
    # addi sp, sp, 17*8
    # sret
