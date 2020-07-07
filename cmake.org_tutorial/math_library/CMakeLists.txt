
add_library(math_library math_sqrt.cpp)

target_include_directories(math_library INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
