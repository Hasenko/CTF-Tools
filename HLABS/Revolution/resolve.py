param_2 = 0

while True:
    password = [''] * 0x1a  # Length of 0x1a (26 characters)

    password[0] = chr(0x80 - param_2)
    password[1] = chr(0x7d - param_2)
    password[2] = chr(0x84 - param_2)
    password[3] = chr(0x7a - param_2)
    password[4] = chr(0x93 - param_2)
    password[5] = chr(0x6b - param_2)
    password[6] = chr(0x49 - param_2)
    password[7] = chr(0x85 - param_2)
    password[8] = chr(0x68 - param_2)
    password[9] = chr(0x84 - param_2)
    password[0xa] = chr(0x77 - param_2)
    password[0xb] = chr(0x77 - param_2)
    password[0xc] = chr(0x68 - param_2)
    password[0xd] = chr(0x4c - param_2)
    password[0xe] = chr(0x8c - param_2)
    password[0xf] = chr(0x7b - param_2)
    password[0x10] = chr(0x60 - param_2)
    password[0x11] = chr(0x77 - param_2)
    password[0x12] = chr(0x48 - param_2)
    password[0x13] = chr(0x8a - param_2)
    password[0x14] = chr(0x77 - param_2)
    password[0x15] = chr(0x4b - param_2)
    password[0x16] = chr(0x70 - param_2)
    password[0x17] = chr(0x4b - param_2)
    password[0x18] = chr(0x5b - param_2)
    password[0x19] = chr(0x95 - param_2)

    print("Password: ", ''.join(password))

    param_2 += 1
    if (password[0] == 'h' and password[1] == 'e' and password[2] == 'l' and password[3] == 'b'):
        break


"""
solution :

prendre la fonction double check et faire le chemin inverse.
jsp pas pourquoi mais le 11ème charactère à été remplacer par _ au lieu de 3
    -> helb{S1mPl__P4tcH_0r_3X3C}
"""