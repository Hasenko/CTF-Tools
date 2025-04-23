# oqba{n0_pyR4M1D_w17h0uT_4_b453}
from PIL import Image, ImageDraw, ImageFont
import random, string

def reorder_flag(base: int, flag: str):
    revisited_flag = flag[0]

    for i in range (1, len(flag)):
        revisited_flag += flag[i] + flag[-i]

        if (i + 1 >= base):
            i += 1
            revisited_flag = revisited_flag[:-1]
            revisited_flag += flag[i:-i + 2]
            break
    
    return revisited_flag


def max_pyramid_base(flag_length):
    layer = 1
    placed = 1  # Layer 1 only has 1 char
    while True:
        layer += 1
        if layer == 2:
            placed += 2
        else:
            if flag_length - placed <= layer:
                break
            placed += 2  # only extremities
        if placed >= flag_length:
            break
    return layer

def draw_hollow_string_pyramid(input_str, output_file='hollow_pyramid.png'):
    total_chars = len(input_str)
    base = max_pyramid_base(total_chars)

    # Drawing setup
    cell_width = 100
    cell_height = 50
    padding = 10
    font_size = 20

    img_width = base * cell_width + padding * 2
    img_height = base * cell_height + padding * 2

    img = Image.new('RGB', (img_width, img_height), color='white')
    draw = ImageDraw.Draw(img)

    try:
        font = ImageFont.truetype("arial.ttf", font_size)
    except:
        font = ImageFont.load_default()

    index = 0
    chars = list(reorder_flag(base, input_str))

    for row in range(1, base + 1):
        y = padding + (row - 1) * cell_height
        total_row_width = row * cell_width
        start_x = (img_width - total_row_width) // 2

        for col in range(row):
            x = start_x + col * cell_width
            box = [x, y, x + cell_width, y + cell_height]
            draw.rectangle(box, outline='black', width=2)

            is_extremity = (col == 0 or col == row - 1)
            is_last_row = (row == base)

            char = string_to_base(ord(random.choice(string.ascii_letters)), random.randint(2, base))
            if is_last_row:
                # We'll fill base row later after this loop
                continue
            elif is_extremity and index < len(chars):
                char = string_to_base(ord(chars[index]), row+1)
                # char = str(row + 1)
                index += 1

            # Draw character (except last row)
            if not is_last_row:
                text_bbox = draw.textbbox((0, 0), char, font=font)
                text_width = text_bbox[2] - text_bbox[0]
                text_height = text_bbox[3] - text_bbox[1]
                text_x = x + (cell_width - text_width) // 2
                text_y = y + (cell_height - text_height) // 2
                draw.text((text_x, text_y), char, fill='black', font=font)

    # Now place remaining characters in the last row
    remaining = chars[index:]
    y = padding + (base - 1) * cell_height
    total_row_width = base * cell_width
    start_x = (img_width - total_row_width) // 2

    for col in range(base):
        x = start_x + col * cell_width
        box = [x, y, x + cell_width, y + cell_height]
        draw.rectangle(box, outline='black', width=2)

        if col < len(remaining):
            char = string_to_base(ord(remaining[col]), base)
            # char = str(base)
        else:
            char = string_to_base(ord(random.choice(string.ascii_letters)), random.randint(2, base))

        text_bbox = draw.textbbox((0, 0), char, font=font)
        text_width = text_bbox[2] - text_bbox[0]
        text_height = text_bbox[3] - text_bbox[1]
        text_x = x + (cell_width - text_width) // 2
        text_y = y + (cell_height - text_height) // 2
        draw.text((text_x, text_y), char, fill='black', font=font)

    img.save(output_file)
    print(f"Hollow pyramid saved as {output_file}")

def convert_to_base(n, base):
    if n == 0:
        return "0"
    digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    result = ""
    while n:
        result = digits[n % base] + result
        n //= base
    return result

def string_to_base(s, base):
    try:
        number = int(s)  # Convert string to an integer
        return convert_to_base(number, base)
    except ValueError:
        return "Invalid input: string must be an integer"

draw_hollow_string_pyramid("oqba{n0_pyR4M1D_w17h0uT_b4535}")
# draw_hollow_string_pyramid("abcdefghijklmnopqrstuvwxyz1234")