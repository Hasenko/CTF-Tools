#!/usr/bin/env python3

import socket
import math
import random
import threading
import signal
import sys

VALUE = int(math.pow(10, 6))
GOAL = 1000

ascci_template = r"""
/$$$$$$            /$$$$$$  /$$$          /$$   /$$                     /$$                     /$$
|_  $$_/           /$$__  $$|__/          |__/  | $$                    | $$                    | $$
  | $$   /$$$$$$$ | $$  \__/ /$$ /$$$$$$$  /$$ /$$$$$$    /$$$$$$       | $$ /$$   /$$  /$$$$$$$| $$   /$$
  | $$  | $$__  $$| $$$$    | $$| $$__  $$| $$|_  $$_/   /$$__  $$      | $$| $$  | $$ /$$_____/| $$  /$$/
  | $$  | $$  \ $$| $$_/    | $$| $$  \ $$| $$  | $$    | $$$$$$$$      | $$| $$  | $$| $$      | $$$$$$/
  | $$  | $$  | $$| $$      | $$| $$  | $$| $$  | $$ /$$| $$_____/      | $$| $$  | $$| $$      | $$_  $$
 /$$$$$$| $$  | $$| $$      | $$| $$  | $$| $$  |  $$$$/|  $$$$$$$      | $$|  $$$$$$/|  $$$$$$$| $$ \  $$
|______/|__/  |__/|__/      |__/|__/  |__/|__/   \___/   \_______/      |__/ \______/  \_______/|__/  \__/
"""

banner = r"""
Can you guess the random number between 1 and 10 a thousand times? If you do I'll give you the flag.
Surely you would need infinite luck, or is it just a one in a million chance?

Good luck!

(make sure to place spaces between the values)
"""

def __build_rule_from_template(builder):
    image = ""
    for c in ascci_template:
        if c == '$':
            value = random.randint(0, len(builder) - 1)
            image += builder[value]
        else:
            image += c

    return image

def __print_rules(client_socket: socket):
    characters = "abcdefghi"
    ascii_image = __build_rule_from_template(characters)
    client_socket.send((ascii_image + banner).encode())
    client_socket.send("🍀> ".encode())


def __check_value(data):
    solution = []
    answer = ""
    for v in data:
        value = random.randint(1, 10)
        solution.append(str(value))
        if not v.isnumeric():
            return f"The character {v} is not an integer."
        if int(v) != value:
            answer = f"Sorry your value was wrong, better luck next time..."

    if answer == "":
        return "Lucky!!"
    else:
        sol_str = " ".join(solution)
        return answer + "\n" + f"The solution was:\n{sol_str}"


def value_guesser(client_socket):
    seed = random.randint(1, VALUE)
    random.seed(seed)
    __print_rules(client_socket)

    data = client_socket.recv(4096).decode('utf-8').strip()
    values = data.split(' ')

    if len(values) == GOAL:
        answer = __check_value(values)
        client_socket.send(answer.encode())
        if "Lucky" in answer:
            client_socket.send("flag: NOTAFLAG{IfYouHadAFlagItdBeHere}".encode())
            client_socket.close()
            return
    else:
        client_socket.send(f"I do not check partial answers ({len(values)})".encode())

    client_socket.close()
    return



def signal_handler(signum, frame):
    print("Received SIGTERM, shutting down...")
    sys.exit(0)

signal.signal(signal.SIGTERM, signal_handler)

host = "0.0.0.0"
port = 1338
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind((host, port))

server.listen(5)
while True:
    c, addr = server.accept()
    print('Connected to :', addr[0], ':', addr[1])
    thread = threading.Thread(target=value_guesser, args=(c,))
    thread.start()
server.close()
