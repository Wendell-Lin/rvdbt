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
        self.aot_size = 0

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
        self.aot_size = 0

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

    def __init__(self, aot, llvm=False, hotspot_threshold=0, jit_merge_ls=False, llvmopt=False):
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
        # if self.aot:
        #     pargs += ["--logs=aot"]
        # pargs += ["--logs=ukernel"]
        # pargs += ["--logs=trace"]
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

def get_latest_aot_so():
    """Get the filename of the most recently created .aot.so file in the cache directory."""
    
    # Get the cache directory
    cache_dir = RVDBTExec.build_dir + "/dbtcache/"
    
    # Find all .aot.so files
    aot_so_files = glob.glob(os.path.join(cache_dir, "*.aot.so"))
    
    if not aot_so_files:
        raise FileNotFoundError("No .aot.so files found in the cache directory")
    
    latest_aot_so = max(aot_so_files, key=os.path.getmtime)
    
    return os.path.basename(latest_aot_so)

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
            new_base_name = self.name + "_" + exec.name
            new_name = new_base_name + ".gv"
            print(f"Renaming modulegraph.gv `to {new_name}")
            os.rename(RVDBTExec.build_dir + "/logs/modulegraph.gv", RVDBTExec.build_dir + "/logs/" + new_name)
            cache_path = RVDBTExec.build_dir + "/dbtcache/" + get_latest_aot_so()
            assert os.path.isfile(cache_path), f"AOT file {cache_path} does not exist"
            os.system(f"cp {cache_path} {RVDBTExec.build_dir}/dbtcache/{new_base_name}.aot.so")
            exec.aot_size = os.path.getsize(cache_path)
            print(f"AOT size: {exec.aot_size} bytes")
        
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
        def __init__(self, res, time, score, output=None, aot_size=0):
            self.res = res
            self.time = time
            self.score = score
            self.aot_size = aot_size

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
        return Benchmark.Result(res, exec.time, score, aot_size=exec.aot_size)


# mibench.automotive
def GetBenchmarks_Automotive(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/automotive")
    # b.append(Benchmark(root + "/basicmath", ["basicmath_small"], True))
    # b.append(Benchmark(root + "/basicmath", ["basicmath_large"]))
    # b.append(Benchmark(root + "/bitcount", ["bitcnts", "30000000"]))
    # b.append(Benchmark(root + "/qsort",
    #         ["qsort_small", "input_small.dat"], True))
    # b.append(Benchmark(root + "/qsort",
    #          ["qsort_large", "input_huge.dat"], True))
    # convert large.pgm to 10x large.pgm by cmd "convert -size 8192x8192 xc:gray input_huge.pgm" from imagemagick
    # b.append(Benchmark(root + "/susan",
    #          ["susan", "input_huge.pgm", "_bout", "-c"], False, "_bout"))
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
             ["bf", "e", "input_large.asc", "_bout", "1234567890abcdeffedcba0987654321"], False, "_bout"))
    return b


# mibench.telecomm
def GetBenchmarks_Telecomm(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir + "/telecomm")
    b.append(Benchmark(root + "/FFT", ["fft", "8", f"{32768}"], True))
    b.append(Benchmark(root + "/FFT", ["fft_ia", "8", f"{32768}"], True))
    # b.append(Benchmark(root + "/gsm",
    #          ["toast", "-c", "big.au"], True)) # 10x times larger than large.au by cmd "sox large.au big.au repeat 10"
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
    b.append(Benchmark(root + "/", ["nbench", "0"], name="numeric-sort"))
    b.append(Benchmark(root + "/", ["nbench", "1"], name="string-sort"))
    b.append(Benchmark(root + "/", ["nbench", "2"], name="bitfield"))
    b.append(Benchmark(root + "/", ["nbench", "3"], name="emfloat"))
    b.append(Benchmark(root + "/", ["nbench", "5"], name="assignment"))
    # b.append(Benchmark(root + "/", ["nbench", "6"], name="IDEA"))
    b.append(Benchmark(root + "/", ["nbench", "7"], name="Huffman"))
    b.append(Benchmark(root + "/", ["dhrystone"]))
    # b.append(Benchmark(root + "/", ["primes"], cmp_out=True))
    b.append(Benchmark(root + "/", ["sha512"], cmp_out=True))
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

def GetBenchmarks_SPEC2017Rate(prebuilts_dir):
    # ref commands
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir)
    """
/usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./perlbench_r_base.riscv_wendell_debug-32 -I./lib checkspam.pl 2500 5 25 11 150 1 1 1 1
/usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./perlbench_r_base.riscv_wendell_debug-32 -I./lib diffmail.pl 4 800 10 17 19 300
/usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./perlbench_r_base.riscv_wendell_debug-32 -I./lib splitmail.pl 6400 12 26 16 100 0
"""
    b.append(Benchmark(root + "/500.perlbench_r/" , ["perlbench_r_base.riscv_wendell_debug-32", "checkspam.pl", "2500", "5", "25", "11", "150", "1", "1", "1", "1"]))
    b.append(Benchmark(root + "/500.perlbench_r/" , ["perlbench_r_base.riscv_wendell_debug-32", "diffmail.pl", "4", "800", "10", "17", "19", "300"]))
    b.append(Benchmark(root + "/500.perlbench_r/" , ["perlbench_r_base.riscv_wendell_debug-32", "splitmail.pl", "6400", "12", "26", "16", "100", "0"]))
    """
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./mcf_r_base.riscv_wendell_debug-32 inp.in 
    """
    b.append(Benchmark(root + "/505.mcf_r/" , ["mcf_r_base.riscv_wendell_debug-32", "inp.in"]))
    """
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./cpuxalan_r_base.riscv_wendell_debug-32 -v t5.xml xalanc.xsl
    """
    b.append(Benchmark(root + "/523.xalancbmk_r/" , ["cpuxalan_r_base.riscv_wendell_debug-32", "-v", "t5.xml", "xalanc.xsl"]))
    """
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./x264_r_base.riscv_wendell_debug-32 --pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720
/usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./x264_r_base.riscv_wendell_debug-32 --pass 2 --stats x264_stats.log --bitrate 1000 --dumpyuv 200 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720
/usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./x264_r_base.riscv_wendell_debug-32 --seek 500 --dumpyuv 200 --frames 1250 -o BuckBunny_New.264 BuckBunny.yuv 1280x720
    """
    b.append(Benchmark(root + "/525.x264_r/" , ["x264_r_base.riscv_wendell_debug-32", "--pass", "1", "--stats", "x264_stats.log", "--bitrate", "1000", "--frames", "1000", "-o", "BuckBunny_New.264", "BuckBunny.yuv", "1280x720"]))
    b.append(Benchmark(root + "/525.x264_r/" , ["x264_r_base.riscv_wendell_debug-32", "--pass", "2", "--stats", "x264_stats.log", "--bitrate", "1000", "--dumpyuv", "200", "--frames", "1000", "-o", "BuckBunny_New.264", "BuckBunny.yuv", "1280x720"]))
    b.append(Benchmark(root + "/525.x264_r/" , ["x264_r_base.riscv_wendell_debug-32", "--seek", "500", "--dumpyuv", "200", "--frames", "1250", "-o", "BuckBunny_New.264", "BuckBunny.yuv", "1280x720"]))
    """
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./deepsjeng_r_base.riscv_wendell_debug-32 ref.txt
    """
    b.append(Benchmark(root + "/531.deepsjeng_r/" , ["deepsjeng_r_base.riscv_wendell_debug-32", "ref.txt"]))
    """
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./leela_r_base.riscv_wendell_debug-32 test.sgf
    """
    b.append(Benchmark(root + "/541.leela_r/" , ["leela_r_base.riscv_wendell_debug-32", "test.sgf"]))
    """
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./exchange2_r_base.riscv_wendell_debug-32 6
    """
    b.append(Benchmark(root + "/548.exchange2_r/" , ["exchange2_r_base.riscv_wendell_debug-32", "6"]))
    """ 
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./xz_r_base.riscv_wendell_debug-32 cld.tar.xz 160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./xz_r_base.riscv_wendell_debug-32 cpu2006docs.tar.xz 250 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 23047774 23513385 6e
    /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./xz_r_base.riscv_wendell_debug-32 input.combined.xz 250 a841f68f38572a49d86226b7ff5baeb31bd19dc637a922a972b2e6d1257a890f6a544ecab967c313e370478c74f760eb229d4eef8a8d2836d233d3e9dd1430bf 40401484 41217675 7
    """
    b.append(Benchmark(root + "/557.xz_r/" , ["xz_r_base.riscv_wendell_debug-32", "cld.tar.xz", "160", "19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474", "59796407", "61004416", "6"]))
    b.append(Benchmark(root + "/557.xz_r/" , ["xz_r_base.riscv_wendell_debug-32", "cpu2006docs.tar.xz", "250", "055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae", "23047774", "23513385", "6e"]))
    b.append(Benchmark(root + "/557.xz_r/" , ["xz_r_base.riscv_wendell_debug-32", "input.combined.xz", "250", "a841f68f38572a49d86226b7ff5baeb31bd19dc637a922a972b2e6d1257a890f6a544ecab967c313e370478c74f760eb229d4eef8a8d2836d233d3e9dd1430bf", "40401484", "41217675", "7"]))
    return b

def GetBenchmarks_SPEC2017RateTrain(prebuilts_dir):
    b: list[Benchmark] = []
    root = os.path.join(prebuilts_dir)
    # x264 merge_ls errs
    # 525
    # BuckBunny.264 BuckBunny.yuv no_md5 BuckBunny_New.264 1280x720 500 1000 1250 200 200 400 600 700 800 900 999 1100 1249
    # b.append(Benchmark(root + "/525.x264_r/" , ["x264_r_base.riscv_wendell_debug-32", "BuckBunny.264", "BuckBunny.yuv", "no_md5", "BuckBunny_New.264", "1280x720", "0", "142", "0", "50", "50", "100", "141"]))
    # train ./x264_r_base.riscv_wendell_debug-32 --dumpyuv 50 --frames 142 -o BuckBunny_New.264 BuckBunny.yuv 1280x720
    # b.append(Benchmark(root + "/525.x264_r/" , ["x264_r_base.riscv_wendell_debug-32", "--dumpyuv", "50", "--frames", "142", "-o", "BuckBunny_New.264", "BuckBunny.yuv", "1280x720"]))
    # ./x264_r_base.riscv_wendell_debug-64 --pass 1 --stats x264_stats.log --bitrate 1000 --frames 1000 -o BuckBunny_New.264 BuckBunny.yuv 1280x720
    # b.append(Benchmark(root + "/525.x264_r/" , ["x264_r_base.riscv_wendell_debug-32", "--pass", "1", "--stats", "x264_stats.log", "--bitrate", "1000", "--frames", "100", "-o", "BuckBunny_New.264", "BuckBunny.yuv", "1280x720"]))
    # 557
    # ./xz_r_base.riscv_wendell_debug-64 cld.tar.xz 160 19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474 59796407 61004416 6
    # b.append(Benchmark(root + "/557.xz_r/", ["xz_r_base.riscv_wendell_debug-32", "cld.tar.xz", "1",
    #                                          "19cf30ae51eddcbefda78dd06014b4b96281456e078ca7c13e1c0c9e6aaea8dff3efb4ad6b0456697718cede6bd5454852652806a657bb56e07d61128434b474",
    #                                          "59796407", "61004416", "3"]))
    # 502.gcc
    # ./cpugcc_r_base.riscv_wendell_debug-64 gcc-pp.c -O3 -finline-limit=0 -fif-conversion -fif-conversion2 -o gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.s
    # b.append(Benchmark(root + "/502.gcc_r/", ["cpugcc_r_base.riscv_wendell_debug-32", "gcc-pp.c", "-O3", "-finline-limit=0", "-fif-conversion", "-fif-conversion2", "-o", "gcc-pp.opts-O3_-finline-limit_0_-fif-conversion_-fif-conversion2.s"]))
    # ./cpugcc_r_base.riscv_wendell_debug-32 train01.c -O3 -finline-limit=50000
    # b.append(Benchmark(root + "/502.gcc_r/", ["cpugcc_r_base.riscv_wendell_debug-32", "train01.c", "-O3", "-finline-limit=50000"]))
    # b.append(Benchmark(root + "/502.gcc_r/", ["cpugcc_r_base.riscv_wendell_debug-32", "t1.c", "-O3", "-finline-limit=50000"]))
    # 500.perl
    # ref
    # checkspam.pl 100 1 5 2 10 0 0 0 0
    # b.append(Benchmark(root + "/500.perlbench_r/", ["perlbench_r_base.riscv_wendell_debug-32", "checkspam.pl", "100", "1", "5", "2", "10", "0", "0", "0", "0"]))
    # diffmail.pl 4 800 10 17 19 300
    # b.append(Benchmark(root + "/500.perlbench_r/", ["perlbench_r_base.riscv_wendell_debug-32", "diffmail.pl", "4", "800", "10", "17", "19", "300"]))
    # 4 70 15 24 23 100 
    # b.append(Benchmark(root + "/500.perlbench_r/", ["perlbench_r_base.riscv_wendell_debug-32", "diffmail.pl", "4", "70", "15", "24", "23", "100"]))
    # perfect.pl b 3
    # b.append(Benchmark(root + "/500.perlbench_r/", ["perlbench_r_base.riscv_wendell_debug-32", "perfect.pl", "b", "3"]))
    # 505.mcf
    # b.append(Benchmark(root + "/505.mcf_r/", ["mcf_r_base.riscv_wendell_debug-32", "test.in"]))

    # g++ test
    # 520 /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./omnetpp_r_base.riscv_wendell_debug-32 -c General -r 0
    # bug out when loading files with chdir
    b.append(Benchmark(root + "/520.omnetpp_r/", ["omnetpp_r_base.riscv_wendell_debug-32", "-c", "General", "-r", "0"]))
    # 523 ./cpuxalan_r_base.riscv_wendell_debug-32 -v t5.xml xalanc.xsl
    # b.append(Benchmark(root + "/523.xalancbmk_r/", ["cpuxalan_r_base.riscv_wendell_debug-32", "-v", "test_1mb.xml", "xalanc.xsl"]))
    # 531
    # /usr/bin/qemu-riscv32 -L /opt/riscv/sysroot ./deepsjeng_r_base.riscv_wendell_debug-32 ref.txt
    # b.append(Benchmark(root + "/531.deepsjeng_r/", ["deepsjeng_r_base.riscv_wendell_debug-32", "test.txt"]))
    # 541
    # b.append(Benchmark(root + "/541.leela_r/", ["leela_r_base.riscv_wendell_debug-32", "test.sgf"]))

    # fortran train 
    # 548 ./exchange2_r_base.riscv_wendell_debug-32 6
    # b.append(Benchmark(root + "/548.exchange2_r/", ["exchange2_r_base.riscv_wendell_debug-32", "1"]))
    return b

def GetBenchmarks(opts):
    benchmarks: list[Benchmark] = []
    if opts.benchmark == "mibench":
        # benchmarks += GetBenchmarks_Automotive(opts.prebuilts_dir)
        # benchmarks += GetBenchmarks_Network(opts.prebuilts_dir) # This is not tested in pukhovv/rvdbt
        # benchmarks += GetBenchmarks_Security(opts.prebuilts_dir) # Note bf exit with return code 1 
        benchmarks += GetBenchmarks_Telecomm(opts.prebuilts_dir)
        # benchmarks += GetBenchmarks_Coremark(opts.prebuilts_dir)
    elif opts.benchmark == "automotive":
        benchmarks += GetBenchmarks_Automotive(opts.prebuilts_dir)
    elif opts.benchmark == "network":
        benchmarks += GetBenchmarks_Network(opts.prebuilts_dir)
    elif opts.benchmark == "security":
        benchmarks += GetBenchmarks_Security(opts.prebuilts_dir)
    elif opts.benchmark == "telecomm":
        benchmarks += GetBenchmarks_Telecomm(opts.prebuilts_dir)
    elif opts.benchmark == "coremark":
        benchmarks += GetBenchmarks_Coremark(opts.prebuilts_dir)
    elif opts.benchmark == "rv32emu":
        benchmarks += GetBenchmarks_RV32EMU(opts.prebuilts_dir)
    elif opts.benchmark == "rv32i":
        benchmarks += GetBenchmarks_RV32I(opts.prebuilts_dir)
    elif opts.benchmark == "rv32ia":
        benchmarks += GetBenchmarks_RV32IA(opts.prebuilts_dir)
    elif opts.benchmark == "SPEC2017Rate":
        benchmarks += GetBenchmarks_SPEC2017RateTrain(opts.prebuilts_dir)
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
    assert False, "TODO: we should compile before benchmark here, so maybe just check exist then run and remove the nasty code below."
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
            execs.append(RVDBTExec(False, jit_merge_ls=False))  # JIT mode
        if opts.rvdbt_jit_merge_ls:
            execs.append(RVDBTExec(False, jit_merge_ls=True))  # JIT merge ls mode
        if opts.rvdbt_qcgaot:
            execs.append(RVDBTExec(True, False))  # QCG AOT
        if opts.rvdbt_llvmaot:
            execs.append(RVDBTExec(True, True))  # LLVM AOT
        if opts.rvdbt_llvmaot_1000:
            execs.append(RVDBTExec(True, True, 1000))  # LLVM AOT with hotspot threshold
        if opts.rvdbt_llvmaot_opt:
            execs.append(RVDBTExec(True, True, 1000, llvmopt=True))  # LLVM AOT with optimization
        if opts.rvdbt_llvmaot_hotspot:
            execs.append(RVDBTExec(True, llvm=True, hotspot_threshold=1000))  # JIT merge ls mode
        if opts.libriscv:
            execs.append(LIBRISCVExec("bt"))  # LibRISCV BT mode
        return execs
    
    # if opts.objective == "test":
    #     benchmarks = [b for b in benchmarks if b.cmp_out]

    csvtab = [["benchmark-name"] + list(map(lambda e: e.name, get_execs()))]

    aot_csvtab = [["benchmark-name"] + list(map(lambda e: e.name, get_execs()))]

    for b in benchmarks:
        print(f"\nCompiling benchmark under: {b.root}")
        if not compile_benchmark(opts.riscv32_gcc, b.root, b.args[0]):
            print(f"Skipping benchmark due to compilation failure: {b.root}")
            continue

        print(f"\nRunning benchmark:")
        execs = get_execs()
        scores = [b.name]
        ref_exec = execs[0]
        aot_sizes = [b.name]
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
            aot_sizes += [res.aot_size]
        csvtab += [scores]
        aot_csvtab += [aot_sizes]
    csv.writer(sys.stdout).writerows(csvtab)

    csv.writer(sys.stdout).writerows(aot_csvtab)


def main():
    op = optparse.OptionParser()
    op.add_option("--riscv32-gcc", dest="riscv32_gcc")
    op.add_option("--rvdbt-build-dir", dest="rvdbt_build_dir")
    op.add_option("--libriscv-build-dir", dest="libriscv_build_dir")
    op.add_option("--prebuilts", dest="prebuilts_dir")
    # Add new options for execution modes
    op.add_option("--rvdbt-jit", action="store_true", dest="rvdbt_jit", default=False)
    op.add_option("--rvdbt-jit-merge-ls", action="store_true", dest="rvdbt_jit_merge_ls", default=False)
    op.add_option("--rvdbt-qcgaot", action="store_true", dest="rvdbt_qcgaot", default=False)
    op.add_option("--rvdbt-llvmaot", action="store_true", dest="rvdbt_llvmaot", default=False)
    op.add_option("--rvdbt-llvmaot-1000", action="store_true", dest="rvdbt_llvmaot_1000", default=False)
    op.add_option("--rvdbt-llvmaot-opt", action="store_true", dest="rvdbt_llvmaot_opt", default=False)
    op.add_option("--rvdbt-llvmaot-hotspot", action="store_true", dest="rvdbt_llvmaot_hotspot", default=False)
    op.add_option("--libriscv", action="store_true", dest="libriscv", default=False)
    op.add_option("--benchmark", dest="benchmark", type="choice", 
                 choices=["automotive", "network", "security", "telecomm", "coremark", "rv32emu", "rv32ia", "rv32i", "mibench", "SPEC2017Rate"], default="automotive",
                 help="Set the benchmark: 'automotive', 'network', 'security', 'telecomm', 'coremark', 'rv32emu', 'rv32ia', 'rv32i', 'mibench', 'SPEC2017Rate'")
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
