# Scritps
This directory collects the scripts to build, test, and benchmark, to avoid polluting the parent directory.
But to run these scripts, please be at parent diretory and specified llvm version like following examples.

## Build
Note that this only builds developing llvm version. There is no need to build earlier llvm version after building from forked repo.
```bash
bash scripts/build.sh 19 
```

## Test
```bash
bash scripts/test.sh 19
