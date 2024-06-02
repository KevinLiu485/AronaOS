- invariant 
	- 内核和用户并没有共用页表, 只是在用户页表中浅拷贝了内核页表, 所以用户态的程序发生trap特权级的变化时, 不需要切页表
- task
#### 用户传入raw pointer的检查
- [ ] 是否对齐, 是否为null
- [ ] 检查内存访问权限
- [ ] 边界检查, 是否超出有效的内存范围
- [ ] 内存映射检查, 指针是否位于有效的内存映射区域(由虚拟内存自然实现)

#### MemorySet
- [x] MemorySet new_bare() -> 增加new_from_kernel
- [x] 删除map_trampoline
1. impl MemorySet
2. from_elf
3. from_existed_user
- [x] 删除map trapContext内容
- [x] 修改new_kernel
- [x] 修改from_elf
- [x] from_existed_user
*** 
#### MapArea
- [x] map_one
*** 
#### pagetable
- [x] 增加from_global()
      from_global进行的shallow copy, 但是没有page_fault_handler应该是需要deep copy的
- [x] 增加dump便于调试时查看pagetable
*** 
- [x] 删除translated_str
	对于path的解析,直接使用 `c_str_to_string(path: *const u8)`
- [x] 删除translated_byte_buffer
- [x] 删除translated_refmut
- [x] 删除Translated_ref
- [ ] 删除UserBuffer
*** 
#### TaskControlBlockInner
- [x] 结构: trap_cx_ppn -> trap_cx
- [x] get_trap_cx
- [x] new_bare
	- 增加TrapContext的zero_init()
- [x] new 
	- trap_cx_ppn -> trap_cx
- [x] exec  
- [x] fork
	- 为TrapContext添加copy, clone trait
*** 
#### trap
- [x] set_user_trap_entry
- [x] trap_return
- [x] trap.S
***
#### fork
- [x] fork中不要activate child
- [x] UserTaskFuture poll时要activate
	- Titanix是在hart.push_task中call activate
***
#### 调试
- [x] dump 打印pagetable信息
- [ ] current_satp 读取当前设置的页表
- [x] 为PTE实现debug trait
- [x] readable_flags() 为PTEflags实现readable_flags
- [ ] check_mapping() 给定user ptr查看当前address space看是否有mapping, 若有输出ppn和flags
*** 
#### 重要的接口
- [ ]  
*** 
#### UserTaskFuture
- [x] 修改UserTaskFuture的poll函数, 在switch_task的时候切换地址空间
	- 当前task_cx.pid != current_task_cx.pid的时候, 或当前没有user task时
		- 我是在INITPROC初始化时将页表切换为INITPROC的
		- 现在统一在switch_task中切换页表, initproc_test失效
- [ ] 优化: 条件满足时才切换task



- 通过ppn直接获取物理页帧的能力
![[通过ppn直接访问物理页帧的能力.png]]
- 提供手动查页表的能力
	- from_token
	- translate
#todo/vm

# 用户和内核的地址空间
## MapArea
```
pub struct MemorySet {
	page_table: PagetTable
	areas: Vec<MapArea>
}
pub struct MapArea {
    pub vpn_range: VPNRange,
    data_frames: BTreeMap<VirtPageNum, FrameTracker>,
    map_type: MapType,
    map_perm: MapPermission,
}
```
- map
	- map_one 
		- 如果map_type是framed的话, 分配物理页(另一种是Linear)
		- 在pagetable中映射
- unmap 
	- unmap_one
		- data_frames根据vpn remove对应的物理页
		- 在pagetable中清空映射

*** 
## MemorySet
- `new_bare`新建一个空的地址空间
- `from_elf`分析应用的 ELF 文件格式的内容，解析出各数据段并生成对应的地址空间

### 与MemorySet中的MapArea有关的操作
- `insert_framed_area`
- `remove_area_with_start_vpn`
- `push`核心
	- 参数map_area, data是可选的
	- 先在页表中映射map_area的vpn_range, 如果有data, 则copy
#### 在向MemorySet插入MapArea时, 需要维护页表中vpn到pte的映射关系