cmake_minimum_required(VERSION 3.10)

project(tutorial VERSION 1.0.0)

configure_file(version.h.in version.h)

add_executable(tutorial main_tutorial.cpp)

target_include_directories(tutorial PUBLIC
	${PROJECT_BINARY_DIR})
	
target_compile_features(tutorial PRIVATE cxx_std_11)