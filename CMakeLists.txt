
cmake_minimum_required(VERSION 3.5.0)
project(comp_name 
	VERSION 0.1.0 
	LANGUAGES CXX)

##### Source
	
add_subdirectory(source_bin)

##### Test

enable_testing()
include(CTest)
add_subdirectory(test)

##### Code Analysis

include(cmake/cppcheck.cmake)
