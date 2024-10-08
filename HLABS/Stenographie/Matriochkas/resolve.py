from PIL import Image
lena = Image.open('lena.bmp')

im = Image.new('1', lena.size)
pixels = lena.load()
width = lena.size[0]
height = lena.size[1]

for x in range (0, width):
    for y in range(0, height):
        g = pixels[x, y]
        im.putpixel((x,y), int(bin(g)[-1]))
        
im.save("newImage.bmp")