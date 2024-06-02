# sys_brk()
- [ ] 新增heap_manager.rs管理每个进程的heap
- [x] 新增SimpleRange的update_end method
- [ ] MapArea新增shrink和expand函数用于heap的动态分配
- [ ] MapArea 新增 `new_vpn()` 原来的new是va, new_vpn()传入vpn
- [ ] VPN实现`Sub`trait, 所得的差值为两个对应虚拟地址所差的page num
- sys_mmap
	- [ ] sys_mmap增加get_unmapped_area, 返回VPNRange
	- [ ] check_vpn_range_conflict, 为VPNRange实现is_overlap()

- 将heap放在user stack之上, heap的虚拟空间是连续的, 且是运行时可拓展的, 单独放在memory_space中
- 专门
- 用户态的内存空间分布
![[Pasted image 20240423195532.png]]

$Titanix$
1. 特殊处理brk为0
2. `if`brk大于当前进程的heap.end(增大heap空间)
	1. 检查新的heap_area有没有与现有的area中的区域冲突, 若冲突返回`Err(SyscallErr::ENOMEM)`
		`check_vpn_range_conflict`
3. `else` brk小于当前进程的heap.end(缩减heap空间)
	1. 若brk < heap.start 返回Err
$FTL$
![[FTL_brk.png]]
$UMI$ 

# mmap()
- addr is Null, kernel choose the address(页对齐) at which to create the mapping 
- addr is not Null, takes as a hit, pick a nearby page boundary(前提是addr处没有mapping), 但是会大于/proc/sys/vm/mmap_min_addr的值(wsl中为65536)
- addr仅仅是作为提示
- 文件映射: using `len` bytes start at offset `offset` in the file referred to by the `fd`
- 对参数的描述及限制: 
	- `offset`必须是page size的倍数
	- `prot`是memory proctection of the mapping 
	- `flags` 
- 返回值
	- a pointer to the mapped area on success
	- MAP_FAILED -1 
