from PIL import Image
import binascii

# Function to convert image to binary
def image_to_binary(image_path):
    # Open the image file
    with open(image_path, "rb") as image_file:
        # Read the image file and convert it to binary
        binary_data = binascii.b2a_bin(image_file.read())
    return binary_data

# Example usage
image_path = "flag.png"  # Replace with your image path
binary_data = image_to_binary(image_path)

# Save binary data to a text file (optional)
with open("image_binary.txt", "wb") as binary_file:
    binary_file.write(binary_data)

print(f"Image has been converted to binary and saved as 'image_binary.txt'.")