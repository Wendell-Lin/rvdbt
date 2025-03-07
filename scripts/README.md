# Scritps
This directory collects the scripts to build, test, and benchmark, to avoid polluting the parent directory.
But to run these scripts, please be at parent diretory and specified llvm version like following examples. The CI/CD Jenkins also use these scripts.

## Build
Note that this only builds developing llvm version. There is no need to build earlier llvm version after building from forked repo.
```bash
~/rvdbt$ bash scripts/build.sh 19 
```

## Test
```bash
~/rvdbt$ bash scripts/test.sh 19
```

## Benchmark
```bash
~/rvdbt$ bash scripts/benchmark.sh 19
```