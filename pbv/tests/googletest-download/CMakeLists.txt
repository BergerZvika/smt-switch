cmake_minimum_required(VERSION 3.1)

project(googletest-download NONE)

include(ExternalProject)
ExternalProject_Add(googletest
  GIT_REPOSITORY    https://github.com/google/googletest.git
  # Temporary: to avoid https://github.com/google/googletest/issues/2711
  GIT_TAG           release-1.10.0
  SOURCE_DIR        "/home/zvi/smt-switch/pbv/tests/googletest-src"
  BINARY_DIR        "/home/zvi/smt-switch/pbv/tests/googletest-build"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND     ""
  INSTALL_COMMAND   ""
  TEST_COMMAND      ""
)
