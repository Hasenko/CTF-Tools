from PIL import Image

# Open the file with binary numbers
with open('binari.txt', 'r') as file:
    # Read all lines from the file
    binary_lines = file.readlines()

# Define the size of each square in the image (pixels)
square_size = 10

# Determine the width and height of the image based on the file contents
# Assuming each line has the same length, which represents the width
grid_width = len(binary_lines[0].strip())
grid_height = len(binary_lines)

# Create a new white image (background)
img = Image.new('RGB', (grid_width * square_size, grid_height * square_size), "white")

# Load the image's pixel data
pixels = img.load()

# Iterate over each line (row) and each character (bit) in the file
for row, line in enumerate(binary_lines):
    line = line.strip()  # Remove any trailing newline or space characters
    for col, bit in enumerate(line):
        # Determine the color: 0 = white, 1 = black
        color = (0, 0, 0) if bit == '1' else (255, 255, 255)  # Black for '1', White for '0'

        # Fill the corresponding square in the image with the color
        for x in range(col * square_size, (col + 1) * square_size):
            for y in range(row * square_size, (row + 1) * square_size):
                pixels[x, y] = color

# Save the generated QR code-like image
img.save('binary_qr_code.png')

print("QR code-like image generated and saved as 'binary_qr_code.png'")

"""
solution :

convert octal to binary
then create a qr code with binary

0 = white
1 = black

as simple as that
"""