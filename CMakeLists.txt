
cmake_minimum_required(VERSION 3.5.0)
project(comp_name
	VERSION 0.2.0
	LANGUAGES CXX)

##### Configuration

configure_file(config/README ${CMAKE_SOURCE_DIR}/README.md)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic)

##### Source

add_subdirectory(source_bin)

##### Test

enable_testing()
include(CTest)
add_subdirectory(test)

##### Code Analysis

include(cmake/cppcheck.cmake)
