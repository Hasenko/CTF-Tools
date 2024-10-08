from PIL import Image
from pyzbar.pyzbar import decode
import os

def extract_frame_number(filename):
    # Extract frame number from the filename
    return int(filename.split('.')[0])

def scan_qrcodes(folder_path, output_file):
    hexString = ""
    # Sort the filenames based on the frame number
    filenames = sorted(os.listdir(folder_path), key=extract_frame_number)
    for filename in filenames:
        if filename.endswith(".png"):  # Assuming all frames are saved as PNG files
            image_path = os.path.join(folder_path, filename)
            with Image.open(image_path) as img:
                # Decode QR codes
                decoded_objects = decode(img)
                if decoded_objects:
                    for obj in decoded_objects:
                        hexString += obj.data.decode('utf-8')
                        print(f"{obj.data.decode('utf-8')} ", end="")

    return hexString

def decodeHex(hexString):
    decodedString = bytes.fromhex(hexString).decode('utf-8')

    print()
    print(decodedString)

if __name__ == "__main__":
    folder_path = r"frames"
    output_file = r"scanned_qrcodes.txt"
    decodeHex(scan_qrcodes(folder_path, output_file))