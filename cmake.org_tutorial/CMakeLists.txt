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

install(TARGETS tutorial
		DESTINATION bin)
install(FILES ${PROJECT_BINARY_DIR}/version.h
		DESTINATION include)

##### Test

include(CTest)	# call enable_testing()

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

##### Package

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.md")
set(CPACK_PACKAGE_VERSION_MAJOR "${tutorial_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${tutorial_VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${tutorial_VERSION_PATCH}")
include(CPack)

##### Export

#install(EXPORT math_library_target
#		FILE MathFunctionsTargets.cmake
#		DESTINATION lib/cmake/MathLibrary)

include(CMakePackageConfigHelpers)
configure_package_config_file(
	${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
	${CMAKE_CURRENT_BINARY_DIR}/MathLibraryConfig.cmake
	INSTALL_DESTINATION "lib/cmake/example"
	NO_SET_AND_CHECK_MACRO
	NO_CHECK_REQUIRED_COMPONENTS_MACRO
	)

write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/MathLibraryConfigVersion.cmake
	VERSION ${tutorial_VERSION_MARJOR}.${tutorial_VERSION_MINOR}
	COMPATIBILITY AnyNewerVersion)

install(
	FILES ${CMAKE_CURRENT_BINARY_DIR}/MathLibraryConfig.cmake
	DESTINATION lib/cmake/MathFunctions)

# project can be used from build directory
export(
	EXPORT math_library_target
	FILE ${CMAKE_CURRENT_BINARY_DIR}/MathLibraryTargets.cmake)
