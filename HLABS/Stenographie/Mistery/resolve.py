"""
solution :

extraire tout les fichiers du pdf
    -> binwalk -e Mistery.pdf

    DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PDF document, version: "1.7"
687           0x2AF           Zlib compressed data, default compression
2629          0xA45           Zlib compressed data, default compression
3063          0xBF7           JPEG image data, JFIF standard 1.01
19089         0x4A91          Zlib compressed data, default compression
48981         0xBF55          Zlib compressed data, default compression
66290         0x102F2         Zlib compressed data, default compression
72928         0x11CE0         PNG image, 1120 x 1120, 8-bit/color RGBA, non-interlaced
73019         0x11D3B         Zlib compressed data, compressed

découvrir qu'il y a deux images dedans.
utiliser la commande dd pour convertir de zlib à PNG
    -> dd if=Mistery.pdf of=extracted_image2.png bs=1 skip=72928

bs=1
skip= 'nombre décimal'
"""