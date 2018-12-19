#ifndef STRUCTURES_H
#define STRUCTURES_H



#include "stdio.h"
#include "stdlib.h"
#include <curand.h>
#include <curand_kernel.h>

#define at2d(m, i, j, w) (m[(i) * (w) + (j)])
#define at3d(m, i, j, k, w, s) (m[((i) * (w) + (j)) * (s) + (k)])
#define CHECK(call){const cudaError_t error = call;if (error != cudaSuccess){printf("Error: %s:%d, ", __FILE__, __LINE__);printf("code:%d, reason: %s\n", error, cudaGetErrorString(error));exit(1);}}

#define at_vec3(m, i, j) (m[(i) * (3) + (j)])

template<class T>
T* vec3_i(T* m, int i){
  T* temp = &(m[i * 3]);
  return temp;
}

template <class T>
T* vec3_array(int n){
  T* n_array;
  n_array = new T[n * 3];
  return n_array;
}




// ------------------ cuda -----------------------------


// template to create new cuda arrays
template <class T>
T* cuda_array(int n){
  T* arr;
  size_t tam = n * sizeof(T);
  CHECK(cudaMalloc(&arr, tam));
  return arr;
}

// template to copy array from host to device
template <class T>
void cuda_H2D(T* h_arr, T* d_arr, int n){
  size_t tam = n * sizeof(T);
  CHECK(cwudaMemcpy(d_arr, h_arr, tam, cudaMemcpyHostToDevice));
}

// template to copy array from device to host
template <class T>
void cuda_D2H(T* d_arr, T* h_arr, int n){
  size_t tam = n * sizeof(T);
  CHECK(cudaMemcpy(h_arr, d_arr, tam, cudaMemcpyDeviceToHost));
}


// template to copy array from device to device
template <class T>
void cuda_D2D(T* d_arr, T* d_arr2, int n){
  size_t tam = n * sizeof(T);
  CHECK(cudaMemcpy(d_arr2, d_arr, tam, cudaMemcpyDeviceToDevice));
}

#endif
