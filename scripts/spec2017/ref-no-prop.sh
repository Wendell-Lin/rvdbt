python3 examples/benchmarks.py \
    --rvdbt-build-dir $(pwd)/build-llvm-20 \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --riscv32-gcc riscv32-unknown-elf-gcc \
    --cache-dir spec2017-ref-tb-noprop \
    --no-qemu \
    --rvdbt-llvmaot-hotspot \
    --rvdbt-llvmaot-noprop \
    --benchmark SPEC2017Rate
    # --rvdbt-jit \
    # --rvdbt-llvmaot \
    # --rvdbt-qcgaot \
    # --libriscv