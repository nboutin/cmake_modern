# CMake Modern
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![version](https://img.shields.io/badge/version-0.4.0-blue.svg)
[![Total alerts](https://img.shields.io/lgtm/alerts/g/nboutin/cmake_modern.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/nboutin/cmake_modern/alerts/)

Category | Master | Develop
--- | --- | ---
**Build status** | [![Master Build Status](https://travis-ci.com/nboutin/cmake_modern.svg?branch=master)](https://travis-ci.com/nboutin/cmake_modern) | [![Develop Build Status](https://travis-ci.com/nboutin/cmake_modern.svg?branch=develop)](https://travis-ci.com/nboutin/cmake_modern)
**Code coverage** | [![codecov](https://codecov.io/gh/nboutin/cmake_modern/branch/master/graph/badge.svg)](https://codecov.io/gh/nboutin/cmake_modern) | [![codecov](https://codecov.io/gh/nboutin/cmake_modern/branch/develop/graph/badge.svg)](https://codecov.io/gh/nboutin/cmake_modern)

# Why
I want to centralized all the informations that I have gathered using CMake and Travis-CI.

# What
## Done
### CMake
* Catch2 unittest
* Debug and Release configuration
* Make and Ninja build system
* GCC Warnings

### Travis-CI
* Email notification
* Check whitespace trailing
* GNU g++-5/6/7
* Clang 4.0, 5.0
* Unitttest execution
* CppCheck
* code coverage
* Google Address Sanitizer
* Google Undefined Sanitizer
* Google Thread Sanitizer

### Github
* Badges

## Future
* cmake ctest dashboard
* clang-tidy
* clang-format
* coveralls.io
* codecov.io
* Doxygen
* cmake-generator-expression
* Intel Memory Protection Extensions aka IMPX (-fcheck-pointer-bounds -mmpx)

# How-To

## Update cmake

https://stackoverflow.com/questions/49859457/how-to-reinstall-the-latest-cmake-version

Copy and add Kitware signing key

    wget -qO - https://apt.kitware.com/keys/kitware-archive-latest.asc |
    sudo apt-key add -

Ubuntu Bionic Beaver (18.04)

    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
    sudo apt-get update
    sudo apt-get install cmake


## Build
Generate build system and build executable

    $ cd cmake.org_tutorial
    $ cmake -H. -Bbuild 	# cmake version < 2.13
    $ cmake -S . -B build 	# cmake version >= 2.13
    $ cmake --build build -j
    
Use *ccmake* to configure option

    # option(<variable> "<help_text>" [value])
    option(USE_MYMATH "Use tutorial provided math implementation" ON)

## Install
Install library and executable

Use **--prefix** option to overwrite `CMAKE_INSTALL_PREFIX` default value

    $ cmake --install build --prefix install

## Test
Run test

    $ cmake --build build --target test

## Package

    $ cmake --build build --target package

# External Links
## Doc
* https://cgold.readthedocs.io/en/latest/overview.html
* https://gitlab.kitware.com/cmake/community/-/wikis/FAQ

## Tools
* https://travis-ci.com/
* https://codecov.io
* https://shields.io/#/
* https://lgtm.com/

## Example
* https://github.com/ainfosec/ci_helloworld
