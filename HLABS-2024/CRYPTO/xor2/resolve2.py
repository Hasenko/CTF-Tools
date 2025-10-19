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

# Known part of the plaintext for decryption
known_plaintext = "helb{"

# Calculate the known part of the key
key_part = brute(cipher[:len(known_plaintext)], known_plaintext.encode())
print("[-] PARTIAL KEY FOUND: {}".format(key_part))

# Known part of the key
known_key_part = key_part  # This is b0bl3

# Define the character set to append to the key (including all letters, digits, and special characters)
characters = (
    "abcdefghijklmnopqrstuvwxyz"  # lowercase letters
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"  # uppercase letters
    "0123456789"                    # digits
    "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"  # special characters
)

# Iterate over each character to find the complete key
for char in characters:
    # Build the new key by appending the current character
    full_key = known_key_part + char.encode()  # e.g., b0bl3a, b0bl3b, ...
    
    # Repeat the key to match the length of the cipher
    key = (full_key * (len(cipher) // len(full_key))) + full_key[:(len(cipher) % len(full_key))]

    print("[-] Decoding using KEY: {}".format(key))
    
    # Decrypt the entire cipher with the full key
    plain = brute(cipher, key)
    
    # Print the decrypted text for debugging
    print(plain)
    
    # Check if the output ends with '}' to identify a valid flag
    if plain.endswith('}'):
        print("\n[*] FLAG: {}".format(plain))
        print("[*] Full Key Used: {}".format(full_key.decode()))
        break
