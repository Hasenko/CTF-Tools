import os
import zlib

zlib_directory = '_JumpStar.exe.extracted/'  # Replace with your directory
for filename in os.listdir(zlib_directory):
    if filename.endswith('.zlib'):
        try:
            with open(os.path.join(zlib_directory, filename), 'rb') as f:
                compressed_data = f.read()
                decompressed_data = zlib.decompress(compressed_data)

                # Check if it starts with PNG signature
                if decompressed_data.startswith(b'\x89PNG'):
                    with open(os.path.join(zlib_directory, f'decompressed_{filename}.png'), 'wb') as out:
                        out.write(decompressed_data)
                    print(f'Found PNG in {filename}, saved as decompressed_{filename}.png')

        except Exception as e:
            print(f'Error processing {filename}: {e}')



"""
solution :

afficher les ressources utiliser en claire du fichier JumpStar.exe avec la commande strings :
    strings JumpStar.exe | grep -E "resources"

    résultat :
        bresources\DUNGGEUNMO.TTF
    bresources\fake_flag.png
    bresources\flag.png
    bresources\gameover.mp3
    bresources\jump.mp3

sauf que dans les ressources donner dans le zip, fake_flag.png n'est pas présent

analyser le code et trouver que le flag s'affiche quand on fait le score mit dans la variable WIN_SCORE (30)
modifier la variable à 0 et faire ce score. Se prendre un fake flag et remarqué que pour afficher le flag, le code va chercher dans le dossier resources/flag.png

    # WIN
            if self.win == True:
                if self.flag is None:
                    self.flag = pygame.image.load(rsc_path('resources\\flag.png'))

donc j'en déduis que cette ligne de code affiche en faites fake_flag.png
    -> self.flag = pygame.image.load(rsc_path('resources\\flag.png'))

donc je n'ai qu'a extraire les fichiers png du .exe et mettre la main dessus. Pour ce faire, j'ai utilise rla commandes binwalk
    -> binwalk -e JumpStar.exe

j'ai plein de fichier extrain en .zlib et dans la console je vois passer ces 2 lignes :
    -> 14605960      0xDEDE88        PNG image, 400 x 356, 8-bit/color RGB, non-interlaced
    -> 274624        0x430C0         PNG image, 256 x 256, 8-bit/color RGBA, non-int

ensuite je regarde les dimmenssions de l'image présente dans les ressources à ma disposition, elle font du 400 x 356.
donc la 1ère image extraite est le fake_flag.png

j'ai n'ai qu'à extraire les images et prendre l'image png qui est en 256 x 256
"""