from PIL import Image

# Open the three images
image1 = Image.open("image1.png")
image2 = Image.open("image2.png")
image3 = Image.open("image3.png")

# Make sure all images have the same size (resize if needed)
width, height = image1.size

image2 = image2.resize((width, height))
image3 = image3.resize((width, height))

# Create a new blank image with the combined width of all three images
new_image = Image.new('RGB', (width * 3, height))

# Paste the images onto the new image
new_image.paste(image1, (0, 0))  # Paste image1 at position (0, 0)
new_image.paste(image2, (width, 0))  # Paste image2 at position (width, 0)
new_image.paste(image3, (width * 2, 0))  # Paste image3 at position (width*2, 0)

# Save the final image
new_image.save("combined_image.png")

print("Image combined successfully!")