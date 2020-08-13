
# Test that the application runs, no segfault or crashes and return 0
add_test(NAME runs COMMAND math_application 1 2)

# Test that help message work, check its format using regular expression
add_test(NAME help COMMAND math_application)
set_tests_properties(help PROPERTIES PASS_REGULAR_EXPRESSION "Usage:")
