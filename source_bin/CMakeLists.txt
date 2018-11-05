
##### Target

add_executable(${PROJECT_NAME}
	src/main.cpp
	src/factorial.cpp
	src/square_root.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE inc)
