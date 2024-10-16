encrypted_hex = "0A550E0E4824005E69023843795657565D5D2F685E446C5B00792C0016331B594D"
encrypted_bytes = bytes.fromhex(encrypted_hex)

# Known repeating XOR key (0x62 0x30)
key = [0x62, 0x30]

# XOR decryption
decrypted_message = ''.join(chr(b ^ key[i % len(key)]) for i, b in enumerate(encrypted_bytes))

print(decrypted_message)
