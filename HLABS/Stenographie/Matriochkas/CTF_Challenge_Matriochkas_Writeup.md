
# Write-Up: CTF Challenge - Matriochkas

## Overview
In the CTF challenge titled "Matriochkas," the goal was to uncover a hidden flag embedded within a series of images using Least Significant Bit (LSB) steganography. The primary image provided was `lena.bmp`, which concealed data that needed to be extracted and analyzed.

## Steps Taken

### 1. **Extracting Data from `lena.bmp`**
The initial step involved analyzing the BMP image `lena.bmp`. Since the flag was hidden using LSB, a script was written in Python to extract the least significant bits from the image's RGB values.

#### Python Script for LSB Extraction
```python
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

# Save the extracted bits as a binary file
with open("extracted_data.bin", "wb") as f:
    f.write(byte_array)
```

### 2. **Analyzing the Extracted Data**
Once the LSBs were extracted, the next step was to analyze the binary data using `binwalk` to identify any embedded file formats.

```bash
binwalk -e extracted_data.bin
```

The output indicated the presence of a BMP image and a VMware disk image within the binary data:

```
0             0x0             PC bitmap, Windows 3.x format,, 500 x 573 x 24
256663        0x3EA97         VMware4 disk image
```

### 3. **Extracting the Embedded BMP Image**
With the knowledge that a BMP image was embedded, a second script was created to extract this image from the binary data.

#### BMP Extraction Script
```python
def extract_bmp_from_bin(bin_file, output_file):
    with open(bin_file, 'rb') as f:
        data = f.read()
        
        # Look for 'BM' header
        header_index = data.find(b'BM')
        if header_index == -1:
            print("BMP header not found!")
            return
        
        bmp_size = 200 * 154 * 3 + 54  # +54 for the header
        bmp_data = data[header_index:header_index + bmp_size]
        
        with open(output_file, 'wb') as out:
            out.write(bmp_data)
        print(f"BMP extracted to {output_file}")

# Run the extraction
extract_bmp_from_bin('extracted_data.bin', 'hidden_image.bmp')
```

### 4. **Final Analysis of the Extracted Image**
Upon running the extraction script, I obtained a new BMP image (`hidden_image.bmp`). This image resembled a standard Windows wallpaper. By analyzing this image, I continued the process until I ultimately retrieved the flag hidden within it.

## Conclusion
Through the combined use of Python scripting, LSB extraction, and file analysis tools like `binwalk`, I successfully extracted and analyzed hidden data from the `lena.bmp` image and ultimately retrieved the flag from the challenge. This exercise highlighted the importance of attention to detail and iterative analysis when tackling steganography challenges in CTF competitions.
