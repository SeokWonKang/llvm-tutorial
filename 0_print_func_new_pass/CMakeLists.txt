#-----------------------
# Targets
#-----------------------
# Library
add_library( LLVMTutorialPrintFuncNameNewPass MODULE 
	PrintFuncNewPass.cpp )
target_include_directories( LLVMTutorialPrintFuncNameNewPass PUBLIC
	$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>
	$<INSTALL_INTERFACE:include> )

add_custom_command( OUTPUT TestPrintFuncName.sh
	COMMAND echo '\#!/bin/bash' > TestPrintFuncName.sh
	COMMAND echo 'clang -fexperimental-new-pass-manager -fpass-plugin=${CMAKE_INSTALL_PREFIX}/lib/libLLVMTutorialPrintFuncNameNewPass.so ${CMAKE_INSTALL_PREFIX}/testcase/0_print_func_new_pass/test.c' >> TestPrintFuncName.sh
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} )
add_custom_target( TestPrintFuncNameScript
	DEPENDS TestPrintFuncName.sh )
add_dependencies( LLVMTutorialPrintFuncNameNewPass 
	TestPrintFuncNameScript )

#------------------------------
# Install
#------------------------------
install(
	FILES       TestPrintFuncName.sh
	DESTINATION ${CMAKE_INSTALL_PREFIX}/bin  )
install( 
	FILES       testcase/test.c
	DESTINATION ${CMAKE_INSTALL_PREFIX}/testcase/0_print_func_new_pass)
install( 
	TARGETS  LLVMTutorialPrintFuncNameNewPass
	EXPORT   ${EXPORT_NAME} 
	INCLUDES DESTINATION ${CMAKE_INSTALL_PREFIX}/include
	RUNTIME  DESTINATION ${CMAKE_INSTALL_PREFIX}/bin
	LIBRARY  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
	ARCHIVE  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib )
