cmake_minimum_required(VERSION 3.10)

project(tutorial VERSION 1.0.0)

option(USE_MY_OFF_OPTION "See generated config.h file" OFF)
option(USE_MATH_LIBRARY "Use math library" ON)

configure_file(version.h.in version.h)

add_subdirectory(math_library)

add_executable(tutorial main_tutorial.cpp)

target_compile_features(tutorial PRIVATE cxx_std_11)

target_include_directories(tutorial PUBLIC
	${PROJECT_BINARY_DIR})
	
target_link_libraries(tutorial PUBLIC math_library)

##### Install

install(TARGETS tutorial DESTINATION bin)
install(FILES ${PROJECT_BINARY_DIR}/version.h DESTINATION include)

##### Test

enable_testing()

# Test that the application runs, no segfault or crashes and return 0
add_test(NAME runs COMMAND tutorial 25)

# Test that help message work, check its format using regular expression
add_test(NAME help COMMAND tutorial)
set_tests_properties(help PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*<number>")

# Function to add test using regular expression
function(do_test target arg result)
	add_test(NAME comp${arg} COMMAND ${target} ${arg})
	set_tests_properties(comp${arg} PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endfunction(do_test)

do_test(tutorial 4 "sqrt 4 equal 2")
do_test(tutorial 5 "sqrt 5 equal 2.236")
do_test(tutorial -25 "sqrt -25 equal [-nan|0]")
