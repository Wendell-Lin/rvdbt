python3 examples/benchmarks.py \
    --rvdbt-build-dir $(pwd)/build-llvm-$1 \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --riscv32-gcc riscv32-unknown-elf-gcc \
    --rvdbt-jit \
    --rvdbt-llvmaot-1000 \
    --rvdbt-llvmaot \
    --benchmark rv32emu \
    --objective test