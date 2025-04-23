import os
import sys
import cairosvg

def convert_svg_folder(input_folder: str, output_folder: str):
    """Converts all SVG files in a folder to PNG and saves them in the output folder."""
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    svg_files = [f for f in os.listdir(input_folder) if f.endswith(".svg")]

    if not svg_files:
        print("No SVG files found in the specified folder.")
        return

    for svg_file in svg_files:
        input_svg_path = os.path.join(input_folder, svg_file)
        output_png_path = os.path.join(output_folder, os.path.splitext(svg_file)[0] + ".png")

        try:
            cairosvg.svg2png(url=input_svg_path, write_to=output_png_path)
            print(f"Converted: {svg_file} -> {output_png_path}")
        except Exception as e:
            print(f"Error converting {svg_file}: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python convert_folder.py <input_folder> <output_folder>")
    else:
        convert_svg_folder(sys.argv[1], sys.argv[2])
