    .section .text.entry
    .globl _start
_start:
    slli t0, a0, 16  # t0 = hart_id << 16(4096 * 16)
    la sp, boot_stack_top
    sub sp, sp, t0  # sp = stack top - hart_id * stack_size
    
    # 这里在titanix里面有一个激活pagetable的过程，这里我省略了。

    call rust_main

    .section .bss.stack
    .globl boot_stack_lower_bound
boot_stack_lower_bound:
    .space 4096 * 16 * 4 # rcore的kernel stack还是有点大的
    .globl boot_stack_top
boot_stack_top: