
include(ExternalProject)
find_package(Git REQUIRED)

#list(APPEND CATCH_CMAKE_ARGS "-DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}")

ExternalProject_Add(
    catch
    GIT_REPOSITORY      https://github.com/catchorg/Catch2.git
    GIT_TAG             v2.4.2
    GIT_SHALLOW         1
    GIT_PROGRESS		FALSE
#    CMAKE_ARGS          ${CATCH_CMAKE_ARGS}
	CMAKE_ARGS			-DBUILD_TESTING=OFF
    PREFIX              ${CMAKE_BINARY_DIR}/external/catch
#    TMP_DIR             ${CMAKE_BINARY_DIR}/external/catch/tmp
#    STAMP_DIR           ${CMAKE_BINARY_DIR}/external/catch/stamp
#    DOWNLOAD_DIR        ${CMAKE_BINARY_DIR}/external/catch/download
#    SOURCE_DIR          ${CMAKE_BINARY_DIR}/external/catch/src
#    BINARY_DIR          ${CMAKE_BINARY_DIR}/external/catch/build
)

#set(Catch2_DIR ${CMAKE_BINARY_DIR}/lib/cmake CACHE PATH "")
set(Catch2_DIR ${CMAKE_BINARY_DIR}/lib/cmake/Catch2)

#ExternalProject_Get_Property(catch source_dir)
#message(STATUS "path = ${source_dir}")
#
#ExternalProject_Get_Property(catch install_dir)
#message(STATUS "path = ${install_dir}")
