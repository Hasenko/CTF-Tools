from PIL import Image

def extract_frames(gif_path, output_folder):
    with Image.open(gif_path) as gif:
        # Iterate through each frame
        for frame_index in range(gif.n_frames):
            gif.seek(frame_index)
            # Extract the current frame
            frame = gif.copy()
            # Save the frame to a file
            frame.save(f"{output_folder}/{frame_index}.png")
            print(f"QRCODE extracted : {frame_index}.png")

if __name__ == "__main__":
    gif_path = r"INRACI.gif"
    output_folder = r"frames"
    extract_frames(gif_path, output_folder)
