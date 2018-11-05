
#include "factorial.h"

#include <catch.hpp>

TEST_CASE("factorial", "[factorial]")
{
	using namespace demo;
    REQUIRE(factorial(0) == 1);
    REQUIRE(factorial(1) == 1);
    REQUIRE(factorial(2) == 2);
    REQUIRE(factorial(3) == 6);
    REQUIRE(factorial(10) == 3628800);
}
