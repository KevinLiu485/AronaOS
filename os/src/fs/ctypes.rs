// Iovec

#[repr(C)]
pub struct Iovec {
    /// user space buf start address
    pub iov_base: usize,
    /// number of bytes to transfer
    pub iov_len: usize,
}
