
if(ENABLE_CPPCHECK)
	include(ExternalProject)
	find_package(Git REQUIRED)

	ExternalProject_Add(
	    cppcheck
	    GIT_REPOSITORY      https://github.com/danmar/cppcheck.git
	    GIT_TAG             1.85
	    GIT_SHALLOW         1
	    CMAKE_ARGS          "-DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}"
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
	    --verbose
	    --error-exitcode=1
	    --language=c++
	    -DMAIN=main
	    -I ${CMAKE_SOURCE_DIR}/source_bin/*
#	    -I ${CMAKE_SOURCE_DIR}/test/src/*
)

	add_custom_target(cpp-check COMMAND ${CMAKE_BINARY_DIR}/bin/cppcheck ${CPPCHECK_ARGS})
endif()
