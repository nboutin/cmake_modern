
cmake_minimum_required(VERSION 3.5.0)
project(cmake_modern
	VERSION 0.2.0
	LANGUAGES CXX)

##### Configuration

configure_file(config/README ${CMAKE_SOURCE_DIR}/README.md)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Weffc++ -Wshadow -Wnon-virtual-dtor)

##### Source

add_subdirectory(source_bin)

##### Test

enable_testing()
include(CTest)
add_subdirectory(test)

##### Code Analysis

include(cmake/cppcheck.cmake)
