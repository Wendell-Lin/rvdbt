#! /bin/bash
# $1 is llvm version
build_dir=build-llvm-$1
mkdir -p $build_dir && cd $build_dir
mkdir -p dbtcache troot tcache

if [ $1 == "19" ]; then
    LLVM_ROOT="/home/wendell/llvm-19"
    export PATH="$LLVM_ROOT/bin:$PATH"
    export LD_LIBRARY_PATH="$LLVM_ROOT/lib:$LD_LIBRARY_PATH"
    export CXXFLAGS="-I$LLVM_ROOT/include"
    export LDFLAGS="-L$LLVM_ROOT/lib"
    export LLVM_DIR="$LLVM_ROOT/lib/cmake/llvm"
    
    # Force CMake to use LLVM 19
    CC=clang CXX=clang++ cmake -GNinja -DCMAKE_BUILD_TYPE=Debug \
        -DLLVM_DIR="$LLVM_ROOT/lib/cmake/llvm" \
        -DCMAKE_PREFIX_PATH="$LLVM_ROOT" \
        -DLLVMConfig_PATH="$LLVM_ROOT/lib/cmake/llvm/LLVMConfig.cmake" \
        ..
else
    export PATH="/usr/lib/llvm-$1/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/lib/llvm-$1/lib:$LD_LIBRARY_PATH"
    export CXXFLAGS="-I/usr/include/llvm-$1"
    export LDFLAGS="-L/usr/lib/llvm-$1/lib"
    export LLVM_DIR="/usr/lib/llvm-$1/lib/cmake"
    
    CC=clang CXX=clang++ cmake -GNinja -DCMAKE_BUILD_TYPE=Debug ..
fi
ninja


