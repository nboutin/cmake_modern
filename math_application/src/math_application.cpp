#include <cstdlib>
#include <iostream>

#include "add.h"

int main(int argc, char **argv) {
	using namespace std;

	(void) argc;
	(void) argv;

	cout << "add 1, 2 = " << math::add(1, 2) << endl;

	return EXIT_SUCCESS;
}
