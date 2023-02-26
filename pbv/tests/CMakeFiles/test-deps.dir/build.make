# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zvi/smt-switch

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zvi/smt-switch/pbv

# Include any dependencies generated for this target.
include tests/CMakeFiles/test-deps.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/test-deps.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/test-deps.dir/flags.make

tests/CMakeFiles/test-deps.dir/available_solvers.cpp.o: tests/CMakeFiles/test-deps.dir/flags.make
tests/CMakeFiles/test-deps.dir/available_solvers.cpp.o: ../tests/available_solvers.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zvi/smt-switch/pbv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/test-deps.dir/available_solvers.cpp.o"
	cd /home/zvi/smt-switch/pbv/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-deps.dir/available_solvers.cpp.o -c /home/zvi/smt-switch/tests/available_solvers.cpp

tests/CMakeFiles/test-deps.dir/available_solvers.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-deps.dir/available_solvers.cpp.i"
	cd /home/zvi/smt-switch/pbv/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zvi/smt-switch/tests/available_solvers.cpp > CMakeFiles/test-deps.dir/available_solvers.cpp.i

tests/CMakeFiles/test-deps.dir/available_solvers.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-deps.dir/available_solvers.cpp.s"
	cd /home/zvi/smt-switch/pbv/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zvi/smt-switch/tests/available_solvers.cpp -o CMakeFiles/test-deps.dir/available_solvers.cpp.s

tests/CMakeFiles/test-deps.dir/test-utils.cpp.o: tests/CMakeFiles/test-deps.dir/flags.make
tests/CMakeFiles/test-deps.dir/test-utils.cpp.o: ../tests/test-utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zvi/smt-switch/pbv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object tests/CMakeFiles/test-deps.dir/test-utils.cpp.o"
	cd /home/zvi/smt-switch/pbv/tests && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test-deps.dir/test-utils.cpp.o -c /home/zvi/smt-switch/tests/test-utils.cpp

tests/CMakeFiles/test-deps.dir/test-utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-deps.dir/test-utils.cpp.i"
	cd /home/zvi/smt-switch/pbv/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zvi/smt-switch/tests/test-utils.cpp > CMakeFiles/test-deps.dir/test-utils.cpp.i

tests/CMakeFiles/test-deps.dir/test-utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-deps.dir/test-utils.cpp.s"
	cd /home/zvi/smt-switch/pbv/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zvi/smt-switch/tests/test-utils.cpp -o CMakeFiles/test-deps.dir/test-utils.cpp.s

# Object files for target test-deps
test__deps_OBJECTS = \
"CMakeFiles/test-deps.dir/available_solvers.cpp.o" \
"CMakeFiles/test-deps.dir/test-utils.cpp.o"

# External object files for target test-deps
test__deps_EXTERNAL_OBJECTS =

tests/libtest-deps.so: tests/CMakeFiles/test-deps.dir/available_solvers.cpp.o
tests/libtest-deps.so: tests/CMakeFiles/test-deps.dir/test-utils.cpp.o
tests/libtest-deps.so: tests/CMakeFiles/test-deps.dir/build.make
tests/libtest-deps.so: libsmt-switch.so
tests/libtest-deps.so: tests/CMakeFiles/test-deps.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zvi/smt-switch/pbv/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library libtest-deps.so"
	cd /home/zvi/smt-switch/pbv/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-deps.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/test-deps.dir/build: tests/libtest-deps.so

.PHONY : tests/CMakeFiles/test-deps.dir/build

tests/CMakeFiles/test-deps.dir/clean:
	cd /home/zvi/smt-switch/pbv/tests && $(CMAKE_COMMAND) -P CMakeFiles/test-deps.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/test-deps.dir/clean

tests/CMakeFiles/test-deps.dir/depend:
	cd /home/zvi/smt-switch/pbv && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zvi/smt-switch /home/zvi/smt-switch/tests /home/zvi/smt-switch/pbv /home/zvi/smt-switch/pbv/tests /home/zvi/smt-switch/pbv/tests/CMakeFiles/test-deps.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/test-deps.dir/depend

