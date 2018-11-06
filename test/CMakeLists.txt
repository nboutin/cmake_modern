
# Add catch target
add_library(Catch INTERFACE)
target_include_directories(Catch INTERFACE external/catch2)
target_compile_features(Catch INTERFACE cxx_std_11)

# Create library for business logic
add_library(business_logic SHARED
	${CMAKE_SOURCE_DIR}/source_bin/src/factorial.cpp
	${CMAKE_SOURCE_DIR}/source_bin/src/square_root.cpp)

target_include_directories(business_logic PUBLIC ${CMAKE_SOURCE_DIR}/source_bin/inc)
set_target_properties(business_logic PROPERTIES LINKER_LANGUAGE CXX)

if(ENABLE_COVERAGE)
	# TODO check that we use build_type = Debug
	target_compile_options(business_logic PRIVATE -g -O0 -fprofile-arcs -ftest-coverage --coverage)
	target_link_libraries(business_logic PRIVATE gcov)
endif()

# arg: name test
function(make_test arg)
	add_executable(test_${arg} src/main.cpp src/test_${arg}.cpp)
	target_link_libraries(test_${arg} PRIVATE Catch business_logic)
	add_test(NAME test_${arg} COMMAND test_${arg})
endfunction()

# Add test
make_test(sqrt)
make_test(factorial)
