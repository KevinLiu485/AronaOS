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
# - `IMG`: Run with `IMG=fs.img` to specify the filesystem image, without packing img.
#		By default, AronaOS will first pack then run with `$(FS_DIR)/fs.img`.
# - `FS`: Run with `FS=fat32` to specify the filesystem type.
# 		By default, AronaOS will run with ext4.

# Building
TARGET := riscv64gc-unknown-none-elf
MODE := release
MODE_ARG :=
FEATURE_ARGS :=
KERNEL_ELF := target/$(TARGET)/$(MODE)/os
KERNEL_BIN := $(KERNEL_ELF).bin

# Filesystem image
FS_DIR := ../fs-img-src
# FS_IMG_ROOT := $(FS_DIR)/splice
FS_IMG_ROOT := $(FS_DIR)/root-2024-part
FS_IMG := $(FS_DIR)/fs.img

# Configs
LOG := ERROR
SUBMIT :=
KTEST :=
SMP := 2
IMG := 
MEM_SIZE = 128M
FS := ext4

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

ifeq ($(SUBMIT), true)
	FEATURE_ARGS += submit
endif

ifeq ($(KTEST), true)
	FEATURE_ARGS += kernel_tests
endif

ifeq ($(FS), ext4)
	FEATURE_ARGS += ext4
else ifeq ($(FS), ext4-ramfs)
	FEATURE_ARGS += ext4-ramfs
else ifeq ($(FS), fat32)
	FEATURE_ARGS += fat32
endif

# build: env $(KERNEL_BIN)
ifeq ($(SUBMIT), true)
build: $(KERNEL_BIN)
else
ifeq ($(IMG), )
build: $(KERNEL_BIN) fs-img
else
FS_IMG = $(IMG)
build: $(KERNEL_BIN)
endif
endif

env:
	(rustup target list | grep "riscv64gc-unknown-none-elf (installed)") || rustup target add $(TARGET)
	cargo install cargo-binutils
	rustup component add rust-src
	rustup component add llvm-tools-preview

$(KERNEL_BIN): kernel
	@$(OBJCOPY) $(KERNEL_ELF) --strip-all -O binary $@

# Pack FS_IMG_ROOT into fs.img
#fs-img: build-muslc
fs-img:
	@mkdir -p $(FS_IMG_ROOT)
	@rm -rf $(FS_IMG)
	@dd if=/dev/zero of=$(FS_IMG) count=62768 bs=1K
#	@dd if=/dev/zero of=$(FS_IMG) count=2048 bs=1M
ifeq ($(FS), ext4)
	@mkfs.ext4 $(FS_IMG)
	@mkdir -p mnt
	@sudo mount -t ext4 -o loop $(FS_IMG) mnt
else
	@mkfs.vfat -F 32 $(FS_IMG)
	@mkdir -p mnt
	@sudo mount -t vfat -o user,umask=000,utf8=1 --source $(FS_IMG) --target mnt
endif
	@sudo cp -r $(FS_IMG_ROOT)/* mnt
	@sudo umount -v mnt
	@rm -rf mnt
	@echo "finish pack fs-img"

build-user: 
	@cd ../user && make build SUBMIT=$(SUBMIT)

build-muslc:
	@cd ../muslc && make build
	@rm -rf $(FS_IMG_ROOT)/muslc
	@mkdir -p $(FS_IMG_ROOT)/muslc
	@cp -r ../muslc/bin/* $(FS_IMG_ROOT)/muslc

kernel: build-user
	@echo Platform: $(BOARD)
	@cp src/linker-$(BOARD).ld src/linker.ld
	@cargo fmt
ifeq ($(SUBMIT), true)
	cargo build --offline --release --features "$(FEATURE_ARGS)"
else ifeq ($(FEATURE_ARGS), )
	LOG=$(LOG) cargo build $(MODE_ARG)
else 
	LOG=$(LOG) cargo build $(MODE_ARG) --features "$(FEATURE_ARGS)"
#	cargo build $(MODE_ARG) --features "$(FEATURE_ARGS)"
endif
	@rm src/linker.ld

clean:
	@cargo clean

QEMU_ARGS := -machine virt \
			 -kernel $(KERNEL_BIN) \
			 -m $(MEM_SIZE) -nographic \
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

run: move-cargo env build 
	qemu-system-riscv64 $(QEMU_ARGS)

last:
	qemu-system-riscv64 $(QEMU_ARGS)

trace: 
	$(MAKE) run LOG=TRACE

gdbserver: move-cargo env build
	qemu-system-riscv64 $(QEMU_ARGS) -s -S

.PHONY: run last submit gdbserver clean trace
