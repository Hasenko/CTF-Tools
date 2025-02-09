import re

# Read the original SVG file
with open("labyrinth.svg", "r") as file:
    svg_content = file.read()

# Function to increase wall thickness by 4

def increase_thickness(match):
    width = int(match.group(1)) + 4
    height = int(match.group(2)) + 4
    return f'width="{width}" height="{height}"'

# Modify all <rect> elements
updated_svg = re.sub(r'width="(\d+)" height="(\d+)"', increase_thickness, svg_content)

# Write the updated SVG to a new file
with open("output.svg", "w") as file:
    file.write(updated_svg)

print("Wall thickness increased by 4 pixels in output.svg")