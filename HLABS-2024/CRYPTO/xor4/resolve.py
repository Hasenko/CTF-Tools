from PIL import Image

def xor_bmp(file1, file2, output_file):
    # Open the BMP images
    img1 = Image.open(file1)
    img2 = Image.open(file2)

    # Check and convert to RGB if needed
    if img1.mode != 'RGB':
        img1 = img1.convert('RGB')
    if img2.mode != 'RGB':
        img2 = img2.convert('RGB')

    # Ensure both images have the same size
    if img1.size != img2.size:
        raise ValueError("Images must have the same dimensions")

    # Get pixel data
    pixels1 = img1.load()
    pixels2 = img2.load()
    
    # Create a new image for the output
    result_img = Image.new('RGB', img1.size)
    result_pixels = result_img.load()

    # Perform XOR on each pixel
    for y in range(img1.height):
        for x in range(img1.width):
            # Get the pixel values
            r1, g1, b1 = pixels1[x, y]
            r2, g2, b2 = pixels2[x, y]

            # Perform XOR operation
            r = r1 ^ r2
            g = g1 ^ g2
            b = b1 ^ b2

            # Set the pixel in the result image
            result_pixels[x, y] = (r, g, b)

    # Save the result image
    result_img.save(output_file)

# Example usage
if __name__ == "__main__":
    xor_bmp('image1_crypted.bmp', 'image2_crypted.bmp', 'aaaa.bmp')

"""
solution :

do a xor of the two file and put the result in a new bmp file
"""