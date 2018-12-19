#ifndef POINTCLOUD_H
#define POINTCLOUD_H

#include "includes.h"


class PointCloud
{
private:
    int width, height;
public:
    PointCloud();
    ~PointCloud(){}


    void EstimatePoints();
    void EstimateNormals();
    void EstimateColors();

    vector<vec3> Points;
    vector<vec3> Normals;
    vector<vec3> Colors;




    int NumberOfPixels();
};


#endif // POINTCLOUD_H
