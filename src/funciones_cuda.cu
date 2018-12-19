#include "funciones_cuda.h"

__global__ void fillPoints(uint16_t* pSource, float* puntos, float depthFactor, float cx, float cy, float fx, float fy, int h, int w){

  int u = blockIdx.x * blockDim.x + threadIdx.x;
  int v = blockIdx.y * blockDim.y + threadIdx.y;

  if(u < w && v < h){
    int i = u + v * w;
    uint16_t value = pSource[i];
    if(value != 0){
      float pz = value / depthFactor;
      at_vec3(puntos, i, 2) = pz;
      at_vec3(puntos, i, 0) = (u - cx) * pz / fx;
      at_vec3(puntos, i, 1) = (v - cy) * pz / fy;
    }
    else{
      at_vec3(puntos, i, 2) = 0;
      at_vec3(puntos, i, 0) = 0;
      at_vec3(puntos, i, 1) = 0;
    }

  }
}
