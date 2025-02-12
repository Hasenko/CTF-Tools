import struct

# The target password after transformation
target_password_hex = 0x13401f330f0d360a
target_password_bytes = struct.pack("<Q", target_password_hex)  # Convert to little-endian bytes

# Reverse transformation
original_password = ''.join(chr((b - 4) ^ 0x4B) for b in target_password_bytes)
print("Recovered password:", original_password)

"""
title : locked

description : I forgot my password. Can you recover it ?

solution :
    Use ghidra and discover all function used.
        - main
        - check_pswd
        - transform_pswd

    la méthode main fait un appel a la méthode check_pswd. Si la valeur renvoyé est true, le flag est afficher. Sinon, un message d'erreur est envoyé.

    la méthode check_pswd fait appel à la méthode transform_pswd qui renvoie une valeur qui est comparer à local_98 = 0x13401f330f0d360a;
    si c'est la même chose, le mot de passe est correct.

    la méthode transform_pswd modifie l'input utilisateur comme ceci : param_1[i] = (param_1[i] ^ 0x4B) + 4;
    1. XOR l'input utilisateur avec 0x4B.
    2. Ajouter 4 à la valeur obetnue avec XOR.
    
    Donc avec toute ces informations, on sait qu'il faut reverse la méthode transform_pswd et d'utiliser la méthode reverse sur 0x13401f330f0d360a, qui donnera le bon mot de passe.

    Donc il faut soustraire 4 a chaque octets de 0x13401f330f0d360a.
    ensuite, il faut XOR chaque octets de la nouvelle valeur obtenue avec 0x4B.

    C'est ce que fait le code ci-dessus, qui donne le bon mot de passe. Il faut ensuite entrer ce mot de passe dans le fichier Locked
"""