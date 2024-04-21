use alloc::string::String;

/// Convert C-style string(end with '\0') to rust string
pub fn c_str_to_string(ptr: *const u8) -> String {
    println!("ptr: 0x{:x}", ptr as usize);
    let mut ptr = ptr as usize;
    let mut ret = String::new();
    loop {
        let ch: u8 = unsafe { *(ptr as *const u8) };
        if ch == 0 {
            break;
        }
        ret.push(ch as char);
        ptr += 1;
    }
    println!("get string: {}", ret);
    ret
}
