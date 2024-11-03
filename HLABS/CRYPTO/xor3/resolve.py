import binascii

# Convert the hex string to bytes
hex_string = "680d090e194f4121646f0768422d6c6c1b745e5d6c2a216c197e2846453c170f22424431113752015e316b5a3a656e12795a1b4158331d30072112766231500d131141"
ciphertext = bytes.fromhex(hex_string)

# Function to XOR with a given key
def xor_decrypt(ciphertext, key):
    return bytes([b ^ key for b in ciphertext])

# Try different keys from 0 to 255
for key in range(256):
    decrypted = xor_decrypt(ciphertext, key)
    try:
        # Check if the decrypted text is readable ASCII
        if (decrypted.decode('ascii').startswith("helb")):
            print(f"Key {key}: {decrypted.decode('ascii')}")
    except UnicodeDecodeError:
        # Ignore if the text is not readable
        continue
