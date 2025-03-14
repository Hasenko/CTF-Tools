import socket, time, random

# Server details
host = "172.20.10.2"
host = "infinite_luck.challenges.cybersecuritychallenge.be"
port = 1338

def generate(builder):
    image = ""
    for i in range (246):
        value = random.randint(0, len(builder) - 1)
        image += builder[value]

    return image

def get_seed(char_sequence):
    for i in range(1000000):
        random.seed(i)
        generated_charsequence = generate("abcdefghi")
        if generated_charsequence == char_sequence:
            print("found")
            print(generated_charsequence)
            return i
    print("no seed found")
    return 0

def generate_solution():
    solution = []
    for i in range(333):
        value = random.randint(1, 10)
        solution.append(str(value))

    return " ".join(solution)

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client_socket:
    client_socket.connect((host, port))
    banner = client_socket.recv(4096).decode('utf-8').strip().lower().split("can you guess")[0]
    print(banner)

    banner_without_special_char = banner.replace("\\", "").replace("/", "").replace("_", "").replace("|", "")
    print(banner_without_special_char)

    banner_letter = ''.join([char for char in banner_without_special_char if char in 'abcdefghi'])
    print(banner_letter)
    print('-------------------------------')

    print("seed : ", get_seed(banner_letter))
    solution = generate_solution()
    print(solution)
    client_socket.send(solution.encode())

    response = client_socket.recv(4096).decode('utf-8')
    print(response)
    response = client_socket.recv(4096).decode('utf-8')
    print(response)

"""
1 6 2 4 6 1 9 6 3 6 2 6 8 9 5 9 7 4 6 3 8 8 2 8 10 7 6 6 1 1 3 5 10 10 6 9 8 4 2 8 9 6 10 3 1 7 10 9 2 9 5 8 8 3 2 6 8 5 9 7 9 9 4 1 8 1 5 6 5 3 7 2 1 9 5 1 4 6 4 8 7 3 5 5 4 6 6 8 10 3 10 9 5 5 7 4 3 3 6 8 8 8 6 3 10 6 5 7 5 9 5 4 9 8 10 1 6 10 7 8 3 2 2 2 9 2 4 1 1 8 4 4 3 5 2 5 7 4 10 6 4 4 8 1 8 2 1 5 1 2 8 8 7 5 7 7 5 8 7 3 10 9 6 2 2 4 5 7 2 5 1 7 5 3 10 2 1 6 5 10 9 4 3 2 2 3 4 3 2 4 8 7 10 5 1 2 8 3 3 8 8 8 10 3 9 1 10 3 4 2 3 8 2 5 2 6 3 1 10 3 1 10 2 3 7 2 9 1 9 3 7 1 4 1 2 10 7 1 2 5 3 6 5 2 4 9 9 7 1 9 9 6 8 5 4 4 7 9 3 2 7 7 8 5 1 8 4 1 3 8 2 8 9 5 8 10 8 10 3 2 3 4 10 2 2 3 7 7 8 9 6 9 7 3 8 10 8 6 1 7 1 8 2 6 9 9 8 7 3 6 10 1 8 3 7 2 7 7 2 7 6 2 2 1 8 3 6 6 5 1 5 9 4

2 3 9 5 7 9 4 5 4 7 2 7 10 1 6 7 3 1 5 9 7 10 9 7 5 6 9 8 2 8 7 10 8 8 6 5 9 10 1 4 4 5 7 1 8 2 2 3 9 9 1 5 10 2 9 6 1 1 3 1 1 10 8 8 3 9 10 2 4 4 10 5 2 4 9 8 9 4 2 10 2 7 9 2 6 4 3 1 7 4 5 10 10 7 2 3 9 8 10 9 9 2 10 6 6 7 10 10 4 7 6 1 1 2 2 7 2 10 5 6 8 9 5 3 6 5 7 5 1 2 8 2 9 8 5 2 5 7 5 6 8 10 3 6 10 1 4 1 8 3 2 10 4 7 7 2 8 9 5 5 9 3 7 7 2 4 3 5 6 4 8 1 7 3 5 4 7 7 1 5 10 5 9 9 9 9 6 6 6 1 9 8 7 3 2 10 1 6 4 7 8 8 4 10 5 5 5 4 1 2 7 4 10 8 3 7 8 2 10 8 5 8 5 9 5 6 1 2 4 1 8 2 4 2 3 8 1 10 6 5 3 1 4 4 10 3 3 9 2 3 8 9 8 3 8 4 2 2 3 9 7 9 6 3 4 3 2 9 2 2 6 8 7 10 8 10 4 2 9 3 7 7 5 7 5 3 2 2 6 6 2 10 10 10 1 10 9 1 4 3 7 1 5 10 6 1 5 4 1 9 9 1 2 5 10 8 8 4 1 7 3 9 1 10 7 2 5 5 2 1 5 5 6
"""