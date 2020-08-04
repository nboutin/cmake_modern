#include <cstdlib>
#include <iostream>

#include "add.h"

void help();

int main(int argc, char **argv) {
	using namespace std;

	if (argc == 4) {
		string op(argv[1]);
		if (op == "add") {
			int a = atoi(argv[2]);
			int b = atoi(argv[3]);
			cout << "add " << a << " " << b << " = " << math::add(a, b) << endl;
		} else {
			help();
		}
	} else {
		help();
	}
	return EXIT_SUCCESS;
}

void help() {
	using namespace std;
	cout << "Usage: math_application add a b" << endl;
}
