from pwn import remote
import base64

"""
https://www.root-me.org/fr/Challenges/Programmation/TCP-Chaine-encodee
"""

# information from ctf
host = "challenge01.root-me.org"
port = 52023

if __name__ == "__main__":

    # connection to the server
    r = remote(host, port)

    # receive the data from server
    raw_input = r.recv()

    # transform the data to str and get the 6th line
    text = raw_input.decode().splitlines()[6]
    print(text)

    encodedString = text.split()[3].replace("'", "").replace(".","")

    result = base64.b64decode(encodedString)

    r.sendline(result.decode())
    response = r.recv()
    print(response.decode())
    r.close()