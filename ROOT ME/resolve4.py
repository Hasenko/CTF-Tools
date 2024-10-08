import base64
import zlib
from pwn import remote

# information from ctf
host = "challenge01.root-me.org"
port = 52022

def get_solution(serverInput):
    decoded64 = base64.b64decode(serverInput)
    print("B64 DECODER : ", decoded64)

    unzipped = zlib.decompress(decoded64)
    print("UNZIPPED : ", unzipped)

    return unzipped

if __name__ == "__main__":
    r = remote(host, port)

    response = r.recv()
    while True:
        try:
            text = response.decode().splitlines()[6]
        except:
            text = response.decode()

        encodedString = text.split()[3].replace("'", "").replace(".","")

        print(text)
        print("--------------------------------------------------------------------------------")
        print(encodedString)

        solution = get_solution(encodedString).decode()

        r.sendline(str(solution))
        response = r.recv()
        print(response.decode())

        if "lost" in response.decode():
            break
    
    r.close()