
#include "square_root.h"

#include <catch.hpp>

TEST_CASE("sqrt", "[sqrt]")
{
	using namespace demo;
	REQUIRE(square_root(4) == 2);
}
