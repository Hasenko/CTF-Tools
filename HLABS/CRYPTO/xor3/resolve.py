from pwn import xor

# Your flag hex
flag = bytes.fromhex('0A550E0E4824005E69023843795657565D5D2F685E446C5B00792C0016331B594D')

# XOR with the beginning of the known flag
print(xor(flag, 'helb{'.encode()))

# If the result looks valid, you can continue trying to guess more parts of the flag

# Let's assume you're trying a key length of 5 (based on 'helb{')
possible_key = xor(flag[:5], 'helb{'.encode())
print(possible_key)

# Now try XORing the entire flag with the repeating key
decrypted_flag = xor(flag, possible_key * (len(flag) // len(possible_key)))
print(decrypted_flag)

from pwn import xor

for key_len in range(1, len(flag) + 1):
    possible_key = xor(flag[:key_len], 'helb{'.encode()[:key_len])
    decrypted_flag = xor(flag, possible_key * (len(flag) // len(possible_key)))
    print(f"Key length {key_len}: {decrypted_flag}")
