import requests
from PIL import Image, ImageDraw
from pyzbar.pyzbar import decode
import os

def download_image(url, save_path):
    # Send a GET request to the image URL
    response = requests.get(url)
    
    # Check if the request was successful
    if response.status_code == 200:
        # Write the image content to a file
        with open(save_path, 'wb') as f:
            f.write(response.content)
        print(f"Image downloaded successfully to '{save_path}'.")
    else:
        print("Failed to download image. Status code:", response.status_code)

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

def decode_qr_code(image_path, output_file):
    # Open the image
    img = Image.open(image_path)

    # Decode the QR code
    decoded_objects = decode(img)

    # Write the decoded information to a text file
    with open(output_file, "w") as f:
        for obj in decoded_objects:
            f.write("Type: {}\n".format(obj.type))
            f.write("Data: {}\n\n".format(obj.data.decode('utf-8')))

# Example usage:
image_url = "http://cha.ccu-ctf.be:8001/qrcode"
save_path = "qrcode.png"
download_image(image_url, save_path)

coordinates = [
    (0, 0, 70, 70),
    (380, 0, 450, 70),
    (0, 380, 70, 450)
]
input_image_path = "qrcode.png"
pattern_path = "pattern.png"
output_file = "image_with_superposed_pattern.png"
superpose_patterns(input_image_path, pattern_path, coordinates, output_file)

image_path = "image_with_superposed_pattern.png"
output_file = "decoded_qr_code.txt"
decode_qr_code(image_path, output_file)

print("QR code downloaded, superposed with pattern, and decoded successfully.")