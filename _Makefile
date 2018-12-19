
FLAGS = -leasy3d -lGL -lglut -lGLEW -lGLU -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -lopencv_videoio -std=c++11 -w `pkg-config opencv --cflags --libs glew`

# visualization = volumeintegrator.o
# geometry = pointcloud.o odometry.o addfunctions.o
# objects = image.o dataset.o camera.o loadshader.o main.o
objects = camera.o  odometry.o image.o dataset.o pointcloud.o funciones.o loadshader.o volumeintegrator.o main.o
#
# %.o: %.cpp $(DEPS)
# 	g++ $(FLAGS) -c -o $@ $<

%.o: src/%.cpp  $(DEPS)
	g++ $(FLAGS) -c -o $@ $<

%.o: %.cpp  $(DEPS)
	g++ $(FLAGS) -c -o $@ $<


all: $(objects)
	g++  $(objects) -o app $(FLAGS)
	# %.o: %.cu $(DEPS)
	# 	nvcc $(FLAGS) -c -o $@ $<
	# funciones_cuda.o:
	# 	nvcc -c funciones_cuda.cu




	# all: $(objects) $(geometry) $(visualization)
	# g++ $(objects) $(geometry) $(visualization) -o app $(FLAGS)

	# cuda_objects = funciones_cuda.o


clean:
	rm *.o

# all: program
#
# program: funciones_cuda.o
# 	g++ $(FLAGS) -c -o program main.cpp  funciones_cuda.o
#
# funciones_cuda.o:
# 	nvcc -c funciones_cuda.cu
#
# clean: rm -rf *o program
