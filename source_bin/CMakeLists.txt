
##### Target

add_executable(${PROJECT_NAME}
	src/main.cpp
	src/template.cpp)

target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Werror -Wextra -Wpedantic)

target_include_directories(${PROJECT_NAME} PRIVATE inc)
