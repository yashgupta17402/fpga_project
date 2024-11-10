from PIL import Image

def convert_to_grayscale(input_image_path, output_image_path, width=160, height=115):
    # Open the original image
    with Image.open(input_image_path) as img:
        # Resize the image to 160x115
        img_resized = img.resize((width, height))
        
        # Convert the image to grayscale
        img_gray = img_resized.convert("L")
        
        # Save the grayscale image in BMP format
        img_gray.save(output_image_path, format="BMP")

# Example usage:
input_image = 'lena.jpg'  # Replace with your image path
output_image = 'gray.bmp'
convert_to_grayscale(input_image, output_image)
