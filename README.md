# CMake Modern
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![version](https://img.shields.io/badge/dynamic/json?label=version&query=version&url=https%3A%2F%2Fraw.githubusercontent.com%2Fnboutin%2Fcmake_modern%2Fmaster%2Fpackage.json)
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
* Ubuntu 18.04 Bionic Beaver

### Github
* Dynamic badges (for version)

## Future
* CTest dashboard
* cmake compiler files for stm32
* cmake-packages
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

## Target
List available target

    $ cmake --build build --target help
    The following are some of the valid targets for this Makefile:
    ... all (the default if no target is provided)
    ... clean
    ... install
    ... package
    ... package_source
    ... test
    ... Continuous
    ... Experimental
    ... ExperimentalBuild
    ... ExperimentalConfigure
    ... ExperimentalCoverage
    ... ExperimentalMemCheck
    ... ExperimentalStart
    ... ExperimentalSubmit
    ... ExperimentalTest
    ... ExperimentalUpdate
    ... Nightly
    ... make_table
    ... math_library
    ... tutorial
    

## Test
Run test

    $ cmake --build build --target test

## Package

    $ cmake --build build --target package

## Dashboard

    $ cmake --build build --target Experimental

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
