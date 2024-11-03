from PIL import Image

# Open the image
im = Image.open("lena.bmp")
rgb_im = im.convert('RGB')

# Get the size of the image
width, height = rgb_im.size

# Prepare to collect the least significant bits
lsb_bits = []

# Iterate over each pixel
for x in range(width):
    for y in range(height):
        # Get the original pixel's RGB values
        r, g, b = rgb_im.getpixel((x, y))
        
        # Extract the least significant bits from each channel
        r_lsb = r & 1      # Least significant bit of red
        g_lsb = g & 1      # Least significant bit of green
        b_lsb = b & 1      # Least significant bit of blue

        # Append the LSBs to the list
        lsb_bits.append(r_lsb)
        lsb_bits.append(g_lsb)
        lsb_bits.append(b_lsb)

# Convert the bits to bytes
byte_array = bytearray()
for i in range(0, len(lsb_bits), 8):
    byte_value = 0
    for j in range(8):
        if i + j < len(lsb_bits):
            byte_value |= (lsb_bits[i + j] << (7 - j))  # Set the bit in the byte
    byte_array.append(byte_value)

# Save the extracted bits as a binary file or text
with open("teetteetetet.bmp", "wb") as f:
    f.write(byte_array)

# Optionally, try to interpret the data as text
try:
    extracted_text = byte_array.decode('utf-8')
    print("Extracted text:", extracted_text)
except UnicodeDecodeError:
    print("The extracted data is not valid UTF-8 text.")