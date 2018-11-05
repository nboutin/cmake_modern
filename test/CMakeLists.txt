
# Add catch target
add_library(Catch INTERFACE)
target_include_directories(Catch INTERFACE external/catch2)
target_compile_features(Catch INTERFACE cxx_std_11)

# arg: name test
function(make_test arg)
	add_executable(test_${arg} src/main.cpp src/test_${arg}.cpp)
	target_link_libraries(test_${arg} PRIVATE Catch)
	add_test(NAME test_${arg} COMMAND test_${arg})
endfunction()

# Add test
make_test(sqrt)
make_test(factorial)
