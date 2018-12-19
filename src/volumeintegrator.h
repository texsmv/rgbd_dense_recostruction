#ifndef VOLUMEINTEGRATOR_H
#define VOLUMEINTEGRATOR_H

#include "odometry.h"
#include "image.h"
#include "visualoctree.h"


class VolumeIntegrator
{
private:
    int noFrames;
    std::vector<PointCloud> PointClouds;
    std::vector<Eigen::Matrix4d> Transformations;
    std::vector<glm::mat4> GLTransformations;



    VisualOcTree<float> *tsdf;

public:
    VolumeIntegrator(Odometry &source);
    VolumeIntegrator(DataSet * _dataset, int from, int to, int intrinsics);

    void AlignClouds(); // Funcion que calcula las matrices de transformacion y agrega los puntos a un vector global

    void GenerateGLGeometry(int,int);
    int VisualMode();

    int TotalPoints();

    vec3* point_data();
    vec3* color_data();
    vec3* normal_data();
    std::vector<vec3> point_vector();
    std::vector<vec3> color_vector();
    std::vector<vec3> normal_vector();

    void PrintInfo();

};

#endif // VOLUMEINTEGRATOR_H
