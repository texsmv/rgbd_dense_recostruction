cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

set (CMAKE_CXX_STANDARD  11)

project(app)

find_package(PCL 1.2 REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})

list(REMOVE_ITEM PCL_LIBRARIES "vtkproj4")

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable (app main.cpp src/funciones.cpp src/camera.cpp src/dataset.cpp src/image.cpp src/loadshader.cpp src/odometry.cpp src/pointcloud.cpp src/volumeintegrator.cpp)

target_link_libraries (app ${OpenCV_LIBS} ${PCL_LIBRARIES} ${OPENGL_LIBRARY} GLU GLEW glut glfw)