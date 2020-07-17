#!/bin/bash
# -e exit as soon as an error occur
# -v print line before execution
set -ev

rm -rf install
rm -rf math_helper/build
cmake -Hmath_helper -Bmath_helper/build
cmake --build math_helper/build
cmake --install math_helper/build --prefix install

rm -rf math_application/build
cmake -Hmath_application -Bmath_application/build -DCMAKE_PREFIX_PATH=../install/lib/cmake
cmake --build math_application/build
