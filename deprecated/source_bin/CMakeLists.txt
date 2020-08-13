
##### Target

add_executable(${PROJECT_NAME}
	src/main.cpp
	src/factorial.cpp
	src/square_root.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE inc)

##### 3rd party

#find_package(PkgConfig REQUIRED)
#
#pkg_check_modules(OFX REQUIRED libofx>=0.9.12)
#
#target_include_directories(${PROJECT_NAME} PRIVATE ${OFX_INCLUDE_DIRS})
#target_compile_options(${PROJECT_NAME} PRIVATE ${OFX_CFLAGS_OTHER})
#target_link_libraries(${PROJECT_NAME} PRIVATE ${OFX_LIBRARIES})
