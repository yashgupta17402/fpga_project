# -*- coding: utf-8 -*-
import cv2
import os
def convert_to_8bit_binary(number):
    """Converts a number into its 8-bit binary representation."""
    binary_representation = bin(number)[2:]  # Remove the "0b" prefix
    padded_binary = binary_representation.zfill(8)  # Pad with zeros to ensure 8 bits
    return padded_binary

def main():
    # Load and resize lena.jpg, then save it as lena.bmp
    img = cv2.imread("lena.jpg")
    img_resized = cv2.resize(img, (160, 115))
    cv2.imwrite("lena.bmp", img_resized)

    # Load all images
    gray = cv2.imread("gray.bmp")
    left = cv2.imread("left.bmp")
    right = cv2.imread("right.bmp")
    up = cv2.imread("up.bmp")
    down = cv2.imread("down.bmp")
    leftup = cv2.imread("leftup.bmp")
    leftdown = cv2.imread("leftdown.bmp")
    rightup = cv2.imread("rightup.bmp")
    rightdown = cv2.imread("rightdown.bmp")
    lena_bmp = cv2.imread("lena.bmp")

    # Open the .coe file for writing
    with open("image.coe", "w") as coe:
        coe.write("memory_initialization_radix=2;\nmemory_initialization_vector=\n")

        # List of image matrices to process
        grayscale_images = [gray, left, right, up, down, leftup, leftdown, rightup, rightdown]

        for i in range(gray.shape[0]):
            for j in range(gray.shape[1]):
                # Step 1: Concatenate binary values from each grayscale image
                st = ""
                for image in grayscale_images:
                    pixel_value = image[i][j][0]  # Assuming single-channel grayscale images
                    bi = convert_to_8bit_binary(pixel_value)  # Convert pixel to 8-bit binary
                    st += bi  # Append each grayscale pixel's binary to st

                # Step 2: Convert RGB channels from lena.bmp to binary
                tblue = convert_to_8bit_binary(lena_bmp[i][j][0])  # Blue channel
                tgreen = convert_to_8bit_binary(lena_bmp[i][j][1])  # Green channel
                tred = convert_to_8bit_binary(lena_bmp[i][j][2])  # Red channel

                # Step 3: Concatenate grayscale data and RGB data, then write to the file
                coe.write(st + tblue + tgreen + tred + ',\n')
        
        # Remove the last comma and add a semicolon to finish the vector
        coe.seek(coe.tell() - 2, os.SEEK_SET)  # Move the cursor back to overwrite the last comma
        coe.write(";")

if __name__ == "__main__":
    main()
