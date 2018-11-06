
cmake_minimum_required(VERSION 3.5.0)
project(comp_name
	VERSION 0.2.0
	LANGUAGES CXX)

##### Configuration

configure_file(config/README ${CMAKE_SOURCE_DIR}/README.md)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Weffc++ -Wshadow -Wnon-virtual-dtor)

if(ENABLE_COVERAGE)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g ")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ftest-coverage")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage")
endif()

##### Source

add_subdirectory(source_bin)

##### Test

enable_testing()
include(CTest)
add_subdirectory(test)

##### Code Analysis

include(cmake/cppcheck.cmake)
