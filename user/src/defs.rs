extern crate alloc;
extern crate bitflags;

use core::mem;

bitflags! {
    pub struct OpenFlags: u32 {
        const RDONLY = 0;
        const WRONLY = 1 << 0;
        const RDWR = 1 << 1;
        const CREATE = 1 << 9;
        const TRUNC = 1 << 10;
    }
}

pub const MAX_NAME_LEN: usize = 256;

#[derive(Debug)]
#[repr(C)]
pub struct Dirent {
    /// 64-bit inode number
    pub d_ino: usize,
    /// 64-bit offset to next derent
    pub d_off: usize,
    /// Size of this dirent
    pub d_reclen: u16,
    /// File type
    pub d_type: u8,
    /// File name
    pub d_name: [u8; MAX_NAME_LEN],
}

bitflags! {
    pub struct WaitOption: i32 {
        /// 这个选项用于非阻塞挂起。当与 wait 或 waitpid 一起使用时，如果没有任何子进程状态改变，
        /// 这些系统调用不会阻塞父进程，而是立即返回。在 Linux 中，如果没有子进程处于可等待的状态，wait 或 waitpid 会返回 0。
        const WNOHANG = 1;
        /// 这个选项告诉 wait 或 waitpid 也报告那些已经停止（stopped），但尚未终止的子进程的状态。默认情况下，
        /// 只有当子进程终止时，它们的结束状态才会被报告。如果子进程被某种信号（如 SIGSTOP 或 SIGTSTP）停止，
        /// 并且父进程没有设置 WUNTRACED 选项，那么父进程将不会感知到子进程的停止状态，直到子进程被继续执行或终止。
        const WUNTRACED = 1 << 1;
        /// 当子进程被停止后又继续执行时，使用这个选项。如果子进程之前被一个停止信号（如SIGSTOP 或 SIGTSTP）暂停，
        /// 然后通过继续信号（如 SIGCONT）被继续执行，那么 wait 或 waitpid 将报告这个子进程的状态，
        /// 即使它还没有终止。这允许父进程知道子进程已经从停止状态恢复。
        const WCONTINUED = 1 << 3;
    }
}

bitflags! {
    /// MMAP memeory protection
    pub struct MMAPPROT: u32 {
        /// Readable
        const PROT_READ = 1 << 0;
        /// Writeable
        const PROT_WRITE = 1 << 1;
        /// Executable
        const PROT_EXEC = 1 << 2;
    }
}

pub const AT_FDCWD: i32 = -100;
pub const AT_REMOVEDIR: i32 = 0x200;

/// sys_times, 单位都是us
#[repr(C)]
pub struct Tms {
    /// CPU time spent executing instructions of the calling process
    pub utime: usize,
    /// inside the kernel
    pub stime: usize,
    /// the sum of the utime for all waited-for teminated children
    pub cutime: usize,
    /// the sum of stime for all waited-for teminated children
    pub cstime: usize,
}

#[repr(C)]
pub struct Utsname {
    /// 系统名称
    pub sysname: [u8; 65],
    /// 网络上主机名称
    pub nodename: [u8; 65],
    /// 发行编号
    pub release: [u8; 65],
    /// 版本
    pub version: [u8; 65],
    /// 域名
    pub machine: [u8; 65],
}

#[derive(Clone, Copy, Debug)]
#[repr(C)]
pub struct TimeSpec {
    pub sec: usize,
    pub nsec: usize,
}

#[repr(C)]
#[derive(Debug, Clone, Copy)]
pub struct TimeVal {
    /// seconds
    pub sec: usize,
    /// microseconds
    pub usec: usize,
}

bitflags! {
    /// determines whether updates to the mapping are visible to other processes mapping the same region, and whether
    /// updates are carried through to the underlying file.
    pub struct MMAPFLAGS: u32 {
        /// MAP_SHARED
        const MAP_SHARED = 1 << 0;
        /// MAP_PRIVATE
        const MAP_PRIVATE = 1 << 1;
        /// 以上两种只能选一
        /// MAP_FIXED, 一定要映射到addr, 不是作为hint, 要取消原来位置的映射
        const MAP_FIXED = 1 << 4;
        /// MAP_ANONYMOUS, 需要fd为-1, offset为0
        const MAP_ANONYMOUS = 1 << 5;
    }
}

#[derive(Debug)]
#[repr(C)]
pub struct Kstat {
    pub st_dev: u64,
    pub st_ino: u64,
    pub st_mode: u32,
    pub st_nlink: u32,
    pub st_uid: u32,
    pub st_gid: u32,
    pub st_rdev: u64,
    pub __pad1: usize,
    pub st_size: u64,
    pub st_blksize: u32,
    pub __pad2: u32,
    pub st_blocks: u64,
    pub st_atim: TimeSpec,
    pub st_mtim: TimeSpec,
    pub st_ctim: TimeSpec,
}

bitflags! {
    /// Open file flags
    pub struct CloneFlags: u32 {
        /// SIGCHLD 是一个信号，在UNIX和类UNIX操作系统中，当一个子进程改变了它的状态时，内核会向其父进程发送这个信号。这个信号可以用来通知父进程子进程已经终止或者停止了。父进程可以采取适当的行动，比如清理资源或者等待子进程的状态。
        /// 以下是SIGCHLD信号的一些常见用途：
        /// 子进程终止：当子进程结束运行时，无论是正常退出还是因为接收到信号而终止，操作系统都会向其父进程发送SIGCHLD信号。
        /// 资源清理：父进程可以处理SIGCHLD信号来执行清理工作，例如释放子进程可能已经使用的资源。
        /// 状态收集：父进程可以通过调用wait()或waitpid()系统调用来获取子进程的终止状态，了解子进程是如何结束的。
        /// 孤儿进程处理：在某些情况下，如果父进程没有适当地处理SIGCHLD信号，子进程可能会变成孤儿进程。孤儿进程最终会被init进程（PID为1的进程）收养，并由init进程来处理其终止。
        /// 避免僵尸进程：通过正确响应SIGCHLD信号，父进程可以避免产生僵尸进程（zombie process）。僵尸进程是已经终止但父进程尚未收集其终止状态的进程。
        /// 默认情况下，SIGCHLD信号的处理方式是忽略，但是开发者可以根据需要设置自定义的信号处理函数来响应这个信号。在多线程程序中，如果需要，也可以将SIGCHLD信号的传递方式设置为线程安全。
        const SIGCHLD = (1 << 4) | (1 << 0);
        ///  CLONE_VM (since Linux 2.0)
        ///  If CLONE_VM is set, the calling process and the child process  run
        ///  in  the same memory space.  In particular, memory writes performed
        ///  by the calling process or by the child process are also visible in
        ///  the other process.  Moreover, any memory mapping or unmapping per‐
        ///  formed with mmap(2) or munmap(2) by the child or  calling  process
        ///  also affects the other process.
        ///  If  CLONE_VM is not set, the child process runs in a separate copy
        ///  of the memory space of the calling process  at  the  time  of  the
        ///  clone  call.   Memory writes or file mappings/unmappings performed
        ///  by one of the processes do not affect the other, as with fork(2).
        const CLONE_VM = 1 << 8;
        const CLONE_FS = 1 << 9;
        const CLONE_FILES = 1 << 10;
        const CLONE_SIGHAND = 1 << 11;
        const CLONE_PIDFD = 1 << 12;
        const CLONE_PTRACE = 1 << 13;
        const CLONE_VFORK = 1 << 14;
        const CLONE_PARENT = 1 << 15;
        const CLONE_THREAD = 1 << 16;
        const CLONE_NEWNS = 1 << 17;
        const CLONE_SYSVSEM = 1 << 18;
        const CLONE_SETTLS = 1 << 19;
        const CLONE_PARENT_SETTID = 1 << 20;
        const CLONE_CHILD_CLEARTID = 1 << 21;
        const CLONE_DETACHED = 1 << 22;
        const CLONE_UNTRACED = 1 << 23;
        const CLONE_CHILD_SETTID = 1 << 24;
        const CLONE_NEWCGROUP = 1 << 25;
        const CLONE_NEWUTS = 1 << 26;
        const CLONE_NEWIPC = 1 << 27;
        const CLONE_NEWUSER = 1 << 28;
        const CLONE_NEWPID = 1 << 29;
        const CLONE_NEWNET = 1 << 30;
        const CLONE_IO = 1 << 31;
    }
}


pub const NSEC_PER_SEC: usize = 10_0000_0000;

pub type SyscallResult<T> = Result<T, SyscallErr>;

// pub const null_str: *const str = core::ptr::null();

#[derive(Debug)]
pub enum SyscallErr {
    EUNDEF = 0,
    EPERM = 1,
    ENOENT = 2,
    ESRCH = 3,
    EINTR = 4,
    EIO = 5,
    ENXIO = 6,
    E2BIG = 7,
    ENOEXEC = 8,
    EBADF = 9,
    ECHILD = 10,
    EAGAIN = 11,
    ENOMEM = 12,
    EACCES = 13,
    EFAULT = 14,
    ENOTBLK = 15,
    EBUSY = 16,
    EEXIST = 17,
    EXDEV = 18,
    ENODEV = 19,
    ENOTDIR = 20,
    EISDIR = 21,
    EINVAL = 22,
    ENFILE = 23,
    EMFILE = 24,
    ENOTTY = 25,
    ETXTBSY = 26,
    EFBIG = 27,
    ENOSPC = 28,
    ESPIPE = 29,
    EROFS = 30,
    EMLINK = 31,
    EPIPE = 32,
    EDOM = 33,
    ERANGE = 34,
    EDEADLK = 35,
    ENAMETOOLONG = 36,
    ENOLCK = 37,
    ENOSYS = 38,
    ENOTEMPTY = 39,
    ELOOP = 40,
    // EWOULDBLOCK = 41,
    ENOMSG = 42,
    EIDRM = 43,
    ECHRNG = 44,
    EL2NSYNC = 45,
    EL3HLT = 46,
    EL3RST = 47,
    ELNRNG = 48,
    EUNATCH = 49,
    ENOCSI = 50,
    EL2HLT = 51,
    EBADE = 52,
    EBADR = 53,
    EXFULL = 54,
    ENOANO = 55,
    EBADRQC = 56,
    EBADSLT = 57,
    // EDEADLOCK = 58,
    EBFONT = 59,
    ENOSTR = 60,
    ENODATA = 61,
    ETIME = 62,
    ENOSR = 63,
    ENONET = 64,
    ENOPKG = 65,
    EREMOTE = 66,
    ENOLINK = 67,
    EADV = 68,
    ESRMNT = 69,
    ECOMM = 70,
    EPROTO = 71,
    EMULTIHOP = 72,
    EDOTDOT = 73,
    EBADMSG = 74,
    EOVERFLOW = 75,
    ENOTUNIQ = 76,
    EBADFD = 77,
    EREMCHG = 78,
    ELIBACC = 79,
    ELIBBAD = 80,
    ELIBSCN = 81,
    ELIBMAX = 82,
    ELIBEXEC = 83,
    EILSEQ = 84,
    ERESTART = 85,
    ESTRPIPE = 86,
    EUSERS = 87,
    ENOTSOCK = 88,
    EDESTADDRREQ = 89,
    EMSGSIZE = 90,
    EPROTOTYPE = 91,
    ENOPROTOOPT = 92,
    EPROTONOSUPPORT = 93,
    ESOCKTNOSUPPORT = 94,
    EOPNOTSUPP = 95,
    EPFNOSUPPORT = 96,
    EAFNOSUPPORT = 97,
    EADDRINUSE = 98,
    EADDRNOTAVAIL = 99,
    ENETDOWN = 100,
    ENETUNREACH = 101,
    ENETRESET = 102,
    ECONNABORTED = 103,
    ECONNRESET = 104,
    ENOBUFS = 105,
    EISCONN = 106,
    ENOTCONN = 107,
    ESHUTDOWN = 108,
    ETOOMANYREFS = 109,
    ETIMEDOUT = 110,
    ECONNREFUSED = 111,
    EHOSTDOWN = 112,
    EHOSTUNREACH = 113,
    EALREADY = 114,
    EINPROGRESS = 115,
    ESTALE = 116,
    EUCLEAN = 117,
    ENOTNAM = 118,
    ENAVAIL = 119,
    EISNAM = 120,
    EREMOTEIO = 121,
    EDQUOT = 122,
    ENOMEDIUM = 123,
    EMEDIUMTYPE = 124,
    ECANCELED = 125,
    ENOKEY = 126,
    EKEYEXPIRED = 127,
    EKEYREVOKED = 128,
    EKEYREJECTED = 129,
    EOWNERDEAD = 130,
    ENOTRECOVERABLE = 131,
    ERFKILL = 132,
    EHWPOISON = 133,
}

impl From<isize> for SyscallErr {
    fn from(value: isize) -> Self {
        let index = value.abs() as u8;
        if index > 133 || index == 41 || index == 58 {
            // return SyscallErr::EUNDEF;
            panic!("undefined errno: {}", index)
        }
        unsafe { mem::transmute(index) }
    }
}

