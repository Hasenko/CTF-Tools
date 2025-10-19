from pwn import remote

# information from ctf
host = "hlabs.helb-prigogine.be"
port = 8891

if __name__ == "__main__":

    while (True):
        r = remote(host, port)
        raw_input = r.recv()

        # transform the data to str and get the 6th line
        text = raw_input.decode()

        for i in range (0, 7):
            text = r.recv().decode()
            r.sendline(str(1))

        print(text)

    r.close()

"""
solution :

le code qui nous est donner à une erreur grave dans sa manière de comparer les chiffres de l'utilisateur avec les chiffres générer aléatoirement.
il ne regarde pas l'ordre mais seulement si le nombre que l'utilisateur à entrer est parmis les nombres générer.

    for i in your_nums:
        if i in jackpot: // erreur
            cnt += 1

il n'y a qu'à entré 6x le même nombre et les chances de gagne seront de 1/52
ensuite on brute force le truc
"""