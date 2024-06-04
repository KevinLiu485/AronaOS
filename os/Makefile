# Makefile args:
# - `LOG`: `LOG=ERROR/WARN/INFO/DEBUG/TRACE`.
#		By default, AronaOS will run with `ERROR` log level.
# - `SUBMIT`: Run with `SUBMIT=true` when submitting.
# - `KTEST`: Run with `KTEST=true` to enable kernel tests.
# - `SMP`: Run with `SMP=<corenum>` to specify the number of CPUs.
#		By default, AronaOS will run with 2 CPUs.	
# - `SBI`: Run with `SBI=<rustsbi/opensbi>` to specify sbi.
#		By default, AronaOS will run on `opensbi`.
# - `MODE`: Run with `Mode=debug` to build in debug mode.
#  		By default, AronaOS will run in release mode.

# Building
TARGET := riscv64gc-unknown-none-elf
MODE := release
MODE_ARG :=
# FEATURE_ARG :=
KERNEL_ELF := target/$(TARGET)/$(MODE)/os
KERNEL_BIN := $(KERNEL_ELF).bin

# Filesystem image
FS_DIR := ../fs-img-src
FS_IMG_ROOT := $(FS_DIR)/root
FS_IMG := $(FS_DIR)/fs.img
# FS_IMG := ../sdcard.img

# Configs
LOG := ERROR
# FEATURES := 
SUBMIT :=
KTEST :=
SMP := 2

# BOARD
BOARD := qemu
SBI ?= opensbi
BOOTLOADER := ../bootloader/$(SBI)-$(BOARD).bin
BOOTLOADER_ELF := ../bootloader/$(SBI)-$(BOARD)

# Binutils
# OBJDUMP := rust-objdump --arch-name=riscv64
OBJCOPY := rust-objcopy --binary-architecture=riscv64

ifeq ($(MODE), release)
	MODE_ARG := --release
endif

# ifeq ($(SUBMIT), true)
# 	FEATURE_ARG += submit
# endif

# ifeq ($(KTEST), true)
# 	FEATURE_ARG += kernel_tests
# endif

# build: env $(KERNEL_BIN)
build: $(KERNEL_BIN) fs-img

env:
	(rustup target list | grep "riscv64gc-unknown-none-elf (installed)") || rustup target add $(TARGET)
	cargo install cargo-binutils
	rustup component add rust-src
	rustup component add llvm-tools-preview

$(KERNEL_BIN): kernel
	@$(OBJCOPY) $(KERNEL_ELF) --strip-all -O binary $@

# Pack FS_IMG_ROOT into FAT32 fs.img
fs-img: 
	@mkdir -p $(FS_IMG_ROOT)
	@rm -rf $(FS_IMG)
	@dd if=/dev/zero of=$(FS_IMG) count=62768 bs=1K
	@mkfs.vfat -F 32 $(FS_IMG)
	@mkdir -p mnt
	@sudo mount -t vfat -o user,umask=000,utf8=1 --source $(FS_IMG) --target mnt
	@cp -r $(FS_IMG_ROOT)/* mnt
	@sudo umount -v mnt
	@rm -rf mnt
	@echo "finish pack fs-img"

build-user: 
ifeq ($(SUBMIT), true)
	@cd ../user && make build SUBMIT=true
else 
	@cd ../user && make build
endif

kernel: build-user
	@echo Platform: $(BOARD)
	@cp src/linker-$(BOARD).ld src/linker.ld
	@cargo fmt
ifeq ($(SUBMIT), true)
	@cargo build --offline --release --features "submit"
else ifeq ($(KTEST), true)
	@LOG=$(LOG) cargo build $(MODE_ARG) --features "kernel_tests"
else
	@LOG=$(LOG) cargo build $(MODE_ARG)
endif
	@rm src/linker.ld

clean:
	@cargo clean

# QEMU_ARGS := -machine virt \
# 			 -nographic \
# 			 -bios $(BOOTLOADER) \
# 			 -device loader,file=$(KERNEL_BIN),addr=$(KERNEL_ENTRY_PA) \
# 			 -drive file=$(FS_IMG),if=none,format=raw,id=x0 \
# 			 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0\
# 			 -smp 4

QEMU_ARGS := -machine virt \
			 -kernel $(KERNEL_BIN) \
			 -m 128M -nographic \
			 -smp $(SMP) \
			 -bios $(BOOTLOADER_ELF) \
			 -drive file=$(FS_IMG),if=none,format=raw,id=x0 \
			 -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 \
			 -device virtio-net-device,netdev=net -netdev user,id=net
			
move-bin:
	@cp $(KERNEL_BIN) ../kernel-qemu
#	@cp $(BOOTLOADER) ../sbi-qemu
	@cp $(BOOTLOADER_ELF) ../sbi-qemu

move-cargo:
	@rm -rf .cargo
	@cp -r cargo .cargo

submit: move-cargo build move-bin

run: env build 
	@qemu-system-riscv64 $(QEMU_ARGS)

run-only:
	@qemu-system-riscv64 $(QEMU_ARGS)

gdbserver: env build
	@qemu-system-riscv64 $(QEMU_ARGS) -s -S

.PHONY: run run-only submit gdbserver clean
