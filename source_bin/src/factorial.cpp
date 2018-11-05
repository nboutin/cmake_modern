
#include "factorial.h"

namespace demo
{
unsigned int factorial(unsigned int number)
{
    return number > 1 ? factorial(number - 1) * number : 1;
}
}
