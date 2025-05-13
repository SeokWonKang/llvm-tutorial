#-----------------------
# Targets
#-----------------------
# Library
add_library( LLVMTutorialDeadCodeEliminationNewPass MODULE 
	DeadCodeElimination.cpp )
target_include_directories( LLVMTutorialDeadCodeEliminationNewPass PUBLIC
	$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include> )

add_custom_command( OUTPUT TestDeadCodeElimination.sh
	COMMAND echo '\#!/bin/bash' > TestDeadCodeElimination.sh
	COMMAND echo 'echo \"[test0.ll]\"' >> TestDeadCodeElimination.sh
	COMMAND echo 'clang -emit-llvm -S -o test0.result.ll -fexperimental-new-pass-manager -fpass-plugin=${CMAKE_INSTALL_PREFIX}/lib/libLLVMTutorialDeadCodeEliminationNewPass.so ${CMAKE_INSTALL_PREFIX}/testcase/1_dead_code_elimination/test0.ll' >> TestDeadCodeElimination.sh
	COMMAND echo 'echo \"[test1.ll]]\"' >> TestDeadCodeElimination.sh
	COMMAND echo 'clang -emit-llvm -S -o test1.result.ll -fexperimental-new-pass-manager -fpass-plugin=${CMAKE_INSTALL_PREFIX}/lib/libLLVMTutorialDeadCodeEliminationNewPass.so ${CMAKE_INSTALL_PREFIX}/testcase/1_dead_code_elimination/test1.ll' >> TestDeadCodeElimination.sh
	COMMAND echo 'echo \"[test2.ll]]\"' >> TestDeadCodeElimination.sh
	COMMAND echo 'clang -emit-llvm -S -o test2.result.ll -fexperimental-new-pass-manager -fpass-plugin=${CMAKE_INSTALL_PREFIX}/lib/libLLVMTutorialDeadCodeEliminationNewPass.so ${CMAKE_INSTALL_PREFIX}/testcase/1_dead_code_elimination/test2.ll' >> TestDeadCodeElimination.sh
	COMMAND echo 'echo \"[test3.ll]]\"' >> TestDeadCodeElimination.sh
	COMMAND echo 'clang -emit-llvm -S -o test3.result.ll -fexperimental-new-pass-manager -fpass-plugin=${CMAKE_INSTALL_PREFIX}/lib/libLLVMTutorialDeadCodeEliminationNewPass.so ${CMAKE_INSTALL_PREFIX}/testcase/1_dead_code_elimination/test3.ll' >> TestDeadCodeElimination.sh
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} )
add_custom_target( TestDeadCodeEliminationScript 
	DEPENDS TestDeadCodeElimination.sh )
add_dependencies( LLVMTutorialDeadCodeEliminationNewPass
	TestDeadCodeEliminationScript )

#------------------------------
# Install
#------------------------------
install( 
	FILES       testcase/test0.ll
	FILES       testcase/test1.ll
	FILES       testcase/test2.ll
	FILES       testcase/test3.ll
	DESTINATION ${CMAKE_INSTALL_PREFIX}/testcase/1_dead_code_elimination)
install(
	FILES       TestDeadCodeElimination.sh
	DESTINATION ${CMAKE_INSTALL_PREFIX}/bin  )
install( 
	TARGETS  LLVMTutorialDeadCodeEliminationNewPass 
	EXPORT   ${EXPORT_NAME} 
	INCLUDES DESTINATION ${CMAKE_INSTALL_PREFIX}/include
	RUNTIME  DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
	LIBRARY  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
	ARCHIVE  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib )
