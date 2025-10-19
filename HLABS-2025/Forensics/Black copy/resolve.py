from PIL import Image

img = Image.open("black_copy.gif")
img = img.convert("RGB")  # ensure colors are correct
img.save("fixed.gif")
