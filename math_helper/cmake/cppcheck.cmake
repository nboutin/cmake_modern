
if(ENABLE_CPPCHECK)
	include(ExternalProject)
	find_package(Git REQUIRED)

	set(INSTALL_DIR ${CMAKE_BINARY_DIR}/install)

	ExternalProject_Add(
	    cppcheck_repo
	    GIT_REPOSITORY      https://github.com/danmar/cppcheck.git
	    GIT_TAG             2.1
	    GIT_SHALLOW         1
	    CMAKE_ARGS          -DCMAKE_BUILD_TYPE=Release ; -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}
	    PREFIX              ${CMAKE_BINARY_DIR}/external/cppcheck/prefix
	    TMP_DIR             ${CMAKE_BINARY_DIR}/external/cppcheck/tmp
	    STAMP_DIR           ${CMAKE_BINARY_DIR}/external/cppcheck/stamp
	    DOWNLOAD_DIR        ${CMAKE_BINARY_DIR}/external/cppcheck/download
	    SOURCE_DIR          ${CMAKE_BINARY_DIR}/external/cppcheck/src
	    BINARY_DIR          ${CMAKE_BINARY_DIR}/external/cppcheck/build
	)

	list(APPEND CPPCHECK_ARGS
	    --enable=warning,style,performance,portability,unusedFunction
	    --std=c++11
	    #--verbose
	    --error-exitcode=1
	    --language=c++
	    #-DMAIN=main
		--project=compile_commands.json
	    -i ${CMAKE_SOURCE_DIR}/test # ignore
	    --suppressions-list=${CMAKE_SOURCE_DIR}/cmake/cppcheck_suppress.txt
		--template=gcc
	)

#	add_custom_target(cppcheck COMMAND pwd)
	add_custom_target(cppcheck COMMAND ${INSTALL_DIR}/bin/cppcheck ${CPPCHECK_ARGS})
endif()
