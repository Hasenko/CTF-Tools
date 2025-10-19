import hashlib
import socket
import threading
import time

FLAG = "helb{fake_flag}"

def hash_password(password):
    pwd = bytes.fromhex(password)
    return hashlib.md5(pwd).hexdigest()

def add_user(users, login, password):
    password_hash = hash_password(password)

    if login in users:
        if users[login]["password"] == password:
            return "User already exists with the same password.\n"
        if users[login]["hash"] == password_hash:
            return f"User already exists but something is wrong: {FLAG}\n"

    users[login] = {"password": password, "hash": password_hash}
    return f"User {login} added to the system.\n"

def authenticate_user(users, login, password):
    if login not in users:
        return "User not found.\n"
    
    if users[login]["password"] != password:
        return "Incorrect password.\n"
    
    return f"Welcome, {login}.\n"

def handle_client(conn):
    users = {}

    try:
        conn.settimeout(10)
        conn.sendall(b"Welcome to the authentication server.\n")

        while True:
            conn.sendall(b"Enter command (add or auth): ")
            try:
                command = conn.recv(1024).decode().strip().lower()
            except socket.timeout:
                conn.sendall(b"Connection timed out. Goodbye!\n")
                break
            
            if command == "add":
                conn.sendall(b"Enter login: ")
                login = conn.recv(1024).decode().strip()

                conn.sendall(b"Enter password in hex format: ")
                password = conn.recv(1024).decode().strip()

                response = add_user(users, login, password)
                conn.sendall(response.encode())
            
            elif command == "auth":
                conn.sendall(b"Enter login: ")
                login = conn.recv(1024).decode().strip()

                conn.sendall(b"Enter password in hex format: ")
                password = conn.recv(1024).decode().strip()

                response = authenticate_user(users, login, password)
                conn.sendall(response.encode())
            
            elif command == "exit":
                conn.sendall(b"Goodbye!\n")
                break
            
            else:
                conn.sendall(b"Invalid command. Use 'add', 'auth', or 'exit'.\n")
                conn.sendall(command.encode())

    except (ConnectionResetError, BrokenPipeError):
        print("Client disconnected unexpectedly.")
    
    except Exception as e:
        conn.sendall(f"An error occurred: {str(e)}\n".encode())
    
    finally:
        conn.close()

def start_server(host='0.0.0.0', port=5222):
    while True:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.bind((host, port))
                s.listen()
                print(f"Server listening on {host}:{port}...")

                while True:
                    conn, addr = s.accept()
                    print(f"Connected by {addr}")
                    client_thread = threading.Thread(target=handle_client, args=(conn,))
                    client_thread.start()

        except Exception as e:
            print(f"Server crashed with error: {e}")
            time.sleep(5)
            print("Restarting server...")

if __name__ == '__main__':
    start_server()
