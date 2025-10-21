with open("black_copy.gif", "rb") as f:
    data = bytearray(f.read())

# Find the image descriptor marker 0x2C (',') and the following packed byte (0x87)
idx = data.find(b'\x2C')  # image descriptor
packed_index = idx + 9  # packed byte after width & height (10th after 0x2C)
palette_start = packed_index + 1  # palette starts after that
palette_size = 256 * 3

# Create a grayscale palette
palette = bytearray()
for i in range(256):
    palette += bytes([i, i, i])

# Replace zeros with the new palette
data[palette_start:palette_start + palette_size] = palette

with open("black_copy_fixed.gif", "wb") as f:
    f.write(data)

print("✅ Palette inserted at offset", hex(palette_start))
