
cmake_minimum_required(VERSION 3.5.0)
project(math_application
	VERSION 0.1.0
	LANGUAGES CXX)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Wnon-virtual-dtor -Wshadow -Weffc++ -Wold-style-cast)

add_compile_options(-Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
	-Winit-self -Wmissing-declarations -Wmissing-include-dirs
	-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo
	-Wswitch-default -Wundef -Wno-unused -Wfatal-errors)

# GCC Only: -Wnoexcept -Wlogical-op -Wstrict-null-sentinel -Wzero-as-null-pointer-constant -Wuseless-cast
# $<COMPILE_LANG_AND_ID:language,compiler_ids>
set(gcc_compile_options "$<COMPILE_LANG_AND_ID:CXX,GNU>")
add_compile_options("$<${gcc_compile_options}:-Wnoexcept;-Wlogical-op;-Wstrict-null-sentinel;-Wzero-as-null-pointer-constant;-Wuseless-cast>")

##### Target

add_executable(${PROJECT_NAME}
	src/math_application.cpp)

##### 3rd party

message(STATUS "CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}")

find_package(math_helper CONFIG REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE math_helper)

##### Test

include(CTest)	# call enable_testing()
add_subdirectory(test)
