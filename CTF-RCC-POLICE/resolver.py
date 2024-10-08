from pyzbar.pyzbar import decode
from PIL import Image

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

# Image path
image_path = "image_with_superposed_pattern.png"  # Replace with the path to your QR code image

# Output file name
output_file = "decoded_qr_code.txt"

# Decode the QR code and write to a text file
decode_qr_code(image_path, output_file)

print("QR code decoded successfully. Decoded information saved to '{}'.".format(output_file))
