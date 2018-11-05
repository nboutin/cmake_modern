
# Add catch target
add_library(Catch INTERFACE)
target_include_directories(Catch INTERFACE external/catch2)
target_compile_features(Catch INTERFACE cxx_std_11)

# Add test
add_executable(test_sqrt 
	src/main.cpp
	src/test_sqrt.cpp)
target_link_libraries(test_sqrt PRIVATE Catch)
add_test(NAME test_sqrt COMMAND test_sqrt)

add_executable(test_factorial
	src/main.cpp
	src/test_factorial.cpp)
target_link_libraries(test_factorial PRIVATE Catch)
add_test(NAME test_factorial COMMAND test_factorial)
