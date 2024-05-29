# README
# Makefile args
# - `SBI`: Run with `SBI=<rustsbi/opensbi>` to specify sbi. By default, AronaOS will run on `opensbi`.
# - `LOG`: See [logging instructions](#logging-instructions).
# - `KTEST`: See [Kernel testing instructions](#kernel-testing-instructions).

# Building
TARGET := riscv64gc-unknown-none-elf
MODE := release
KERNEL_ELF := target/$(TARGET)/$(MODE)/os
KERNEL_BIN := $(KERNEL_ELF).bin
DISASM_TMP := target/$(TARGET)/$(MODE)/asm
USER_ELF_SRC := ../user/target/$(TARGET)/$(MODE)
FS_IMG_SRC := ../fs-img-src
FS_IMG_ROOT := ../fs-img-src/root
FS_IMG := $(FS_IMG_SRC)/fs.img
APPS := ../user/src/bin/*
LOG := ERROR
KERNEL_FEATURES := kernel_tests
KTEST :=

# BOARD
BOARD := qemu
SBI ?= opensbi
BOOTLOADER := ../bootloader/$(SBI)-$(BOARD).bin

# Building mode argument
ifeq ($(MODE), release)
	MODE_ARG := --release
endif

# kernel test ability
ifeq ($(KTEST), false)
	KERNEL_FEATURES :=
endif

# KERNEL ENTRY
KERNEL_ENTRY_PA := 0x80200000

# Binutils
OBJDUMP := rust-objdump --arch-name=riscv64
OBJCOPY := rust-objcopy --binary-architecture=riscv64

# Disassembly
DISASM ?= -x

# Run usertests or usershell
TEST ?=

build: env $(KERNEL_BIN) fs-img 

env:
	(rustup target list | grep "riscv64gc-unknown-none-elf (installed)") || rustup target add $(TARGET)
	cargo install cargo-binutils
	rustup component add rust-src
	rustup component add llvm-tools-preview

$(KERNEL_BIN): kernel
	@$(OBJCOPY) $(KERNEL_ELF) --strip-all -O binary $@

# build rCore usertests
build-user: 
	@cd ../user && make build TEST=$(TEST)

# move rCore usertests to root
build-fs-root: build-user
#	@rm -rf $(FS_IMG_ROOT)
	@mkdir -p $(FS_IMG_ROOT)
	@find $(USER_ELF_SRC) -maxdepth 1 -type f ! -name '*.*' -exec cp {} $(FS_IMG_ROOT) \;

# pack FS_IMG_ROOT into FAT32 fs.img
fs-img: #build-fs-root
	@rm -rf $(FS_IMG)
#	@mkdir -p $(FS_IMG_SRC)
	@dd if=/dev/zero of=$(FS_IMG) count=62768 bs=1K
#	@dd if=/dev/zero of=$(FS_IMG) count=1363148 bs=1K
	@mkfs.vfat -F 32 $(FS_IMG)
	@mkdir -p mnt
	@sudo mount -t vfat -o user,umask=000,utf8=1 --source $(FS_IMG) --target mnt
	@cp -r $(FS_IMG_ROOT)/* mnt
	@sudo umount -v mnt
	@rm -rf mnt
#	@sudo chmod -R 777 $(FS_IMG_SRC)
	@echo "finish pack fs-img"

kernel:
	@echo Platform: $(BOARD)
	@cp src/linker-$(BOARD).ld src/linker.ld
	@cargo fmt
ifeq ($(KERNEL_FEATURES), )
	LOG=$(LOG) cargo build --release
else 
	LOG=$(LOG) cargo build --release --features "$(KERNEL_FEATURES)"
endif
	@rm src/linker.ld

clean:
	@cargo clean

disasm: kernel
	@$(OBJDUMP) $(DISASM) $(KERNEL_ELF) | less

disasm-vim: kernel
	@$(OBJDUMP) $(DISASM) $(KERNEL_ELF) > $(DISASM_TMP)
	@vim $(DISASM_TMP)
	@rm $(DISASM_TMP)

run: run-inner

QEMU_ARGS := -machine virt \
			 -nographic \
			 -bios $(BOOTLOADER) \
			 -device loader,file=$(KERNEL_BIN),addr=$(KERNEL_ENTRY_PA) \
			 -drive file=$(FS_IMG),if=none,format=raw,id=x0 \
			 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0

run-inner: build
	@qemu-system-riscv64 $(QEMU_ARGS)

debug: build
	@tmux new-session -d \
		"qemu-system-riscv64 $(QEMU_ARGS) -s -S" && \
		tmux split-window -h "riscv64-unknown-elf-gdb -ex 'file $(KERNEL_ELF)' -ex 'set arch riscv:rv64' -ex 'target remote localhost:1234'" && \
		tmux -2 attach-session -d


gdbserver: build
	@qemu-system-riscv64 $(QEMU_ARGS) -s -S

gdbclient:
	@riscv64-unknown-elf-gdb -ex 'file $(KERNEL_ELF)' -ex 'set arch riscv:rv64' -ex 'target remote localhost:1234'

run-only: 
	@qemu-system-riscv64 $(QEMU_ARGS)

.PHONY: build env kernel clean disasm disasm-vim run-inner fs-img gdbserver gdbclient run-only
