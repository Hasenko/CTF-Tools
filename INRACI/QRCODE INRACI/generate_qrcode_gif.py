from io import BytesIO

import qrcode
from PIL import Image


def generate_qr_code(char):
    hex_representation = hex(ord(char))[
        2:
    ]  # Get hex representation of the character without '0x' prefix
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(hex_representation)
    qr.make(fit=True)

    img = qr.make_image(fill_color="black", back_color="white")
    return img


def generate_gif(text):
    chars = list(text)
    images = []
    for char in chars:
        qr_image = generate_qr_code(char)
        byte_io = BytesIO()
        qr_image.save(byte_io, "PNG")
        byte_io.seek(0)
        images.append(Image.open(byte_io))

    images[0].save(
        "INRACI.gif", save_all=True, append_images=images[1:], duration=50, loop=0
    )


input_text = "INRACI"
generate_gif(input_text)