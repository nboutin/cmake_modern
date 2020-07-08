#include <iostream>

#include "math_library.h"

#include "version.h"

int main(int argc, char **argv) {

	if (argc < 2) {
		// report version
		std::cout << argv[0] << " Version " << tutorial_VERSION_MAJOR << "."
				<< tutorial_VERSION_MINOR << std::endl;
		std::cout << "Usage: " << argv[0] << " <number>" << std::endl;
		return EXIT_FAILURE;
	}

	const double input = std::stod(argv[1]);
	auto res = math_sqrt(input);
	std::cout << "sqrt " << input << " equal " << res << std::endl;
	return EXIT_SUCCESS;
}
