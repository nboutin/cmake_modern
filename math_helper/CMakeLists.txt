
cmake_minimum_required(VERSION 3.5)
project(math_helper
	VERSION 0.1.0
	LANGUAGES CXX)
	
##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Wnon-virtual-dtor -Wshadow -Weffc++ -Wold-style-cast)

add_compile_options(-Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
	-Winit-self -Wmissing-declarations -Wmissing-include-dirs
	-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo
	-Wswitch-default -Wundef -Wno-unused -Wfatal-errors)
	
##### Target

add_library(${PROJECT_NAME} SHARED
	src/add.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE inc)

set_target_properties(${PROJECT_NAME} PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR})


##### Install

include(GNUInstallDirs)

set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER inc/add.h)

# DESTINATION is only need for project-specific needs
install(TARGETS ${PROJECT_NAME}
#	LIBRARY DESTINATION lib
#	PUBLIC_HEADER DESTINATION include
)
