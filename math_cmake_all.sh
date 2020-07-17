#!/bin/bash

rm -rf install
rm -rf math_helper/build
cmake -Hmath_helper -Bmath_helper/build
cmake --build math_helper/build
cmake --install math_helper/build --prefix install

rm -rf math_application/build
cmake -Hmath_application -Bmath_application/build
cmake --build math_application/build
