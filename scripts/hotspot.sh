python3 examples/benchmarks.py \
    --rvdbt-build-dir $(pwd)/build-llvm-$1 \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --riscv32-gcc riscv32-unknown-elf-gcc \
    --rvdbt-jit-merge-ls \
    --rvdbt-llvmaot-hotspot
    # --rvdbt-qcgaot \
    # --libriscv