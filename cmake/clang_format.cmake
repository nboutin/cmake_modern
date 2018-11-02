if(ENABLE_CLANG_FORMAT)

	# Get all project files
	file(GLOB_RECURSE
	     ALL_CXX_SOURCE_FILES
	     source_bin/*.[ch]pp
	     source_lib/*.[ch]pp
	     test/src/*.[ch]pp)
	     
	add_custom_target(
		clang-format
		COMMAND /usr/bin/clang-format-6.0
		-i
		-style=file
		${ALL_CXX_SOURCE_FILES})
endif()
