#-----------------------
# Targets
#-----------------------

#------------------------------
# Install
#------------------------------
install( 
	FILES       testcase/test0.ll
	FILES       testcase/test1.ll
	DESTINATION ${CMAKE_INSTALL_PREFIX}/testcase/2_instruction_move)
