from PIL import Image, ImageDraw

def superpose_patterns(image_path, pattern_path, coordinates, output_file):
    # Open the existing image
    img = Image.open(image_path)
    if img.mode != "RGBA":
        img = img.convert("RGBA")

    # Open the pattern image
    pattern = Image.open(pattern_path)
    if pattern.mode != "RGBA":
        pattern = pattern.convert("RGBA")

    # Iterate through each coordinate pair and superpose the patterns
    for coord in coordinates:
        x1, y1, x2, y2 = coord

        # Resize pattern to match the QR code size
        pattern_resized = pattern.resize((x2 - x1, y2 - y1))

        # Superpose the patterns
        img.paste(pattern_resized, (x1, y1), pattern_resized)

    # Save the modified image
    img.save(output_file)

# Coordinates provided
coordinates = [
    (0, 0, 70, 70),
    (380, 0, 450, 70),
    (0, 380, 70, 450)
]

# Input image path
input_image_path = "qrcode.png"

# Pattern image path
pattern_path = "pattern.png"

# Output file name
output_file = "image_with_superposed_pattern.png"

# Superpose patterns on the existing image
superpose_patterns(input_image_path, pattern_path, coordinates, output_file)

print("Patterns superposed on the existing image successfully!")
