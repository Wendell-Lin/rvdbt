python3 examples/benchmarks.py \
    --rvdbt-build-dir $(pwd)/build-llvm-20 \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --cache-dir rvdbt \
    --riscv32-gcc riscv32-unknown-linux-gnu-gcc \
    --rvdbt-jit \
    --rvdbt-llvmaot \
    --rvdbt-llvmaot-hotspot \
    --benchmark mibench
    # --rvdbt-qcgaot \
    # --libriscv