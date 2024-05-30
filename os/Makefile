# this the Makefile for OS comp testing

# this the Makefile for OS comp testing

# Building
TARGET := riscv64gc-unknown-none-elf
MODE := release
KERNEL_ELF := target/$(TARGET)/$(MODE)/os
KERNEL_BIN := $(KERNEL_ELF).bin

# Filesystem image
FS_DIR := ../fs-img-src
FS_IMG_ROOT := $(FS_DIR)/OScomp-testsuits
FS_IMG := $(FS_DIR)/fs.img

# Configs
# LOG := ERROR
KERNEL_FEATURES := submit

# Filesystem image
FS_DIR := ../fs-img-src
FS_IMG_ROOT := $(FS_DIR)/OScomp-testsuits
FS_IMG := $(FS_DIR)/fs.img

# Configs
# LOG := ERROR
KERNEL_FEATURES := submit

# BOARD
BOARD := qemu
SBI ?= opensbi
# SBI ?= rustsbi
BOOTLOADER := ../bootloader/$(SBI)-$(BOARD).bin
BOOTLOADER_ELF := ../bootloader/$(SBI)-$(BOARD)

# KERNEL ENTRY
KERNEL_ENTRY_PA := 0x80200000

# Binutils
# OBJDUMP := rust-objdump --arch-name=riscv64
# OBJDUMP := rust-objdump --arch-name=riscv64
OBJCOPY := rust-objcopy --binary-architecture=riscv64

build: env $(KERNEL_BIN)

env:
	(rustup target list | grep "riscv64gc-unknown-none-elf (installed)") || rustup target add $(TARGET)
	cargo install cargo-binutils
	rustup component add rust-src
	rustup component add llvm-tools-preview

$(KERNEL_BIN): kernel
	@$(OBJCOPY) $(KERNEL_ELF) --strip-all -O binary $@

# Pack FS_IMG_ROOT into FAT32 fs.img
# fs-img: 
# 	@mkdir -p $(FS_IMG_ROOT)
# 	@rm -rf $(FS_IMG)
# 	@dd if=/dev/zero of=$(FS_IMG) count=62768 bs=1K
# 	@mkfs.vfat -F 32 $(FS_IMG)
# 	@mkdir -p mnt
# 	@sudo mount -t vfat -o user,umask=000,utf8=1 --source $(FS_IMG) --target mnt
# 	@cp -r $(FS_IMG_ROOT)/* mnt
# 	@sudo umount -v mnt
# 	@rm -rf mnt
# 	@echo "finish pack fs-img"

build-user: 
	@cd ../user && make build

kernel: build-user
	@echo Platform: $(BOARD)
	@cp src/linker-$(BOARD).ld src/linker.ld
	@cargo fmt
#	@LOG=TRACE cargo build --offline --release --features "$(KERNEL_FEATURES)"
	@cargo build --offline --release --features "$(KERNEL_FEATURES)"
#	@cargo build --offline --release
	@rm src/linker.ld

clean:
	@cargo clean

# QEMU_ARGS := -machine virt \
# 			 -nographic \
# 			 -bios $(BOOTLOADER) \
# 			 -device loader,file=$(KERNEL_BIN),addr=$(KERNEL_ENTRY_PA) \
# 			 -drive file=$(FS_IMG),if=none,format=raw,id=x0 \
# 			 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0\
			#  -smp 4

move-bin:
	@cp $(KERNEL_BIN) ../kernel-qemu
#	@cp $(BOOTLOADER) ../sbi-qemu
	@cp $(BOOTLOADER_ELF) ../sbi-qemu

move-cargo:
	@cp -r cargo .cargo

run: move-cargo build move-bin
#	@qemu-system-riscv64 $(QEMU_ARGS)
#	@mv .cargo cargo

.PHONY: run clean
