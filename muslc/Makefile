NPROC = 8
MUSL_PREFIX = riscv64-unknown-linux-musl
MUSL_GCC = $(MUSL_PREFIX)-gcc
MUSL_STRIP = $(MUSL_PREFIX)-strip
SRCS = $(wildcard src/*.c)
BINS = $(patsubst src/%.c,bin/%,$(SRCS))

build: clear-bin $(BINS)

bin/%: src/%.c
	@$(MUSL_GCC) -static -o $@ $<
	@$(MUSL_STRIP) $@

clear-bin:
	@rm -rf bin
	@mkdir -p bin