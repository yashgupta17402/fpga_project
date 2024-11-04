#ifndef GAUSSIAN_BLUR_H
#define GAUSSIAN_BLUR_H

#include <ap_int.h>

// Kernel size definition for clarity
#define KERNEL_SIZE 3

// Function prototype for Gaussian blur
void blur(ap_uint<8> in_pixels[KERNEL_SIZE][KERNEL_SIZE], ap_uint<8> *out_pixel);

#endif // GAUSSIAN_BLUR_H
