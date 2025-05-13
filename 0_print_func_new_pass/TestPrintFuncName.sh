#!/bin/bash
clang -fexperimental-new-pass-manager -fpass-plugin=/home/swkang/tmp/llmv-tutorial/lib/libLLVMTutorialPrintFuncNameNewPass.so /home/swkang/tmp/llmv-tutorial/testcase/0_print_func_new_pass/test.c
