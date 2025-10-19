from PIL import Image
import numpy as np

def create_rgb_image_from_binary(binary_file_path, output_image_path, width, height):
    # Read the binary file
    with open(binary_file_path, 'rb') as binary_file:
        binary_data = binary_file.read()

    # Ensure the binary data is long enough to fill the image
    total_pixels = width * height
    required_length = total_pixels * 3  # 3 bytes per pixel (RGB)
    
    if len(binary_data) < required_length:
        raise ValueError(f"Binary data is too short. Expected at least {required_length} bytes, got {len(binary_data)} bytes.")

    # Create an array of shape (height, width, 3) for RGB values
    rgb_array = np.frombuffer(binary_data[:required_length], dtype=np.uint8).reshape((height, width, 3))

    # Create an image from the RGB array
    image = Image.fromarray(rgb_array, 'RGB')
    
    # Save the image
    image.save(output_image_path)
    print(f"RGB image saved as {output_image_path}")

# Example usage
binary_file_path = 'flag.bin'  # Path to your binary file
output_image_path = 'output_image.png'       # Desired output image file
width, height = 800, 1227                       # Set desired width and height

create_rgb_image_from_binary(binary_file_path, output_image_path, width, height)

"""
solution :

convertir le fichier binaire en un fichier png a partir de rgb
pour trouver la bonne taille d'image (800, 1227), il faut prendre le nombre d'octet du fichier et faire :
    Total Bytes / Bytes per Pixel = 2,944,800 / 3 (red, green et blue) ≈ 981,600 pixels
    Width = 800, Height = 1227 (800 * 1227 = 981,600, perfect fit)
"""