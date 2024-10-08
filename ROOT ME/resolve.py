import math
from pwn import remote

"""
https://www.root-me.org/fr/Challenges/Programmation/TCP-Retour-au-college
"""

host = "challenge01.root-me.org"
port = 52002

def gen_solution(nb1, nb2):
    return round(math.sqrt(nb1) * nb2, 2)

if __name__ == "__main__":
    r = remote(host, port)
    raw_input = r.recv()

    text = raw_input.decode().splitlines()[6]
    nb1 = int(text.split()[5])
    nb2 = int(text.split()[9])

    solution = gen_solution(nb1, nb2)
    
    r.sendline(str(solution))
    
    response = r.recv()
    print(response.decode())

    r.close()