from PIL import Image, ImageSequence
import os

def extract_gif_frames(gif_path, output_folder):
    os.makedirs(output_folder, exist_ok=True)
    
    with Image.open(gif_path) as img:
        for i, frame in enumerate(ImageSequence.Iterator(img)):
            frame = frame.convert("RGBA")
            frame.save(os.path.join(output_folder, f"{i}.png"), format="PNG")

if __name__ == "__main__":
    gif_file = "dots.gif"  # Replace with your GIF filename
    output_folder = "frames"
    extract_gif_frames(gif_file, output_folder)