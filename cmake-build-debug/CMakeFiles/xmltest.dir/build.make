# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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
CMAKE_COMMAND = /home/diogo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/212.5457.51/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/diogo/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/212.5457.51/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/diogo/Documents/svg

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/diogo/Documents/svg/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/xmltest.dir/depend.make
# Include the progress variables for this target.
include CMakeFiles/xmltest.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/xmltest.dir/flags.make

CMakeFiles/xmltest.dir/programs/xmltest.cpp.o: CMakeFiles/xmltest.dir/flags.make
CMakeFiles/xmltest.dir/programs/xmltest.cpp.o: ../programs/xmltest.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/diogo/Documents/svg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/xmltest.dir/programs/xmltest.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/xmltest.dir/programs/xmltest.cpp.o -c /home/diogo/Documents/svg/programs/xmltest.cpp

CMakeFiles/xmltest.dir/programs/xmltest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/xmltest.dir/programs/xmltest.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/diogo/Documents/svg/programs/xmltest.cpp > CMakeFiles/xmltest.dir/programs/xmltest.cpp.i

CMakeFiles/xmltest.dir/programs/xmltest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/xmltest.dir/programs/xmltest.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/diogo/Documents/svg/programs/xmltest.cpp -o CMakeFiles/xmltest.dir/programs/xmltest.cpp.s

# Object files for target xmltest
xmltest_OBJECTS = \
"CMakeFiles/xmltest.dir/programs/xmltest.cpp.o"

# External object files for target xmltest
xmltest_EXTERNAL_OBJECTS =

xmltest: CMakeFiles/xmltest.dir/programs/xmltest.cpp.o
xmltest: CMakeFiles/xmltest.dir/build.make
xmltest: libtinyxml2.a
xmltest: CMakeFiles/xmltest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/diogo/Documents/svg/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable xmltest"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/xmltest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/xmltest.dir/build: xmltest
.PHONY : CMakeFiles/xmltest.dir/build

CMakeFiles/xmltest.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/xmltest.dir/cmake_clean.cmake
.PHONY : CMakeFiles/xmltest.dir/clean

CMakeFiles/xmltest.dir/depend:
	cd /home/diogo/Documents/svg/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/diogo/Documents/svg /home/diogo/Documents/svg /home/diogo/Documents/svg/cmake-build-debug /home/diogo/Documents/svg/cmake-build-debug /home/diogo/Documents/svg/cmake-build-debug/CMakeFiles/xmltest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/xmltest.dir/depend

