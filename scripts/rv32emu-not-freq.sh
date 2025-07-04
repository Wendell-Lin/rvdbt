python3 examples/benchmarks.py \
    --rvdbt-build-dir $(pwd)/build-llvm-20 \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --riscv32-gcc riscv32-unknown-elf-gcc \
    --cache-dir spec2017_not_freq \
    --rvdbt-jit-not-freq \
    --benchmark rv32emu
    # --rvdbt-llvmaot \
    # --rvdbt-llvmaot-hotspot \
    # --rvdbt-qcgaot \
    # --libriscv