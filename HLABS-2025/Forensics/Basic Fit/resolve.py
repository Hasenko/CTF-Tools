from PIL import Image

data = [
    0o177234577, 0o101350501, 0o135074535, 0o135046535,
    0o135366135, 0o101224101, 0o177252577, 0o272400,
    0o163345363, 0o176543255, 0o75423415, 0o503352,
    0o175131511, 0o6617641, 0o151415171, 0o34473410,
    0o151206762, 0o305425, 0o177121521, 0o101345432,
    0o135175771, 0o135011666, 0o135357663, 0o101333530,
    0o177347711
]

binary_lines = [bin(val)[2:].zfill(30) for val in data]
height = len(binary_lines)
width = len(binary_lines[0])

img = Image.new('1', (width, height))  # '1' = black & white
for y, line in enumerate(binary_lines):
    for x, bit in enumerate(line):
        img.putpixel((x, y), 1 if bit == '1' else 0)

img.save('barcode.png')
img.show()

# helb{kn0w_Th3_b4s1cS} 