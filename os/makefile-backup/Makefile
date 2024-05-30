# Makefile args
# - `SBI`: Run with `SBI=<rustsbi/opensbi>` to specify sbi. 
#		By default, AronaOS will run on `opensbi`.
# - `LOG`: `LOG=ERROR/WARN/INFO/DEBUG/TRACE`.
#		By default, AronaOS will run with `ERROR` log level.
# - `KTEST`: Run with `KTEST=false` to disable feature `kernel_tests`. 
#		By default, feature `kernel_tests` is enabled.
# - `TS`: Run with `TS=false` to run rCore tests. 
#		By default, AronaOS will run the OScomp testsuits.

# Building
TARGET := riscv64gc-unknown-none-elf
MODE := release
KERNEL_ELF := target/$(TARGET)/$(MODE)/os
KERNEL_BIN := $(KERNEL_ELF).bin

# Filesystem image
FS_DIR := ../fs-img-src
USER_ELF_SRC := ../user/target/$(TARGET)/$(MODE)
USER_ELF_DST := $(FS_DIR)/rCore-usertests
FS_IMG_ROOT := $(FS_DIR)/OScomp-testsuits
FS_IMG := $(FS_DIR)/fs.img

# Configs
LOG := ERROR
KERNEL_FEATURES := kernel_tests
KTEST :=
TS := true

# BOARD
BOARD := qemu
SBI ?= opensbi
BOOTLOADER := ../bootloader/$(SBI)-$(BOARD).bin

# Building mode argument
ifeq ($(MODE), release)
	MODE_ARG = --release
endif

# Kernel test ability
ifeq ($(KTEST), false)
	KERNEL_FEATURES =
endif

ifeq ($(TS), false)
	FS_IMG_ROOT = $(USER_ELF_DST)
endif

# KERNEL ENTRY
KERNEL_ENTRY_PA := 0x80200000

# Binutils
# OBJDUMP := rust-objdump --arch-name=riscv64
OBJCOPY := rust-objcopy --binary-architecture=riscv64

build: env $(KERNEL_BIN) fs-img 

env:
	(rustup target list | grep "riscv64gc-unknown-none-elf (installed)") || rustup target add $(TARGET)
	cargo install cargo-binutils
	rustup component add rust-src
	rustup component add llvm-tools-preview

$(KERNEL_BIN): kernel
	@$(OBJCOPY) $(KERNEL_ELF) --strip-all -O binary $@

# Build rCore usertests
build-user: 
	@cd ../user && make build TEST=$(TEST)

# Move rCore usertests to rCore-usertests
build-fs-root: build-user
	@rm -rf $(USER_ELF_DST)
	@mkdir -p $(USER_ELF_DST)
	@find $(USER_ELF_SRC) -maxdepth 1 -type f ! -name '*.*' -exec cp {} $(USER_ELF_DST) \;

# Pack FS_IMG_ROOT into FAT32 fs.img
fs-img: build-fs-root
	@mkdir -p $(FS_IMG_ROOT)
	@rm -rf $(FS_IMG)
	@dd if=/dev/zero of=$(FS_IMG) count=62768 bs=1K
#	@dd if=/dev/zero of=$(FS_IMG) count=1363148 bs=1K
	@mkfs.vfat -F 32 $(FS_IMG)
	@mkdir -p mnt
	@sudo mount -t vfat -o user,umask=000,utf8=1 --source $(FS_IMG) --target mnt
	@cp -r $(FS_IMG_ROOT)/* mnt
	@sudo umount -v mnt
	@rm -rf mnt
#	@sudo chmod -R 777 $(FS_DIR)
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

run: run-inner

QEMU_ARGS := -machine virt \
			 -nographic \
			 -bios $(BOOTLOADER) \
			 -device loader,file=$(KERNEL_BIN),addr=$(KERNEL_ENTRY_PA) \
			 -drive file=$(FS_IMG),if=none,format=raw,id=x0 \
			 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0\
			#  -smp 4

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
