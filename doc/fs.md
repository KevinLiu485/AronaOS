# File System
## 总体设计
AronaOS 的文件系统分为 5 个层次， 由底向上分别是：Block Device -> Block Cache -> File -> Inode -> OSInode。  
对于 FAT32 文件系统的结构，以下不再赘述，详见[微软的官方文档](https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/fatgen103.doc)。  
由于具体实现细节过于繁杂，代码不方便呈现，以下将以文字说明为主。  
说实话，现阶段的 FS 的实现依然以“能跑就行”为原则，兼顾整体框架的设计，为后续优化预留空间。故几乎没有性能方面的考虑。
## FAT32 概览
虽然嘴上说“不再赘述”之类的，但是还是有必要向各位小可爱在读 Microsoft 的文档之前介绍一下 FAT32 的整体构思。  
初始化 FAT32 要先读BootSector（0th sector），也就是块设备（磁盘）的Block 0。为了兼容性，FAT32 的 sector size 和块设备的 block size 一般都是 512 bytes。BootSector 里面有大量 FAT32 最基础的信息（如 sector size，cluster size，FSINFO sector id，
## Block Device
Block Device 层主要由外部库 virtio_drivers 实现，其主要功能是提供对块设备的读写操作。Block Device 层的 trait 定义如下：
```rust
pub trait BlockDevice: Send + Sync + Any {
    ///Read data form block to buffer
    fn read_block(&self, block_id: usize, buf: &mut [u8]);
    ///Write data from buffer to block
    fn write_block(&self, block_id: usize, buf: &[u8]);
}
```
## Block Cache
Block Cache 层的主要功能是提供对块设备的缓存操作，目前采用最简单且相对高效的缓存所有读写操作块和随机替换策略。用 modified 字段来标识脏块以减少写回次数。由于前期没有 benchmark ，将在后续应用LRU。
## File
File 层是唯一与 File Allocate Table（FAT）打交道的层次，负责磁盘文件的读写，size 增减，cluster 的分配和释放。File struct 内部会对文件的 cluster ，也就是文件对应的 sector id 集合进行缓存，以减少对 FAT 的访问次数。
## Inode
Inode 是对 File 的进一步封装，Inode 的父子关系树是对文件树的抽象。由于文件较少，AronaOS 将在内存中缓存访问过的所有 Inode ，并且采用懒加载子文件的策略，减少文件系统的启动工作量。  
Inode 还将保存文件的所有盘上元数据（如名称，时间，大小），以及额外数据（如绝对路径），方便 OS 取用。
Inode trait 作为 VFS 的文件抽象，定义了 OS 对文件的操作接口，使得兼容不同文件系统成为可能，只要其实现 Inode trait 即可。
## OSInode 
OSInode 则是对 Inode 的进一步封装，其对应进程 File Descriptor Table （FDTable）中的文件描述符。  
OSInode 是实现 Unix FDTable 的“万物皆文件”抽象的垫脚石，兼容 stdio，pipe，socket，inode 等多种抽象。也正因如此，对于文件系统的系统调用主要以 Inode 的方法为主，OSInode 的方法过于泛化。