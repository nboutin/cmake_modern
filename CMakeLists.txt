
cmake_minimum_required(VERSION 3.5.0)
project(comp_name 
	VERSION 0.1.0 
	LANGUAGES CXX)
	
add_subdirectory(source_bin)

##### Test

include(cmake/catch.cmake)
enable_testing()
include(CTest)

#set(Catch2_DIR ${CMAKE_BINARY_DIR}/lib/cmake/Catch2)
find_package(Catch2 REQUIRED)

#target_include_directories(${} SYSTEM ${CMAKE_BINARY_DIR}/include)