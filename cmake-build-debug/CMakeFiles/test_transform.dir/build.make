# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/diogo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/213.5744.254/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/diogo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/213.5744.254/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/diogo/Documents/svg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/diogo/Documents/svg/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/test_transform.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/test_transform.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_transform.dir/flags.make

CMakeFiles/test_transform.dir/test/test_transform.cpp.o: CMakeFiles/test_transform.dir/flags.make
CMakeFiles/test_transform.dir/test/test_transform.cpp.o: ../test/test_transform.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/diogo/Documents/svg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_transform.dir/test/test_transform.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_transform.dir/test/test_transform.cpp.o -c /home/diogo/Documents/svg/test/test_transform.cpp

CMakeFiles/test_transform.dir/test/test_transform.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_transform.dir/test/test_transform.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/diogo/Documents/svg/test/test_transform.cpp > CMakeFiles/test_transform.dir/test/test_transform.cpp.i

CMakeFiles/test_transform.dir/test/test_transform.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_transform.dir/test/test_transform.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/diogo/Documents/svg/test/test_transform.cpp -o CMakeFiles/test_transform.dir/test/test_transform.cpp.s

# Object files for target test_transform
test_transform_OBJECTS = \
"CMakeFiles/test_transform.dir/test/test_transform.cpp.o"

# External object files for target test_transform
test_transform_EXTERNAL_OBJECTS =

test_transform: CMakeFiles/test_transform.dir/test/test_transform.cpp.o
test_transform: CMakeFiles/test_transform.dir/build.make
test_transform: libsvg.a
test_transform: libtinyxml2.a
test_transform: lib/libgtestd.a
test_transform: lib/libgtest_maind.a
test_transform: lib/libgtestd.a
test_transform: CMakeFiles/test_transform.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/diogo/Documents/svg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_transform"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_transform.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_transform.dir/build: test_transform
.PHONY : CMakeFiles/test_transform.dir/build

CMakeFiles/test_transform.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_transform.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_transform.dir/clean

CMakeFiles/test_transform.dir/depend:
	cd /home/diogo/Documents/svg/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/diogo/Documents/svg /home/diogo/Documents/svg /home/diogo/Documents/svg/cmake-build-debug /home/diogo/Documents/svg/cmake-build-debug /home/diogo/Documents/svg/cmake-build-debug/CMakeFiles/test_transform.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_transform.dir/depend

