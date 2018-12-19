#include "src/includes.h"
#include "src/loadshader.h"
#include "src/dataset.h"
#include "src/image.h"
#include "src/odometry.h"
#include "src/volumeintegrator.h"
#include <pcl/point_types.h>
#include <pcl/io/pcd_io.h>
#include <pcl/kdtree/kdtree_flann.h>
#include <pcl/features/normal_3d.h>
#include <pcl/surface/gp3.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/io/pcd_io.h>
#include <pcl/io/vtk_io.h>

//#define DATABASE_NAME "data/burghers_sample_png"
//#define DATABASE_NAME "data/cactusgarden_png"
#define DATABASE_NAME "data/rgbd_dataset_freiburg1_room"

//#define intrinsics Cam_Defaults
#define intrinsics Cam_Sturm2012_fr1


// Seleccionamos los frames que vamos a procesar
float speed = 0.01f;
float zFactor = 1.0f;
/** FUNCIONES PROPIAS DEL PROGRAMA **/
VolumeIntegrator *integrator;

/** VARIABLES GLOBALES PARA OPENGL **/
enum VAO_IDs{GlobalPointCloud,NumVAOs};
enum Buffer_IDs{PointBuffer,ColorBuffer,NormalBuffer,NumBuffers};

GLuint VAOs[NumVAOs];
GLuint Buffers[NumBuffers];

GLuint program; // shader program

/** Variables para la Visualizacion **/
mat4 Model,View,Projection,MVP;
mat4 ModelViewMatrix;

vec3 ViewPos = vec3(5.0f,5.0f,8.0f);
vec3 RefPoint = vec3(0.0f,0.0f,0.0f);
vec3 Up = vec3(0.0f,0.0f,1.0f);

/** Funcion para setear el MVP **/
void setMVP(){
    // Model
    //Model = glm::translate(mat4(),vec3(0.0f,0.0f,0.0f));
    float scale = 1.0f;
    Model = glm::rotate(mat4(1.0f),180.0f,vec3(1,0,0)); //* glm::scale(mat4(),vec3(scale,scale,scale));

    // View
    View = glm::lookAt(ViewPos,RefPoint,Up);


    // Projection
    // Matriz de Proyección: Campo de vision 45°, Ratio 4:3, display range: 0.1 unit<->100 units
    // Projection matrix : 45° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
    Projection = glm::perspective(glm::radians(50.0f)*zFactor, 4.0f / 4.0f, 0.1f, 150.0f);

    MVP = Projection * View * Model;
}

/** Funcion Init **/
void Init(){
    glClearColor(0.0f,0.0f,0.0f,0.0f);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_PROGRAM_POINT_SIZE);

    program = LoadShaders("src/vertex.shader","src/fragment.shader");

    glGenVertexArrays(NumVAOs,VAOs);
    glBindVertexArray(VAOs[GlobalPointCloud]);

    // Generamos 3 buffers
    // Estos buffers son Estaticos los haremos dinamicos, por mientras esta bien
    glGenBuffers(NumBuffers,Buffers);
    glBindBuffer(GL_ARRAY_BUFFER,Buffers[PointBuffer]);
    glBufferData(GL_ARRAY_BUFFER, 3 * integrator->TotalPoints() * sizeof(float),integrator->point_data(),GL_DYNAMIC_DRAW);

    glBindBuffer(GL_ARRAY_BUFFER,Buffers[ColorBuffer]);
    glBufferData(GL_ARRAY_BUFFER, 3 * integrator->TotalPoints() * sizeof(float),integrator->color_data(),GL_DYNAMIC_DRAW);

    glBindBuffer(GL_ARRAY_BUFFER,Buffers[NormalBuffer]);
    glBufferData(GL_ARRAY_BUFFER, 3 * integrator->TotalPoints() * sizeof(float),integrator->normal_data(),GL_DYNAMIC_DRAW);
}
/** Funcion Register **/
void RegisterVariables(){
    uniformRegister(MVP,program,"MVP");
}

/** Funcion Display **/
void display(){
    glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
    glPointSize(1.0f);

    setMVP();

    // Drawing Global Point Clouds
    glUseProgram(program);
    RegisterVariables();

    glBindVertexArray(VAOs[GlobalPointCloud]);

    glBindBuffer( GL_ARRAY_BUFFER, Buffers[PointBuffer] );
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0,3,GL_FLOAT,GL_FALSE,sizeof(vec3),BUFFER_OFFSET(0));

    glBindBuffer( GL_ARRAY_BUFFER, Buffers[ColorBuffer] );
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(1,3,GL_FLOAT,GL_FALSE,sizeof(vec3),BUFFER_OFFSET(0));

    glBindBuffer( GL_ARRAY_BUFFER, Buffers[NormalBuffer] );
    glEnableVertexAttribArray(2);
    glVertexAttribPointer(2,3,GL_FLOAT,GL_FALSE,sizeof(vec3),BUFFER_OFFSET(0));

    // Drawing Function
    //cout << "****************Number Points: " << integrator->TotalPoints()<<endl;
    switch(integrator->VisualMode()){
        case lines:
            glDrawArrays(GL_LINES,0,integrator->TotalPoints());
            break;
        case cubes:
            glDrawArrays(GL_TRIANGLES,0,integrator->TotalPoints());
            break;
    }

    glDisableVertexAttribArray(0);
    glDisableVertexAttribArray(1);
    glDisableVertexAttribArray(2);

    glutSwapBuffers();

    glFlush();
}
/**FUNCION PARA KEYBOARD **/
void keyboard(unsigned char key, int x, int y){
    vec3 view_vector = RefPoint - ViewPos; // Para la referencia
    vec3 ortho_vector = vec3(0,0,0); ortho_vector.x = -view_vector.y; ortho_vector.y = view_vector.x;
    switch(key) {
    case 033: // Escape Key
    case 'q': case 'Q':
        exit(EXIT_SUCCESS );
        break;
    case 'w'://Forward move
        ViewPos.x += view_vector.x * speed;
        ViewPos.y += view_vector.y * speed;
        ViewPos.z += view_vector.z * speed;

        RefPoint.x += view_vector.x * speed;
        RefPoint.y += view_vector.y * speed;
        RefPoint.z += view_vector.z * speed;

        break;
    case 's':
        ViewPos.x -= view_vector.x * speed;
        ViewPos.y -= view_vector.y * speed;
        ViewPos.z -= view_vector.z * speed;

        RefPoint.x -= view_vector.x * speed;
        RefPoint.y -= view_vector.y * speed;
        RefPoint.z -= view_vector.z * speed;
        break;
    case 'a':
        ViewPos.x += ortho_vector.x * speed;
        ViewPos.y += ortho_vector.y * speed;
        RefPoint.x += ortho_vector.x * speed;
        RefPoint.y += ortho_vector.y * speed;
        break;
    case 'd':
        ViewPos.x -= ortho_vector.x * speed;
        ViewPos.y -= ortho_vector.y * speed;
        RefPoint.x -= ortho_vector.x * speed;
        RefPoint.y -= ortho_vector.y * speed;
        break;
    }
    //cout << "My Position = (" << ViewPos.x << ","<<ViewPos.y << ","<<ViewPos.z<<")\n";
    glutPostRedisplay();
}
//----------------------------------------------------------------------------
/**FUNCION MOUSE **/
void mouseCallback(int button, int state, int x,int y){
    if ((button == 3) || (button == 4)) // It's a wheel event
   {
       // Each wheel event reports like a button click, GLUT_DOWN then GLUT_UP
       if (state == GLUT_UP) return; // Disregard redundant GLUT_UP events

       if(button == 3) zFactor > 2? zFactor = 2.0: zFactor+=0.1; else zFactor < 0? zFactor = 0: zFactor-= 0.1;
       //printf("Scroll %s At %d %d\n", (button == 3) ? "Up" : "Down", x, y);

   }
   glutPostRedisplay();
}

/** MOVIMIENTO DEL MOUSE **/
void mouseMotion(int x, int y){
    float mid_x = windowDIM /2.0f,mid_y=windowDIM/2.0f;
    float angle_x = 0.0f;
    float angle_z = 0.0f;

    if( x == mid_x && y == mid_y) return;

    glutWarpPointer(mid_x,mid_y);

    // Get the direction from the mouse cursor, set a resonable maneuvering speed
    angle_x = (float)( (mid_x - x) ) / 5000;
    angle_z = (float)( (mid_y - y) ) / 500;

    //Cambiando el valor en el eje de altura
    RefPoint.z += angle_z * 2;

    // limit the rotation around the x-axis
    float botLimit = 16;
    if((RefPoint.z - ViewPos.z) > 8)  RefPoint.z = ViewPos.z + 8;
    if((RefPoint.z - ViewPos.z) < -botLimit)  RefPoint.z = ViewPos.z - botLimit;

    vec3 view_vector = RefPoint - ViewPos;

    vec3 &mView = RefPoint;
    vec3 &mPos = ViewPos;
    vec3 &vVector = view_vector;

    mView.y = (float)(mPos.y + sin(-angle_x)*vVector.x + cos(-angle_x)*vVector.y);
    mView.x = (float)(mPos.x + cos(-angle_x)*vVector.x - sin(-angle_x)*vVector.y);

    glutPostRedisplay();
}


int main(int argc, char** argv){
    // Obtener From-->To Frames
    int from = std::atoi(argv[1]);
    int to = std::atoi(argv[2]);
    cout << from << to <<endl;

    // Lectura y Procesamiento de Datos con OpenCV
    std::srand( unsigned( std::time(0) ));
    //Parte del calculo de OpenCV
    DataSet myDataSet(DATABASE_NAME);

    //Image img(&myDataSet,0);
    //img.PrintInfo();


    //Forma 1 (funciona)
    /*std::vector<Image> voImages;
    for(int i = from; i  <= to ;i++){
        voImages.push_back(Image(&myDataSet,i,intrinsics));
    }*/

    //Odometry odometry(&voImages);
    //odometry.CalcTransformations();

    //integrator = new VolumeIntegrator(odometry);
    //integrator->AlignClouds();
    //integrator->PrintInfo();

    //integrator->GenerateGLGeometry(cubes,16);


    int mode = points;

    integrator = new VolumeIntegrator(&myDataSet,from,to,intrinsics);
    
    integrator->GenerateGLGeometry(mode,14);


    // OpenGL
    if (mode != points){
        glutInit(&argc,argv);

        glewExperimental = GL_TRUE;

        glutInitDisplayMode( GLUT_RGBA | GLUT_DEPTH | GLUT_DOUBLE);
        glutInitWindowSize(windowDIM,windowDIM);
        glutInitContextVersion(4,3);
        glutInitContextProfile(GLUT_CORE_PROFILE);
        glutCreateWindow("Aligned Point Cloud");
        if(glewInit()){
            std::cerr << "No se pudo inicializar GLEW" << endl;
            exit(EXIT_FAILURE);
        }

        Init();

        glutDisplayFunc(display);
        glutKeyboardFunc(keyboard);
        glutMouseFunc(mouseCallback);
        glutPassiveMotionFunc(mouseMotion);

        glutMainLoop();
    }

    else{
        std::vector<vec3> Points(integrator->point_vector());
        std::vector<vec3> Colors(integrator->color_vector());

        delete integrator;

        pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZRGB>);
        cloud->width = Points.size();
        cloud->height = 1;
        cloud->points.resize(cloud->width * cloud->height);

        for_i(cloud->points.size())
        {
            cloud->points[i].x = Points[i].x; cloud->points[i].y = Points[i].y; cloud->points[i].z = Points[i].z;
            cloud->points[i].r = Colors[i].x*255.0f; cloud->points[i].g = Colors[i].y*255.0f; cloud->points[i].b = Colors[i].z*255.0f; 
        }

        pcl::io::savePCDFileBinary("pointcloud.pcd", *cloud);

        // Normal estimation*
        pcl::NormalEstimation<pcl::PointXYZRGB, pcl::Normal> n;
        pcl::PointCloud<pcl::Normal>::Ptr normals (new pcl::PointCloud<pcl::Normal>);
        pcl::search::KdTree<pcl::PointXYZRGB>::Ptr tree (new pcl::search::KdTree<pcl::PointXYZRGB>);
        tree->setInputCloud (cloud);
        n.setInputCloud (cloud);
        n.setSearchMethod (tree);
        n.setKSearch (20);
        n.compute (*normals);
        //* normals should not contain the point normals + surface curvatures

        // Concatenate the XYZ and normal fields*
        pcl::PointCloud<pcl::PointXYZRGBNormal>::Ptr cloud_with_normals (new pcl::PointCloud<pcl::PointXYZRGBNormal>);
        pcl::concatenateFields (*cloud, *normals, *cloud_with_normals);
        //* cloud_with_normals = cloud + normals

        // Create search tree*
        pcl::search::KdTree<pcl::PointXYZRGBNormal>::Ptr tree2 (new pcl::search::KdTree<pcl::PointXYZRGBNormal>);
        tree2->setInputCloud (cloud_with_normals);

        // Initialize objects
        pcl::GreedyProjectionTriangulation<pcl::PointXYZRGBNormal> gp3;
        pcl::PolygonMesh triangles;

        // Set the maximum distance between connected points (maximum edge length)
        gp3.setSearchRadius (0.025);

        // Set typical values for the parameters
        gp3.setMu (2.5);
        gp3.setMaximumNearestNeighbors (250);
        gp3.setMaximumSurfaceAngle(M_PI); // 180 degrees
        gp3.setMinimumAngle(M_PI/18); // 10 degrees
        gp3.setMaximumAngle(2*M_PI/3); // 120 degrees
        gp3.setNormalConsistency(false);

        // Get result
        gp3.setInputCloud (cloud_with_normals);
        gp3.setSearchMethod (tree2);
        gp3.reconstruct (triangles);

        // Additional vertex information
        std::vector<int> parts = gp3.getPartIDs();
        std::vector<int> states = gp3.getPointStates();

        boost::shared_ptr<pcl::visualization::PCLVisualizer> viewer(new pcl::visualization::PCLVisualizer("Reconstruccion 3D"));

        viewer->addPolygonMesh(triangles, "reconstruccion");
        //viewer->resetCameraViewpoint("reconstruccion");
        while(!viewer->wasStopped()){
            viewer->spinOnce(100);
        }

        pcl::io::saveVTKFile("mesh.vtk", triangles);

        // Finish
        return (0);
    }
}
