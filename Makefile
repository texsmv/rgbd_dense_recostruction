FLAGS = -lGL -lglut -lGLEW -lGLU -std=c++11 -w `pkg-config opencv --cflags --libs`

# visualization = volumeintegrator.o
# geometry = pointcloud.o odometry.o addfunctions.o
# objects = image.o dataset.o camera.o loadshader.o main.o
objects = camera.o main.o odometry.o image.o dataset.o pointcloud.o funciones.o

%.o: %.cpp $(DEPS)
	g++ $(FLAGS) -c -o $@ $<

# all: $(objects) $(geometry) $(visualization)
# g++ $(objects) $(geometry) $(visualization) -o app $(FLAGS)
all: $(objects)
	g++ $(objects) -o app $(FLAGS)
clean:
	rm -f *.o app
