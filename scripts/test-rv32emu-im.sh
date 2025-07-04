python3 examples/benchmarks.py \
    --rvdbt-build-dir $(pwd)/build-llvm-20 \
    --cache-dir rv32emu-no-prop \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --riscv32-gcc riscv32-unknown-linux-gnu-gcc \
    --no-qemu \
    --rvdbt-jit \
    --rvdbt-llvmaot \
    --rvdbt-llvmaot-hotspot \
    --rvdbt-llvmaot-noprop \
    --benchmark rv32emu \
    # --libriscv \
    # --objective test