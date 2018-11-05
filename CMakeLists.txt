
cmake_minimum_required(VERSION 3.5.0)
project(comp_name 
	VERSION 0.1.0 
	LANGUAGES CXX)

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
