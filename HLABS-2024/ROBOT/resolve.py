from pwn import remote

# information from ctf
host = "hlabs.helb-prigogine.be"
port = 5001

def get_solution(calcul):
    nb1 = int(calcul[1])
    nb2 = int(calcul[3])
    op = calcul[2]

    print(nb1)
    print(nb2)
    print(op)

    if (op == "/"):
        return int(nb1 / nb2)
    elif (op == "*"):
        return nb1 * nb2
    elif (op == "+"):
        return nb1 + nb2
    else:
        return nb1 - nb2

if __name__ == "__main__":
    r = remote(host, port)
    raw_input = r.recv()

    # transform the data to str and get the 6th line
    text = raw_input.decode()

    while (True):
        calcul = r.recv().decode().split()

        solution = get_solution(calcul)
        print("------------------------------------------------------------------------------------------")
        print(calcul)
        print("------------------------------------------------------------------------------------------")
        print("------------------------------------------------------------------------------------------")
        print(solution)
        print("------------------------------------------------------------------------------------------")

        r.sendline(str(solution))

        # close the connection
    r.close()

