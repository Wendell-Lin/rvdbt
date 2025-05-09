import csv
import optparse
import os
import subprocess
import filecmp
import sys
import time
from typing import Type
import glob


class BaseExec:
    def __init__(self):
        self.name = None
        self.root = None
        self.args = None
        self.rc = None
        self.out = None
        self.err = None
        self.time = None
 
    def setup(self, root, cmd):
        self.root = root
        self.args = cmd
    
    def print_dir(self):
        print(f"Under {self.root}")

    def run(self):
        pass


class QEMUExec(BaseExec):
    bin_path = "qemu-riscv32"

    def __init__(self):
        self.name = "qemu"

    def run(self):
        pargs = [QEMUExec.bin_path] + self.args
        self.print_dir()
        print(f"{" ".join(pargs)}")
        timer = time.time()
        p = subprocess.Popen(pargs, cwd=self.root,
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.out, self.err = p.communicate()
        timer = time.time() - timer
        self.rc = p.returncode
        self.time = timer
        
        # Store output if ofile is set
        if hasattr(self, 'ofile') and self.ofile:
            with open(self.ofile, 'wb') as f:
                f.write(self.out)

class LIBRISCVExec(BaseExec):
    build_dir = None

    def __init__(self, mode):
        super().__init__()
        # mode: "interp" (interpreter) or "bt" (binary translation)
        self.name = f"rvlinux-{mode}"
        self.mode = mode

    def setup(self, root, cmd):
        super().setup(root, cmd)
        # No setup needed for interpreter mode
        if self.mode == "interp":
            self.setup_ok = True
            return
        
        # Setup environment for binary translation mode
        env = os.environ.copy()
        
        # Run setup compilation if needed
        pargs = [LIBRISCVExec.build_dir + "/rvlinux", self.root + "/" + self.args[0]]
        self.bin_path = LIBRISCVExec.build_dir + "/rvlinux"
        p = subprocess.Popen(pargs, cwd=LIBRISCVExec.build_dir,
                           env=env,
                           stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE)
        self.out, self.err = p.communicate()
        self.rc = p.returncode
        self.setup_ok = self.rc == 0

    def run(self):
        pargs = [LIBRISCVExec.build_dir + "/rvlinux"] + self.args
        self.print_dir()
        print(f"{" ".join(pargs)}")
        env = os.environ.copy()
        
        if self.mode == "interp":
            pargs.append("--no-translate")
        
        timer = time.time()
        p = subprocess.Popen(pargs, cwd=self.root,
                           env=env,
                           stdout=subprocess.PIPE,
                           stderr=subprocess.PIPE)
        self.out, self.err = p.communicate()
        timer = time.time() - timer
        self.rc = p.returncode
        self.time = timer

class RVDBTExec(BaseExec):
    build_dir = None

    def __init__(self, aot, llvm=False, hotspot_threshold=0, jit_merge_ls=False, llvmopt=False, brcc=True):
        super().__init__()
        self.name = "rvdbt-" + ("jit", ("qcgaot", "llvmaot")[llvm])[aot] + ("", "-opt")[llvmopt]
        if jit_merge_ls:
            self.name += "-merge-ls"
        if hotspot_threshold > 0:
            self.name += "-hotspot-" + str(hotspot_threshold)
        self.aot = aot
        self.llvm = llvm
        self.hotspot_threshold = hotspot_threshold
        self.jit_merge_ls = jit_merge_ls
        self.llvmopt = llvmopt
        self.brcc = brcc
    def setup(self, root, cmd):
        super().setup(root, cmd)
        if not self.aot:
            self.setup_ok = True
            return
        # make sure dbtcache exists
        pargs = [RVDBTExec.build_dir + "/bin/elfaot",
                 "--cache=dbtcache",
                 "--llvm=" + ("off", "on")[self.llvm],
                 "--threshold=" + str(self.hotspot_threshold),
                 "--elf=" + self.root + "/" + self.args[0],
                 "--mgdump=" + RVDBTExec.build_dir + "/logs",
                 "--llvmopt=" + ("off", "on")[self.llvmopt]]
        p = subprocess.Popen(pargs, cwd=RVDBTExec.build_dir,
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.out, self.err = p.communicate()
        self.rc = p.returncode
        self.setup_ok = self.rc == 0

    def run(self):
        if not self.setup_ok:
            return
        pargs = [RVDBTExec.build_dir + "/bin/elfrun",
                 "--cache=dbtcache",
                 "--fsroot=" + self.root]
        if self.aot:
            pargs += ["--logs=aot"]
        pargs += ["--brcc=" + ("off", "on")[self.brcc]]
        pargs += ["--aot=" + ("off", "on")[self.aot]]
        pargs += ["--merge-ls=" + ("off", "on")[self.jit_merge_ls]]
        pargs += ["--"] + self.args
        self.print_dir()
        print(f"{" ".join(pargs)}")
        timer = time.time()
        p = subprocess.Popen(pargs, cwd=RVDBTExec.build_dir,
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        self.out, self.err = p.communicate()
        timer = time.time() - timer
        self.rc = p.returncode
        self.time = timer


class Benchmark:
    def __init__(self, root, args, cmp_out=False, ofile=None, name=None):
        self.name = name
        if self.name is None:
            self.name = args[0]
        self.root = root
        self.args = args
        self.cmp_out = cmp_out  
        self.ofile = self.root + "/" + ofile if ofile is not None else None

    def get_ofile(self, exec):
        assert (self.ofile is not None)
        return self.ofile + "." + exec.name
    
    def set_ofile(self, ofile):
        self.ofile = self.root + "/" + ofile

    def launch_with(self, exec: BaseExec):
        exec.setup(self.root, self.args)
        if self.ofile:
            exec.ofile = self.ofile
        if "rvdbt-llvmaot" in exec.name: # if setup with elfaot and success, then change the modulegraph.gv into name
            print(f"Renaming modulegraph.gv `to {self.name}.gv")
            os.rename(RVDBTExec.build_dir + "/logs/modulegraph.gv", RVDBTExec.build_dir + "/logs/" + self.name + "_" + exec.name + ".gv")
        exec.run()
        if self.ofile is not None and os.path.isfile(self.ofile):
            os.rename(self.ofile, self.get_ofile(exec))
        return exec

    def verify(self, exec: BaseExec, exec_ref: BaseExec):
        if exec_ref.rc != exec.rc:
            return "stdout"

        if self.ofile is not None:
            if not os.path.isfile(self.get_ofile(exec)):
                return "outfile-missing"
            if not filecmp.cmp(self.get_ofile(exec_ref), self.get_ofile(exec)):
                return "outfile-diff"

        return None

    class Result:
        def __init__(self, res, time, score, output=None):
            self.res = res
            self.time = time
            self.score = score

    def result(self, exec: BaseExec, exec_ref: BaseExec = None) -> Result:
        is_ref = ((exec == exec_ref) or (exec_ref is None))
        if is_ref:
            res = "ok"
        else:
            res = self.verify(exec, exec_ref)
            res = (res, "ok")[res is None]
        res += ":" + str(exec.rc)
        score = None
        if exec.time is not None:
            score = f"{exec_ref.time / exec.time:.3f}"
        return Benchmark.Result(res, exec.time, score)


# mibench.automotive
def GetBenchmarks_Automotive(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/automotive")
    # b.append(Benchmark(root + "/basicmath", ["basicmath_small"], True))
    b.append(Benchmark(root + "/basicmath", ["basicmath_large"]))
    b.append(Benchmark(root + "/bitcount", ["bitcnts", "10000000"]))
    # b.append(Benchmark(root + "/qsort",
    #         ["qsort_small", "input_small.dat"], True))
    # b.append(Benchmark(root + "/qsort",
    #          ["qsort_large", "input_large.dat"], True))
    # b.append(Benchmark(root + "/susan",
    #          ["susan", "input_large.pgm", "_bout", "-s"], False, "_bout"))
    return b


# mibench.network
def GetBenchmarks_Network(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/network")
    # b.append(Benchmark(root + "/dijkstra",
    #        ["dijkstra_small", "input.dat"], True))
    b.append(Benchmark(root + "/dijkstra",
             ["dijkstra_large", "input.dat"], True))
    return b


# mibench.security
def GetBenchmarks_Security(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/security")
    b.append(Benchmark(root + "/blowfish",
             ["bf", "e", "myinput.asc", "_bout", "1234567890abcdeffedcba0987654321"], False, "_bout"))
    return b


# mibench.telecomm
def GetBenchmarks_Telecomm(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/telecomm")
    b.append(Benchmark(root + "/FFT", ["fft", "8", "32768"], True))
    b.append(Benchmark(root + "/gsm",
             ["toast", "-fps", "-c", "large.au"], True))
    return b


# coremark
def GetBenchmarks_Coremark(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/coremark")
    b.append(Benchmark(
        root + "/", ["coremark.exe", "0x0", "0x0", "0x66", "15000", "7", "1", "2000"]))
    return b

# rv32emu workload
def GetBenchmarks_RV32EMU(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/rv32emu-workload")
    # b.append(Benchmark(root + "/", ["nbench", "0"], name="numeric-sort"))
    # b.append(Benchmark(root + "/", ["nbench", "1"], name="string-sort"))
    # b.append(Benchmark(root + "/", ["nbench", "2"], name="bitfield"))
    # b.append(Benchmark(root + "/", ["nbench", "3"], name="emfloat"))
    # b.append(Benchmark(root + "/", ["nbench", "5"], name="assignment"))
    # b.append(Benchmark(root + "/", ["nbench", "6"], name="IDEA"))
    # b.append(Benchmark(root + "/", ["nbench", "7"], name="Huffman"))
    b.append(Benchmark(root + "/", ["dhrystone"]))
    # b.append(Benchmark(root + "/", ["primes"], cmp_out=True))
    b.append(Benchmark(root + "/", ["sha512"]))
    return b

# rv32emu workload, but compiled with rv32ia
def GetBenchmarks_RV32IA(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/rv32ia")
    # b.append(Benchmark(root + "/", ["nbench", "0"], name="numeric-sort"))
    # b.append(Benchmark(root + "/", ["nbench", "1"], name="string-sort"))
    # b.append(Benchmark(root + "/", ["nbench", "2"], name="bitfield"))
    # b.append(Benchmark(root + "/", ["nbench", "3"], name="emfloat"))
    # b.append(Benchmark(root + "/", ["nbench", "5"], name="assignment"))
    # b.append(Benchmark(root + "/", ["nbench", "6"], name="IDEA"))
    # b.append(Benchmark(root + "/", ["nbench", "7"], name="Huffman"))
    # b.append(Benchmark(root + "/", ["dhrystone"]))
    # b.append(Benchmark(root + "/", ["primes"], cmp_out=True))
    b.append(Benchmark(root + "/", ["sha512"], cmp_out=True))
    return b

def GetBenchmarks_RV32I(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/rv32emu-i")
    # b.append(Benchmark(root + "/", ["nbench", "0"], name="numeric-sort"))
    # b.append(Benchmark(root + "/", ["nbench", "1"], name="string-sort"))
    # b.append(Benchmark(root + "/", ["nbench", "2"], name="bitfield"))
    # b.append(Benchmark(root + "/", ["nbench", "3"], name="emfloat"))
    # b.append(Benchmark(root + "/", ["nbench", "5"], name="assignment"))
    # b.append(Benchmark(root + "/", ["nbench", "6"], name="IDEA"))
    # b.append(Benchmark(root + "/", ["nbench", "7"], name="Huffman"))
    b.append(Benchmark(root + "/", ["dhrystone"]))
    # b.append(Benchmark(root + "/", ["primes"], cmp_out=True))
    b.append(Benchmark(root + "/", ["sha512"], cmp_out=True))
    return b

def GetBenchmarks(opts):
    benchmarks: list[Benchmark] = []
    # benchmarks += GetBenchmarks_Automotive(opts.prebuilts_dir)
    # benchmarks += GetBenchmarks_Network(opts.prebuilts_dir)
    # benchmarks += GetBenchmarks_Security(opts.prebuilts_dir)
    # benchmarks += GetBenchmarks_Telecomm(opts.prebuilts_dir)
    # benchmarks += GetBenchmarks_Coremark(opts.prebuilts_dir)
    benchmarks += GetBenchmarks_RV32EMU(opts.prebuilts_dir)
    # benchmarks += GetBenchmarks_RV32I(opts.prebuilts_dir)
    # benchmarks += GetBenchmarks_RV32IA(opts.prebuilts_dir)
    return benchmarks


def compile_benchmark(gcc_path: str, root_dir: str, target: str) -> bool:
    """
    Compile all source files in the benchmark directory.
    
    Args:
        gcc_path: Path to RISC-V GCC
        root_dir: Directory containing source files
        target: Output binary name
    Returns:
        bool: True if compilation succeeded
    """
    # Common flags including standard headers
    # TODO: we should compile before benchmark here, so maybe just check exist
    #       then run and remove the nasty code below.
    if os.path.exists(f"{root_dir}/{target}"):
        print(f"Executable of workload {root_dir}/{target} already exists, skip compiling and jump into execution")
        return True
    # Temp avoid
    common_flags = "-Wno-implicit-int -Wno-implicit-function-declaration"
    # temporarily just do not compile here to avoid mistracking compilation flags
    if os.path.exists(f"{root_dir}/Makefile"):
        print(f"Found Makefile in {root_dir}, using make with RISC-V GCC")
        # Read and modify Makefile content
        with open(f"{root_dir}/Makefile", 'r') as f:
            makefile_content = f.read()
        
        # Create a temporary Makefile with gcc replaced and added flags
        # if using CC=gcc, only replace gcc
        if 'riscv32' not in makefile_content:
            makefile_content = makefile_content.replace('gcc', f'{gcc_path} {common_flags}')
        with open(f"{root_dir}/Makefile.tmp", 'w') as f:
            f.write(makefile_content)
        
        # Use the temporary Makefile
        cmd: str = f"cd {root_dir} && make -f Makefile.tmp"
        print(f"Compiling command: {cmd}")
        ret = os.system(cmd)
        
        # Clean up
        # os.remove(f"{root_dir}/Makefile.tmp")
        
        if ret != 0:
            print(f"Make failed with return code {ret}")
            return False
        return True
    
    # If no Makefile, compile directly
    source_files = glob.glob(f"{root_dir}/*.c")
    if not source_files:
        print(f"No source files found in {root_dir}")
        return False
        
    source_list = " ".join(source_files)
    # all O2 static linking only

    cmd: str = f"{gcc_path} {source_list} -o {root_dir}/{target} -march=rv32i -static -O2 -lm {common_flags}"
    print(f"Compiling command: {cmd}")
    ret = os.system(cmd)
    if ret != 0:
        print(f"Compilation failed with return code {ret}")
        return False
    return True


def RunTests(opts):
    benchmarks = GetBenchmarks(opts)

    # Modified to use opts
    def get_execs(): 
        execs = [QEMUExec()]  # QEMU is always included as reference
        if opts.rvdbt_jit:
            execs.append(RVDBTExec(False, brcc=False, jit_merge_ls=False))  # JIT mode
        if opts.rvdbt_jit_no_brcc:
            execs.append(RVDBTExec(False, brcc=False, jit_merge_ls=True))  # JIT mode
        if opts.rvdbt_llvmaot_hotspot:
            execs.append(RVDBTExec(True, llvm=True, hotspot_threshold=100))  # JIT merge ls mode
        if opts.rvdbt_jit_merge_ls:
            execs.append(RVDBTExec(False, brcc=True, jit_merge_ls=True))  # JIT merge ls mode
        if opts.rvdbt_llvmaot_hotspot:
            execs.append(RVDBTExec(True, llvm=True, hotspot_threshold=101))  # JIT merge ls mode
        if opts.rvdbt_qcgaot:
            execs.append(RVDBTExec(True, False))  # QCG AOT
        if opts.rvdbt_llvmaot:
            execs.append(RVDBTExec(True, True))  # LLVM AOT
        if opts.rvdbt_llvmaot_1000:
            execs.append(RVDBTExec(True, True, 1000))  # LLVM AOT with hotspot threshold
        if opts.rvdbt_llvmaot_opt:
            execs.append(RVDBTExec(True, True, 1000, llvmopt=True))  # LLVM AOT with optimization
        if opts.libriscv:
            execs.append(LIBRISCVExec("bt"))  # LibRISCV BT mode
        return execs
    
    if opts.objective == "test":
        benchmarks = [b for b in benchmarks if b.cmp_out]

    csvtab = [["benchmark-name"] + list(map(lambda e: e.name, get_execs()))]

    for b in benchmarks:
        print(f"\nCompiling benchmark under: {b.root}")
        if not compile_benchmark(opts.riscv32_gcc, b.root, b.args[0]):
            print(f"Skipping benchmark due to compilation failure: {b.root}")
            continue

        print(f"\nRunning benchmark:")
        execs = get_execs()
        scores = [b.name]
        ref_exec = execs[0]
        for e in execs:
            print(f"Running {b.name} with {e.name}")
            b.launch_with(e)
            res = b.result(e, ref_exec)
            print(f"  Result: {res.res}")
            print(f"  Time: {res.time}")
            print(f"  Score: {res.score}")
            print(f"  Return code: {e.rc}") # if the return code is 0, then below is logs
            print(f"  Error output or logs: {e.err}") # E.g., [aot] is log_aot
            scores += [res.score]

        csvtab += [scores]

    csv.writer(sys.stdout).writerows(csvtab)


def main():
    op = optparse.OptionParser()
    op.add_option("--riscv32-gcc", dest="riscv32_gcc")
    op.add_option("--rvdbt-build-dir", dest="rvdbt_build_dir")
    op.add_option("--libriscv-build-dir", dest="libriscv_build_dir")
    op.add_option("--prebuilts", dest="prebuilts_dir")
    # Add new options for execution modes
    op.add_option("--rvdbt-jit-no-brcc", action="store_true", dest="rvdbt_jit_no_brcc", default=False)
    op.add_option("--rvdbt-jit", action="store_true", dest="rvdbt_jit", default=False)
    op.add_option("--rvdbt-jit-merge-ls", action="store_true", dest="rvdbt_jit_merge_ls", default=False)
    op.add_option("--rvdbt-qcgaot", action="store_true", dest="rvdbt_qcgaot", default=False)
    op.add_option("--rvdbt-llvmaot", action="store_true", dest="rvdbt_llvmaot", default=False)
    op.add_option("--rvdbt-llvmaot-1000", action="store_true", dest="rvdbt_llvmaot_1000", default=False)
    op.add_option("--rvdbt-llvmaot-opt", action="store_true", dest="rvdbt_llvmaot_opt", default=False)
    op.add_option("--rvdbt-llvmaot-hotspot", action="store_true", dest="rvdbt_llvmaot_hotspot", default=False)
    op.add_option("--libriscv", action="store_true", dest="libriscv", default=False)
    # set objective to "benchmark" or "test"
    op.add_option("--objective", dest="objective", type="choice", 
                 choices=["benchmark", "test"], default="benchmark",
                 help="Set the objective: 'benchmark' or 'test'")

    (opts, args) = op.parse_args()
    if not opts.rvdbt_build_dir or not opts.libriscv_build_dir or not opts.prebuilts_dir:
        op.error("usage")
    os.makedirs(opts.rvdbt_build_dir + "/dbtcache", exist_ok=True)
    os.makedirs(opts.rvdbt_build_dir + "/logs", exist_ok=True)

    RVDBTExec.build_dir = opts.rvdbt_build_dir
    LIBRISCVExec.build_dir = opts.libriscv_build_dir
    RunTests(opts)


main()
