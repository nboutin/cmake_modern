
cmake_minimum_required(VERSION 3.5.0)
project(comp_name 
	VERSION 0.1.0 
	LANGUAGES CXX)
	
add_subdirectory(source_bin)

##### Test

# cmake --build build/cmake --target test

#include(cmake/catch.cmake)
#set(Catch2_DIR ${CMAKE_BINARY_DIR}/lib/cmake/Catch2)
#find_package(Catch2 REQUIRED)
#target_include_directories(${} SYSTEM ${CMAKE_BINARY_DIR}/include)

# catch external project
# - https://github.com/ComicSansMS/GhulbusBase/blob/master/CMakeLists.txt

# Add catch target
add_library(Catch INTERFACE)
target_include_directories(Catch INTERFACE test/external/catch2)

# Enable test
enable_testing()
include(CTest)

# Add test
add_executable(test_sqrt 
	test/src/main.cpp
	test/src/test_sqrt.cpp)
target_link_libraries(test_sqrt PRIVATE Catch)
add_test(NAME test_sqrt COMMAND test_sqrt)

add_executable(test_factorial
	test/src/main.cpp
	test/src/test_factorial.cpp)
target_link_libraries(test_factorial PRIVATE Catch)
add_test(NAME test_factorial COMMAND test_factorial)
