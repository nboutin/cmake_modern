cmake_minimum_required(VERSION 3.10)

project(tutorial VERSION 1.0.0)

option(USE_MY_OFF_OPTION "" OFF)
option(USE_MATH_LIBRARY "Use math library" ON)

configure_file(version.h.in version.h)

add_subdirectory(math_library)

add_executable(tutorial main_tutorial.cpp)

target_compile_features(tutorial PRIVATE cxx_std_11)

target_include_directories(tutorial PUBLIC
	${PROJECT_BINARY_DIR}
	${PROJECT_SOURCE_DIR}/math_library)
	
target_link_libraries(tutorial PUBLIC math_library)
	