    .section .text.usercheck
    .align 12
    .global __try_write_user_u8
    .global __try_access_user_error_trap

// should set stvec to __try_access_user_error_trap in advance before checking
// arg: a0: input_addr 
__try_write_user_u8:
    mv a2, a0
    mv a0, zero 
    lb a3, 0(a2)
    sb a1, 0(a2)
    sb a3, 0(a2)
    ret 
    .align 2

// if pagefault, return: (a0, a1) <- (1, scause)
    .align 6
__try_access_user_error_trap:
    csrw sepc, ra 
    li a0, 1
    csrr a1, scause
    sret 