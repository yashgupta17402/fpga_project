#include <ap_int.h>



#define KERNEL_SIZE 3

// Function for applying a Gaussian blur to an input pixel
void blur(ap_uint<8> in_pixels[KERNEL_SIZE][KERNEL_SIZE], ap_uint<8> *out_pixel) {

#pragma HLS INTERFACE ap_ctrl_hs port=return
#pragma HLS INTERFACE ap_none port=out_pixel
#pragma HLS ARRAY_PARTITION variable=in_pixels complete dim=0
#pragma HLS PIPELINE II=1

    // Gaussian kernel (3x3) with approximate integer values
    const int kernel[KERNEL_SIZE][KERNEL_SIZE] = {
        {1, 2, 1},
        {2, 4, 2},
        {1, 2, 1}
    };

    int sum = 0;
    int kernel_sum = 16; // Sum of kernel values for normalization (1+2+1+2+4+2+1+2+1 = 16)

    // Apply the kernel to the input pixels
    for (int i = 0; i < KERNEL_SIZE; i++) {
        for (int j = 0; j < KERNEL_SIZE; j++) {
            sum += in_pixels[i][j] * kernel[i][j];
        }
    }

    // Normalize the output pixel value
    sum /= kernel_sum;

    // Clamp the output to 8 bits
    if (sum > 255) sum = 255;
    if (sum < 0) sum = 0;

    *out_pixel = (ap_uint<8>)sum;
}
