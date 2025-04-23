"""
browse all image from frames folder and for each one, get the dots color and add it in a file.

then browse the new file and recreate an image with the same dimensions of the gif with all the dots color.
"""

import os
from PIL import Image

def find_matching_pixel(image_path, target_colors, output_file):
    try:
        # Open the image
        img = Image.open(image_path)
        
        # Get the pixel data
        pixels = img.load()
        pixel_count = 0  # To track when to add a newline
        
        # Loop over the image and check the first pixel for matching colors
        for y in range(img.height):
            for x in range(img.width):
                pixel = pixels[x, y]
                
                # Check if the pixel matches any of the target colors
                hex_color = '#{:02x}{:02x}{:02x}'.format(pixel[0], pixel[1], pixel[2]).lower()
                if hex_color in target_colors:
                    # Write the color and coordinates to the text file
                    output_file.write(f"{hex_color} at ({x}, {y})\n")
                    pixel_count += 1
                    
                    # After every 128th pixel, add a newline
                    if pixel_count % 128 == 0:
                        output_file.write("\n")
                    
                    img.close()  # Close image after processing
                    return  # Exit once the first match is found

    except Exception as e:
        print(f"Error processing {image_path}: {e}")

def browse_frames_for_color(frame_folder, target_colors, output_file):
    # Ensure the folder exists
    if not os.path.exists(frame_folder):
        print(f"The folder {frame_folder} does not exist.")
        return
    
    # Browse the folder and check each image
    for filename in sorted(os.listdir(frame_folder)):
        if filename.endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif')):
            image_path = os.path.join(frame_folder, filename)
            find_matching_pixel(image_path, target_colors, output_file)

def create_image_from_colors(txt_file, image_width, image_height):
    # Initialize an empty image with white background
    img = Image.new('RGB', (image_width, image_height), color='white')
    pixels = img.load()  # Create a pixel map

    # Open the text file and process the matching color data
    with open(txt_file, 'r') as file:
        for line in file:
            # Extract the color and coordinates from each line
            parts = line.strip().split(" at ")
            if len(parts) == 2:
                color_hex = parts[0]
                coordinates = parts[1].strip('()').split(',')
                
                if len(coordinates) == 2:
                    x, y = map(int, coordinates)
                    # Convert hex color to RGB
                    color = tuple(int(color_hex[i:i+2], 16) for i in (1, 3, 5))  # Ignore the '#' symbol
                    # Set the pixel color at the specified coordinates
                    if 0 <= x < image_width and 0 <= y < image_height:
                        pixels[x, y] = color
    
    # Save the image to a file
    output_image = "flag.png"
    img.save(output_image)
    print(f"Image created and saved as {output_image}")

if __name__ == "__main__":
    if not os.path.exists('pixel_colors_and_positions.txt'):
        # Define target colors (hex codes)
        target_colors = ['#0f9ed5', '#f6fbfd']

        # Set the directory where the images are stored
        frame_folder = 'frames'  # Replace with your folder path if needed

        # Open a text file to write the color info
        with open('pixel_colors_and_positions.txt', 'w') as output_file:
            browse_frames_for_color(frame_folder, target_colors, output_file)

        print("Matching colors have been logged to pixel_colors_and_positions.txt.")
    else:
        image_width = 128  # You can adjust the width as needed
        image_height = 128  # You can adjust the height as needed

        create_image_from_colors("pixel_colors_and_positions.txt", image_width, image_height)