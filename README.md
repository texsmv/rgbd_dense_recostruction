# Reconstrucción 3D con Imágenes RGB-D

El presente repositorio contiene la implementación de un sistema que genera nube de puntos y mallas 3D a partir de imágenes RGB-D. Las principales librerías de ayuda utilizadas fueron:

  - OpenCV
  - Eigen
  - Point Cloud Library (PCL)
  
Para la compilación del programa, correr CMake dentro de la carpeta y compilar apropiadamente. La aplicación generada es "app". En las directivas en el archivo "main.cpp" se define la base de datos a ser utilizada, la cual se recomienda que se encuentre dentro de una carpeta "data" dentro del proyecto. La base de datos a ser usada debe contener dos carpetas con los frames correspondientes para RGB y Depth (algunos ejemplos pueden ser encontrados en https://vision.in.tum.de/data/datasets/rgbd-dataset/download).

El presente trabajo fue realizado para el curso de Computación Gráfica de la carrera Ciencia de la Computación de la Universidad Nacional de San Agustín.
