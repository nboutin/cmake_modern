
cmake_minimum_required(VERSION 3.5.0)
project(cmake_modern
	VERSION 0.2.0
	LANGUAGES CXX)

##### Configuration

configure_file(config/README ${CMAKE_SOURCE_DIR}/README.md)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Wnon-virtual-dtor -Wshadow -Weffc++ -Wold-style-cast)

# GCC Only: -Wnoexcept -Wlogical-op -Wstrict-null-sentinel -Wzero-as-null-pointer-constant

add_compile_options(-Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
	-Winit-self -Wmissing-declarations -Wmissing-include-dirs
	-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo
	-Wswitch-default -Wundef -Wno-unused -Wfatal-errors -Wuseless-cast)

##### Source

add_subdirectory(source_bin)

##### Test

enable_testing()
include(CTest)
add_subdirectory(test)

##### Code Analysis

include(cmake/cppcheck.cmake)
