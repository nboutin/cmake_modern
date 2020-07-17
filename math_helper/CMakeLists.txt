
cmake_minimum_required(VERSION 3.5)
project(math_helper
	VERSION 0.1.0
	LANGUAGES CXX)
	
include(GNUInstallDirs)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Wnon-virtual-dtor -Wshadow -Weffc++ -Wold-style-cast)

add_compile_options(-Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
	-Winit-self -Wmissing-declarations -Wmissing-include-dirs
	-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo
	-Wswitch-default -Wundef -Wno-unused -Wfatal-errors)
	
##### Target

add_library(${PROJECT_NAME} SHARED
	src/add.cpp)

target_include_directories(${PROJECT_NAME} 
	PUBLIC 
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/inc>
	$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

set_target_properties(${PROJECT_NAME} PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})


##### Install

#set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER inc/add.h)

install(TARGETS ${PROJECT_NAME}
		EXPORT ${PROJECT_NAME}Targets
		LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
		PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

install(FILES inc/add.h
	DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

#### Package

include(CMakePackageConfigHelpers)
set(CONFIG_PKG_DIR "lib/cmake")

configure_package_config_file(
	${CMAKE_CURRENT_SOURCE_DIR}/cmake/config.cmake.in
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake
	INSTALL_DESTINATION ${CONFIG_PKG_DIR}
#	NO_SET_AND_CHECK_MACRO
#	NO_CHECK_REQUIRED_COMPONENTS_MACRO
)

write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
	VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
	COMPATIBILITY AnyNewerVersion)

install(
	EXPORT ${PROJECT_NAME}Targets
	FILE ${PROJECT_NAME}Targets.cmake
	DESTINATION ${CONFIG_PKG_DIR})


install(
	FILES
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config-version.cmake
	DESTINATION ${CONFIG_PKG_DIR})
