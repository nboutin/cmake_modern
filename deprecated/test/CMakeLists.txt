
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
	target_compile_options(business_logic PRIVATE -g -O0 -fprofile-arcs -ftest-coverage)
	target_link_libraries(business_logic PRIVATE --coverage)
endif()

if(ENABLE_ASAN)
	target_compile_options(business_logic PRIVATE -g -O1 -fno-omit-frame-pointer -fsanitize=leak)
	target_link_libraries(business_logic PRIVATE -fuse-ld=gold -fsanitize=address -static-libasan)
endif()

if(ENABLE_USAN)
	target_compile_options(business_logic PRIVATE -g -O1)
	target_link_libraries(business_logic PRIVATE -fsanitize=undefined -fuse-ld=gold)
endif()

if(ENABLE_TSAN)
	target_compile_options(business_logic PRIVATE -g -O0)
	target_link_libraries(business_logic PRIVATE -fsanitize=thread -fuse-ld=gold)
endif()

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
make_test(sqrt)
make_test(factorial)
