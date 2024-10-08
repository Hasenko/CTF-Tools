from pwn import remote

# information from ctf
host = ""
port = 0

def get_solution():
    result = ""

    return result

if __name__ == "__main__":
    r = remote(host, port)
    raw_input = r.recv()

    # transform the data to str and get the 6th line
    text = raw_input.decode().splitlines()[6]

    # do the thing here
    solution = get_solution(text)

    # send the solution to the server as str
    r.sendline(str(solution))
    
    # receive the response from the server
    response = r.recv()
    print(response.decode())
    
    # close the connection
    r.close()