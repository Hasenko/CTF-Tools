"""
solution :

utiliser binwalk sur l'image de base et ensuite dd pour extraire l'image cachée. Ensuite refaire la même chose et voir que l'image extraite cache une image (poupée russe).

┌──(kali㉿kali)-[/media/…/CTF/HLABS/Stenographie/Babouchkas]
└─$ binwalk babouchkas.png 

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PNG image, 1920 x 1109, 8-bit/color RGBA, non-interlaced
54            0x36            TIFF image data, big-endian, offset of first image directory: 8
823846        0xC9226         PNG image, 900 x 1200, 8-bit/color RGBA, non-interlaced
823900        0xC925C         TIFF image data, big-endian, offset of first image directory: 8
2564090       0x271FFA        Zip archive data, at least v2.0 to extract, uncompressed size: 629986, name: bob2.jpeg
3043331       0x2E7003        Zip archive data, at least v2.0 to extract, uncompressed size: 233, name: __MACOSX/._bob2.jpeg
3043755       0x2E71AB        End of Zip archive, footer length: 22

┌──(kali㉿kali)-[/media/…/CTF/HLABS/Stenographie/Babouchkas]
└─$ dd if=babouchkas.png of=extracted_image.png bs=1 skip=823846 
2219947+0 records in
2219947+0 records out
2219947 bytes (2.2 MB, 2.1 MiB) copied, 195.749 s, 11.3 kB/s

┌──(kali㉿kali)-[/media/…/CTF/HLABS/Stenographie/Babouchkas]
└─$ binwalk -e extracted_image.png

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             PNG image, 900 x 1200, 8-bit/color RGBA, non-interlaced
54            0x36            TIFF image data, big-endian, offset of first image directory: 8
1740244       0x1A8DD4        Zip archive data, at least v2.0 to extract, uncompressed size: 629986, name: bob2.jpeg
2219485       0x21DDDD        Zip archive data, at least v2.0 to extract, uncompressed size: 233, name: __MACOSX/._bob2.jpeg
2219909       0x21DF85        End of Zip archive, footer length: 22
"""