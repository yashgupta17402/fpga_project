#include <iostream>
#include "ap_int.h"

// Define the kernel size used in the blur function
#define KERNEL_SIZE 3

// Function prototype (assumes the header is not provided separately)
void blur(ap_uint<8> in_pixels[KERNEL_SIZE][KERNEL_SIZE], ap_uint<8> *out_pixel);

int main() {
    // Initialize a 3x3 matrix representing a sample image patch
    ap_uint<8> in_pixels[KERNEL_SIZE][KERNEL_SIZE] = {
        {100, 150, 100},
        {150, 200, 150},
        {100, 150, 100}
    };

    // Expected result using software calculation
    ap_uint<8> sw_result = 0;
    ap_uint<8> hw_result;
    int kernel[KERNEL_SIZE][KERNEL_SIZE] = {
        {1, 2, 1},
        {2, 4, 2},
        {1, 2, 1}
    };
    int kernel_sum = 16; // Normalization factor
    int sum = 0;

    // Software calculation to compute the expected result
    for (int i = 0; i < KERNEL_SIZE; i++) {
        for (int j = 0; j < KERNEL_SIZE; j++) {
            sum += in_pixels[i][j] * kernel[i][j];
        }
    }
    int temp_result = sum / kernel_sum;
    sw_result = (temp_result > 255) ? (ap_uint<8>)255 : (temp_result < 0) ? (ap_uint<8>)0 : (ap_uint<8>)temp_result;

    // Call the HLS function to get the hardware result
    blur(in_pixels, &hw_result);

    // Print and compare the results
    std::cout << "{" << std::endl;
    std::cout << "Software Result: " << (int)sw_result << std::endl;
    std::cout << "Hardware Result: " << (int)hw_result << std::endl;

    if (hw_result != sw_result) {
        std::cout << "Hardware implementation is incorrect. 1 error found." << std::endl;
        return 1; // Return an error code if the results don't match
    } else {
        std::cout << "Hardware implementation is correct." << std::endl;
    }

    std::cout << "}" << std::endl;

    return 0;
}
