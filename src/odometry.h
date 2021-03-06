#ifndef ODOMETRY_H
#define ODOMETRY_H


#include "includes.h"
#include "image.h"
#include "funciones_cuda.h"

class Odometry
{
private:
    int noFrames;
    //Vector of Images en las que se generara las imagenes
    std::vector<Image>* voImages;
    //Eigen Vector para almacenar las matrices de transformacion
    std::vector<Eigen::Matrix4d> voTransformations;

public:
    Odometry(std::vector<Image> *InputVector);

    //Realiza el calculo de las n-1 matrices de transformacion
    void CalcTransformations();

    int numberOfFrames();

    //Get functions (ith element);
    Image getImage(int i);
    Eigen::Matrix4d getTransformation(int i);

};

// Funcion para calcular la transformacion entre 2 frames
// Devuelve la mejor matrix de transformacion euclideana Source -> Target
// Usa RANSAC para la refinacion de la misma.
// Implementar
Eigen::Matrix4d ComputeOdometry(Image &source, Image &target);

// Realiza Feature GpuMatching entre dos imagenes
// Devuelve una dupla que son todas correspondencias de los Features
// GpuMatching vector Composition
// source_pixel(u,v),target_pixel(u,v)
std::vector<cv::DMatch> computeFeatureMatches(const cv::Mat &source,std::vector<cv::KeyPoint>& keypoints_s, const cv::Mat &target,std::vector<cv::KeyPoint>& keypoints_t);

// Calcula la matriz de transformacion Teniendo en cuenta
// que contamos con Known Correspondences(Feature Descriptors)
// Para ello calculamos una descomposion SVD a partir del proceso
// Detallado por Umeyana 1991
// Pasamos de Corrd en openCV a la lib Eigen
Eigen::Matrix4d QuickTransformation(const std::vector<Eigen::Vector3d> &p, const std::vector<Eigen::Vector3d> &q);

#endif // ODOMETRY_H
