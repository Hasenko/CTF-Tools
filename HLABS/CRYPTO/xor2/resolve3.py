from binascii import unhexlify

def xor_decrypt(cipher, key):
    output = b''
    for b1, b2 in zip(cipher, key):
        output += bytes([b1 ^ b2])
    return output

# Hex-encoded cipher text
data = "0A550E0E4824005E69023843795657565D5D2F685E446C5B00792C0016331B594D"
cipher = unhexlify(data)

# Partially recovered key
partial_key = b"b0bl3"
full_key = bytearray(partial_key)

# Known part of the flag
known_flag = b"helb{F0<1Zsd4m?C[<t73zyi/"
# We need the remaining characters of the flag to derive the full key

# Start the key derivation from the length of the partial key
for i in range(len(partial_key), len(known_flag)):
    # Calculate the corresponding character in the key
    key_char = cipher[i] ^ known_flag[i]  # Recovering the key character
    full_key.append(key_char)  # Append to the full key

# Extend the key to match the length of the cipher text
full_key = (full_key * (len(cipher) // len(full_key))) + full_key[:(len(cipher) % len(full_key))]

# Decrypt the entire cipher with the full key
plain = xor_decrypt(cipher, full_key)
print("\n[*] FLAG: {}".format(plain.decode("utf-8", errors='ignore')))
print("[-] FULL KEY: {}".format(full_key.decode("utf-8", errors='ignore')))
