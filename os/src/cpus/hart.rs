
// os对于cpu的抽象
pub struct Hart {
    hart_id: usize,

    // 当前正在跑的任务
    // 当前cpu对应的内核栈
}

const HART_NUM: u32 = 4;
pub static mut HARTS: [Hart; HART_NUM] = [HART_EACH; HART_NUM];
