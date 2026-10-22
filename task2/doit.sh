#!/bin/sh
set -e

# 清理旧文件
rm -rf obj_dir
rm -f sinegen.vcd

# 指定顶层模块，并提供所有用到的模块
verilator -Wall --cc --trace \
    --top-module sinegen \
    sinegen.sv counter.sv rom.sv \
    --exe sinegen_tb.cpp

# 编译
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# 运行仿真
obj_dir/Vsinegen
