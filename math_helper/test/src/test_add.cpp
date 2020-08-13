#include "add.h"

#include <catch.hpp>

TEST_CASE("add", "[add]") {
	using namespace math;
	REQUIRE(add(1, 2) == 3);
}
