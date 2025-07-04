python3 examples/benchmarks_nofreq.py \
    --rvdbt-build-dir $(pwd)/build-llvm-20 \
    --libriscv-build-dir /home/wendell/libriscv/emulator \
    --prebuilts $(pwd)/prebuilts \
    --riscv32-gcc riscv32-unknown-elf-gcc \
    --cache-dir spec2017_no_freq \
    --rvdbt-jit-not-freq \
    --benchmark SPEC2017Rate
    # --rvdbt-llvmaot \
    # --rvdbt-llvmaot-hotspot \
    # --rvdbt-qcgaot \
    # --libriscv