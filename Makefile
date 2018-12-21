# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_SOURCE_DIR = "/home/texsmv/MEGA/Proyectos/3d reconstruction/repos/rgbd_dense_recostruction"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/texsmv/MEGA/Proyectos/3d reconstruction/repos/rgbd_dense_recostruction"

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start "/home/texsmv/MEGA/Proyectos/3d reconstruction/repos/rgbd_dense_recostruction/CMakeFiles" "/home/texsmv/MEGA/Proyectos/3d reconstruction/repos/rgbd_dense_recostruction/CMakeFiles/progress.marks"
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start "/home/texsmv/MEGA/Proyectos/3d reconstruction/repos/rgbd_dense_recostruction/CMakeFiles" 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named app

# Build rule for target.
app: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 app
.PHONY : app

# fast build rule for target.
app/fast:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/build
.PHONY : app/fast

main.o: main.cpp.o

.PHONY : main.o

# target to build an object file
main.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/main.cpp.o
.PHONY : main.cpp.o

main.i: main.cpp.i

.PHONY : main.i

# target to preprocess a source file
main.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/main.cpp.i
.PHONY : main.cpp.i

main.s: main.cpp.s

.PHONY : main.s

# target to generate assembly for a file
main.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/main.cpp.s
.PHONY : main.cpp.s

src/camera.o: src/camera.cpp.o

.PHONY : src/camera.o

# target to build an object file
src/camera.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/camera.cpp.o
.PHONY : src/camera.cpp.o

src/camera.i: src/camera.cpp.i

.PHONY : src/camera.i

# target to preprocess a source file
src/camera.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/camera.cpp.i
.PHONY : src/camera.cpp.i

src/camera.s: src/camera.cpp.s

.PHONY : src/camera.s

# target to generate assembly for a file
src/camera.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/camera.cpp.s
.PHONY : src/camera.cpp.s

src/dataset.o: src/dataset.cpp.o

.PHONY : src/dataset.o

# target to build an object file
src/dataset.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/dataset.cpp.o
.PHONY : src/dataset.cpp.o

src/dataset.i: src/dataset.cpp.i

.PHONY : src/dataset.i

# target to preprocess a source file
src/dataset.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/dataset.cpp.i
.PHONY : src/dataset.cpp.i

src/dataset.s: src/dataset.cpp.s

.PHONY : src/dataset.s

# target to generate assembly for a file
src/dataset.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/dataset.cpp.s
.PHONY : src/dataset.cpp.s

src/funciones.o: src/funciones.cpp.o

.PHONY : src/funciones.o

# target to build an object file
src/funciones.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/funciones.cpp.o
.PHONY : src/funciones.cpp.o

src/funciones.i: src/funciones.cpp.i

.PHONY : src/funciones.i

# target to preprocess a source file
src/funciones.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/funciones.cpp.i
.PHONY : src/funciones.cpp.i

src/funciones.s: src/funciones.cpp.s

.PHONY : src/funciones.s

# target to generate assembly for a file
src/funciones.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/funciones.cpp.s
.PHONY : src/funciones.cpp.s

src/image.o: src/image.cpp.o

.PHONY : src/image.o

# target to build an object file
src/image.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/image.cpp.o
.PHONY : src/image.cpp.o

src/image.i: src/image.cpp.i

.PHONY : src/image.i

# target to preprocess a source file
src/image.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/image.cpp.i
.PHONY : src/image.cpp.i

src/image.s: src/image.cpp.s

.PHONY : src/image.s

# target to generate assembly for a file
src/image.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/image.cpp.s
.PHONY : src/image.cpp.s

src/loadshader.o: src/loadshader.cpp.o

.PHONY : src/loadshader.o

# target to build an object file
src/loadshader.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/loadshader.cpp.o
.PHONY : src/loadshader.cpp.o

src/loadshader.i: src/loadshader.cpp.i

.PHONY : src/loadshader.i

# target to preprocess a source file
src/loadshader.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/loadshader.cpp.i
.PHONY : src/loadshader.cpp.i

src/loadshader.s: src/loadshader.cpp.s

.PHONY : src/loadshader.s

# target to generate assembly for a file
src/loadshader.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/loadshader.cpp.s
.PHONY : src/loadshader.cpp.s

src/odometry.o: src/odometry.cpp.o

.PHONY : src/odometry.o

# target to build an object file
src/odometry.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/odometry.cpp.o
.PHONY : src/odometry.cpp.o

src/odometry.i: src/odometry.cpp.i

.PHONY : src/odometry.i

# target to preprocess a source file
src/odometry.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/odometry.cpp.i
.PHONY : src/odometry.cpp.i

src/odometry.s: src/odometry.cpp.s

.PHONY : src/odometry.s

# target to generate assembly for a file
src/odometry.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/odometry.cpp.s
.PHONY : src/odometry.cpp.s

src/pointcloud.o: src/pointcloud.cpp.o

.PHONY : src/pointcloud.o

# target to build an object file
src/pointcloud.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/pointcloud.cpp.o
.PHONY : src/pointcloud.cpp.o

src/pointcloud.i: src/pointcloud.cpp.i

.PHONY : src/pointcloud.i

# target to preprocess a source file
src/pointcloud.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/pointcloud.cpp.i
.PHONY : src/pointcloud.cpp.i

src/pointcloud.s: src/pointcloud.cpp.s

.PHONY : src/pointcloud.s

# target to generate assembly for a file
src/pointcloud.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/pointcloud.cpp.s
.PHONY : src/pointcloud.cpp.s

src/volumeintegrator.o: src/volumeintegrator.cpp.o

.PHONY : src/volumeintegrator.o

# target to build an object file
src/volumeintegrator.cpp.o:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/volumeintegrator.cpp.o
.PHONY : src/volumeintegrator.cpp.o

src/volumeintegrator.i: src/volumeintegrator.cpp.i

.PHONY : src/volumeintegrator.i

# target to preprocess a source file
src/volumeintegrator.cpp.i:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/volumeintegrator.cpp.i
.PHONY : src/volumeintegrator.cpp.i

src/volumeintegrator.s: src/volumeintegrator.cpp.s

.PHONY : src/volumeintegrator.s

# target to generate assembly for a file
src/volumeintegrator.cpp.s:
	$(MAKE) -f CMakeFiles/app.dir/build.make CMakeFiles/app.dir/src/volumeintegrator.cpp.s
.PHONY : src/volumeintegrator.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... app"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
	@echo "... src/camera.o"
	@echo "... src/camera.i"
	@echo "... src/camera.s"
	@echo "... src/dataset.o"
	@echo "... src/dataset.i"
	@echo "... src/dataset.s"
	@echo "... src/funciones.o"
	@echo "... src/funciones.i"
	@echo "... src/funciones.s"
	@echo "... src/image.o"
	@echo "... src/image.i"
	@echo "... src/image.s"
	@echo "... src/loadshader.o"
	@echo "... src/loadshader.i"
	@echo "... src/loadshader.s"
	@echo "... src/odometry.o"
	@echo "... src/odometry.i"
	@echo "... src/odometry.s"
	@echo "... src/pointcloud.o"
	@echo "... src/pointcloud.i"
	@echo "... src/pointcloud.s"
	@echo "... src/volumeintegrator.o"
	@echo "... src/volumeintegrator.i"
	@echo "... src/volumeintegrator.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

