
cmake_minimum_required(VERSION 3.5.0)
project(cmake_modern
	VERSION 0.1.0
	LANGUAGES CXX)

##### Compile options

add_compile_options(-Wall -Werror -Wextra -Wpedantic -Wnon-virtual-dtor -Wshadow -Weffc++ -Wold-style-cast)

add_compile_options(-Wcast-align -Wcast-qual -Wctor-dtor-privacy -Wdisabled-optimization -Wformat=2
	-Winit-self -Wmissing-declarations -Wmissing-include-dirs
	-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo
	-Wswitch-default -Wundef -Wno-unused -Wfatal-errors)
	
##### Target

add_executable(${PROJECT_NAME}
	src/math_application.cpp)

##### 3rd party

find_package(math_helper REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE math_helper)
