from pwn import remote

"""
https://www.root-me.org/fr/Challenges/Programmation/TCP-La-roue-romaine

Rotate number and letter by 13
ex : 

A --> N
1 --> 4
"""

# information from ctf
host = "challenge01.root-me.org"
port = 52021

def decode_rot13(rot13):
    result = ""

    for char in rot13:
        if 'a' <= char <= 'z':
            result += chr((ord(char) - ord('a') + 13) % 26 + ord('a'))
        elif 'A' <= char <= 'Z':
            result += chr((ord(char) - ord('A') + 13) % 26 + ord('A'))
        elif '0' <= char <= '9':
            result += str((int(char) + 3) % 10)
        else:
            result += char

    print(result)
    return result

if __name__ == "__main__":

    # connection to the server
    r = remote(host, port)

    # receive the data from server
    raw_input = r.recv()

    # transform the data to str and get the 6th line
    text = raw_input.decode().splitlines()[6]
    print(text)

    rot13 = text.split()[3].replace("'", "").replace(".","")
    print(rot13)

    result = decode_rot13(rot13)

    r.sendline(result)
    response = r.recv()
    print(response.decode())
    r.close()
    