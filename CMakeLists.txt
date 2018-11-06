
cmake_minimum_required(VERSION 3.5.0)
project(comp_name
	VERSION 0.2.0
	LANGUAGES CXX)

##### Configuration

configure_file(config/README ${CMAKE_SOURCE_DIR}/README.md)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic)

if(ENABLE_COVERAGE)
	add_compile_options(-g -O0 --coverage -fprofile-arcs -ftest-coverage)
endif()

##### Source

add_subdirectory(source_bin)

##### Test

enable_testing()
include(CTest)
add_subdirectory(test)

##### Code Analysis

include(cmake/cppcheck.cmake)
