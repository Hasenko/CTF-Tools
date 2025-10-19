from binascii import unhexlify

def brute(input, key):
    if len(input) != len(key):
        return "Failed!"

    output = b''
    for b1, b2 in zip(input, key):
        output += bytes([b1 ^ b2])
    try:
        return output.decode("utf-8")
    except:
        return "Cannot Decode some bytes"

# Hex-encoded cipher text
data = "0A550E0E4824005E69023843795657565D5D2F685E446C5B00792C0016331B594D"
cipher = unhexlify(data)
print("[-] CIPHER: {}".format(cipher))

# First Step: Find partial key by decrypting the first 7 bytes using known part of the key "helb{"
key_part = brute(cipher[:5], "helb{".encode())
print("[-] PARTIAL KEY FOUND: {}".format(key_part))

# Second Step: Extend the key to match the length of the cipher text
key = (key_part).encode()  # Assuming the next character is 'y'
# Repeat the key to match the length of the cipher
key = (key * (len(cipher) // len(key))) + key[:(len(cipher) % len(key))]
print("[-] Decoding using KEY: {}".format(key))

# Decrypt the entire cipher with the full key
plain = brute(cipher, key)
print("\n[*] FLAG: {}".format(plain))