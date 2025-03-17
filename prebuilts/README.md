# prebuilts
This directory stores directories of prebuilts from other benchmarks.
The gcc to compile to build is downloaded from [here](https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2025.01.20/riscv32-elf-ubuntu-24.04-gcc-nightly-2025.01.20-nightly.tar.xz).

## rv32emu-workload
Downloaded from [this version](https://github.com/sysprog21/rv32emu-prebuilt/releases/tag/2025.02.12-ELF) of [release of rv32emu prebuilts](https://github.com/sysprog21/rv32emu-prebuilt/releases).

## rv32emu-ia
Since rv32emu prebuilts are built from [this makefile](https://github.com/sysprog21/rv32emu/blob/c3163e5ad5d658e3270269f902cbcb154350221f/mk/artifact.mk#L141), we can rebuild the workload by `rv32ia` to test the rvdbt-supported ISA.
`dhrystone` and `nbench` are built from [ansibench](https://github.com/sysprog21/ansibench)
`primes` and `sha512` are built from [rv8-bench](https://github.com/sysprog21/rv8-bench/tree/master/src)

## rv32emu-i
Same source as above, but built by `rv32i`.
