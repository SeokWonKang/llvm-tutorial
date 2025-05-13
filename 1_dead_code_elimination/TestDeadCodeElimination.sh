#!/bin/bash
echo "[test0.ll]"
clang -emit-llvm -S -o test0.result.ll -fexperimental-new-pass-manager -fpass-plugin=/home/swkang/tmp/llmv-tutorial/lib/libLLVMTutorialDeadCodeEliminationNewPass.so /home/swkang/tmp/llmv-tutorial/testcase/1_dead_code_elimination/test0.ll
echo "[test1.ll]]"
clang -emit-llvm -S -o test1.result.ll -fexperimental-new-pass-manager -fpass-plugin=/home/swkang/tmp/llmv-tutorial/lib/libLLVMTutorialDeadCodeEliminationNewPass.so /home/swkang/tmp/llmv-tutorial/testcase/1_dead_code_elimination/test1.ll
echo "[test2.ll]]"
clang -emit-llvm -S -o test2.result.ll -fexperimental-new-pass-manager -fpass-plugin=/home/swkang/tmp/llmv-tutorial/lib/libLLVMTutorialDeadCodeEliminationNewPass.so /home/swkang/tmp/llmv-tutorial/testcase/1_dead_code_elimination/test2.ll
echo "[test3.ll]]"
clang -emit-llvm -S -o test3.result.ll -fexperimental-new-pass-manager -fpass-plugin=/home/swkang/tmp/llmv-tutorial/lib/libLLVMTutorialDeadCodeEliminationNewPass.so /home/swkang/tmp/llmv-tutorial/testcase/1_dead_code_elimination/test3.ll
