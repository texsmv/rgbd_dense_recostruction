#include "image.h"




Image::Image(DataSet * _dataset, int frame_number, int intrinsics){
    dataset = _dataset;
    noframe = frame_number;

    Intrinsics = new Camera(intrinsics); // Los intrinsics son inizializados por defecto

    //Leemos la imagen y almacenamos en un objeto cv::Mat
    RGB_frame = cv::imread(dataset->getRGB_filename(noframe));


    DEPTH_frame = cv::imread(dataset->getDEPTH_filename(noframe),cv::IMREAD_ANYDEPTH);


    width = RGB_frame.cols;
    height = RGB_frame.rows;
    pixelCount = width * height;

    //Creamos nuestro PointCloud
    point_cloud = new PointCloud();

    //Creamos referencias a nuestros vectores contenedores
    std::vector<vec3> &Points = point_cloud->Points;
    std::vector<vec3> &Normals = point_cloud->Normals;
    std::vector<vec3> &Colors = point_cloud->Colors;
    Points.resize(pixelCount);
    Normals.resize(pixelCount);
    Colors.resize(pixelCount);

    FillPointCloudData();
}

cv::Mat Image::get_RGB_Mat()
{
    return RGB_frame;
}

cv::Mat Image::get_DEPTH_Mat()
{
    return DEPTH_frame;
}

Eigen::Vector3d Image::get_EigenCoordFromPixel(int u, int v)
{
    int i = u + v * FrameWidth;
    vec3 c = point_cloud->Points[i];
    return Eigen::Vector3d(c.x,c.y,c.z);
}

cv::Point3f Image::get_CVCoordFromPixel(int u, int v)
{

    int i = u + v * FrameWidth;
    vec3 c = point_cloud->Points[i];
    return cv::Point3f(c.x,c.y,c.z);
}

cv::Point3i Image::get_CVColorFromPixel(int u, int v)
{
    int i = u + v * FrameWidth;
    vec3 c = point_cloud->Colors[i];
    return cv::Point3i((int)c.r, (int)c.g, (int)c.b );
}

const PointCloud &Image::getGLPointCloud() const
{
    return *point_cloud;
}

vec3 Image::getPointFromPointCloud(int k)
{
    return point_cloud->Points[k];
}

vec3 Image::getColorFromPointCloud(int k)
{
    return point_cloud->Colors[k];
}

vec3 Image::getNormalFromPointCloud(int k)
{
    return point_cloud->Normals[k];
}

void Image::PrintInfo()
{
    //Verifiquemos el contenido
    for(int i = 10000 ; i < 50000;i++){
        auto p = point_cloud->Points[i];
        cout << "(" << p.x << "," <<
                p.y << "," <<
                p.z << ")";
    } cout << endl;
}


void Image::FillPointCloudData()
{
    //Creamos referencias a nuestros vectores contenedores
    std::vector<vec3> &Points = point_cloud->Points;
    std::vector<vec3> &Normals = point_cloud->Normals;
    std::vector<vec3> &Colors = point_cloud->Colors;

    //Estimamos las Coordenadas Locales para cada pixel en el frame
    uint16_t *pSource = (uint16_t*) DEPTH_frame.data;

    //Pasamos de coordenadas (u,v,s) en 2D a (x,y,z) Coordenadas Locales
    for(int v = 0; v < height; v++)
        for(int u = 0; u < width; u++){
            uint16_t value = (uint16_t) (*(pSource)); // Leyendo los valores para 16 Bits
            int i = u + v * width; //Valor para iterar sobre nuestro FlatVector
            //int key = cv::waitKey(5000);
            //cout << i<<": "<< value << endl;
            if(value != 0){
                Points[i].z = value / Intrinsics->depthFactor ; // Valor en Z
                Points[i].x = (u - Intrinsics->cx) * Points[i].z / Intrinsics->fx; // Valor en X
                Points[i].y = (v - Intrinsics->cy) * Points[i].z / Intrinsics->fy; // Valor en X
            }else{
                Points[i].x = 0;
                Points[i].y = 0;
                Points[i].z = 0;
            }
            pSource++;
        }
    // Registramos los colores
    for(int v = 0; v < height; v++)
        for(int u = 0; u < width; u++){
            int i = u + v * width;

            int b = RGB_frame.at<cv::Vec3b>(v,u)[0];
            int g = RGB_frame.at<cv::Vec3b>(v,u)[1];
            int r = RGB_frame.at<cv::Vec3b>(v,u)[2];

            Colors[i] = vec3(r,g,b) / 255.0f;
        }

    //Estimamos las normales(Por el momento valor por defecto)
    for(int v = 0; v < height; v++)
        for(int u = 0; u < width; u++){
            int i = u + v * width;
            Normals[i] = vec3(1.0f,1.0f,1.0f);
        }


}