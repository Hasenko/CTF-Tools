"""
title : Gary

description : Like a snail, I love binary !

file given : flag.png

solution :
    The solution here is to browse the image pattern in a spiral way from the center. When a black square is found, a 1 is added to a string, if it's a white square, add a 0.
    By continuing this to the end, the binarie string should be converted in ascii and the flag will be revealed.
"""

from PIL import Image
import numpy as np
from spiral import SpiralMatrix

def image_to_hex(image_path):
    image = Image.open(image_path)
    image = image.convert("RGB")  # Ensure it's in RGB mode
    width, height = image.size
    
    hex_values = []
    for y in range(height):
        row_values = []
        for x in range(width):
            r, g, b = image.getpixel((x, y))
            hex_color = f'#{r:02x}{g:02x}{b:02x}'

            if hex_color == "#000000":
                color_value = '1'
            elif hex_color == "#ffffff":
                color_value = '0'
            
            row_values.append(color_value)
        hex_values.append(row_values)
    
    return hex_values

if __name__ == "__main__":
    image_path = "flag.png"  # Change this to your image file
    hex_colors = image_to_hex(image_path)

    single_row_list = []
    i = 0
    for row in hex_colors:
        if i % 5 == 0:
            single_row_list.append(row)
        i += 1

    single_color_list = []
    for row in single_row_list:
        i = 0
        row_values = []
        for color in row:
            if i % 5 == 0:
                row_values.append(color)
            i += 1
        single_color_list.append(row_values) 

    spiral_arranged_list = SpiralMatrix.unspiral_matrix(single_color_list, False, 'down')

    print(spiral_arranged_list)

    flat_spiral_arranged_list = [item for sublist in spiral_arranged_list for item in sublist]

    binary_string = ''.join(flat_spiral_arranged_list)
    print('\n--------------------------------------------------\n')
    print(binary_string)
    print('\n--------------------------------------------------\n')