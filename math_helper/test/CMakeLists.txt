
# Add catch target
add_library(Catch INTERFACE)
target_include_directories(Catch INTERFACE external/catch2)
target_compile_features(Catch INTERFACE cxx_std_11)

# Create library for business logic
add_library(business_logic SHARED
	${CMAKE_SOURCE_DIR}/src/add.cpp)

target_include_directories(business_logic PUBLIC ${CMAKE_SOURCE_DIR}/inc)
set_target_properties(business_logic PROPERTIES LINKER_LANGUAGE CXX)

# arg: name test
function(make_test arg)

	add_executable(test_${arg} src/main.cpp src/test_${arg}.cpp)

	target_link_libraries(test_${arg} PRIVATE Catch business_logic)

	if(ENABLE_TSAN)
		target_compile_options(test_${arg} PRIVATE -g -O0)
		target_link_libraries(test_${arg} PRIVATE -fsanitize=thread -fuse-ld=gold)
	endif()

	add_test(NAME test_${arg} COMMAND test_${arg})

endfunction()

# Add test
make_test(add)