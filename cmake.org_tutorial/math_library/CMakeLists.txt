
add_executable(make_table make_table.cpp)

add_custom_command(
	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/table.h
	COMMAND make_table ${CMAKE_CURRENT_BINARY_DIR}/table.h
	DEPENDS make_table)

add_library(math_library 
	math_sqrt.cpp
	${CMAKE_CURRENT_BINARY_DIR}/table.h # add dependencie to table.h
	)

target_include_directories(math_library 
	INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
	PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

install(TARGETS math_library DESTINATION lib)
install(FILES math_library.h DESTINATION include)
