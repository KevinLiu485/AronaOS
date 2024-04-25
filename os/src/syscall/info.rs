use core::ptr;

#[repr(C)]
struct Utsname {
    pub sysname: [u8; 65],
    pub nodename: [u8; 65],
    pub release: [u8; 65],
    pub version: [u8; 65],
    pub machine: [u8; 65],
}

impl Utsname {
    fn new() -> Utsname {
        const SYSNAME: &str = "Linux";
        const NODENAME: &str = "LAPTOP-OFKSB39E";
        const RELEASE: &str = "5.15.146.1-microsoft-standard-WSL2";
        const VERSION: &str = "#1 SMP Thu Jan 11 04:09:03 UTC 2024";
        const MACHINE: &str = "RISC-V SiFive Freedom U740 SoC";
        let mut sysname: [u8; 65] = [0; 65];
        for (i, &byte) in SYSNAME.as_bytes().iter().enumerate() {
            sysname[i] = byte;
        }
        let mut nodename: [u8; 65] = [0; 65];
        for (i, &byte) in NODENAME.as_bytes().iter().enumerate() {
            nodename[i] = byte;
        }
        let mut release: [u8; 65] = [0; 65];
        for (i, &byte) in RELEASE.as_bytes().iter().enumerate() {
            release[i] = byte;
        }
        let mut version: [u8; 65] = [0; 65];
        for (i, &byte) in VERSION.as_bytes().iter().enumerate() {
            version[i] = byte;
        }
        let mut machine: [u8; 65] = [0; 65];
        for (i, &byte) in MACHINE.as_bytes().iter().enumerate() {
            machine[i] = byte;
        }
        Utsname {
            sysname,
            nodename,
            release,
            version,
            machine,
        }
    }
}

/// fake uname  
pub fn sys_uname(uts: usize) -> isize {
    let uts = uts as *mut Utsname;
    //Todo!: check validarity
    let utsname = Utsname::new();
    unsafe {
        ptr::write(uts, utsname);
    }
    0
}
