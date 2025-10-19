from Crypto.Cipher import DES3
from Crypto.Util.Padding import pad, unpad
import binascii

# Define the XOR function
def xor(a, b):
    result = bytearray()
    b_length = len(b)
    
    for i in range(len(a)):
        result.append(a[i] ^ b[i % b_length])
    
    return bytes(result)

# Decrypt function
def decrypt_3des_ecb(key, ciphertext, salt):
    key = bytes.fromhex(key)
    ciphertext = bytes.fromhex(ciphertext)

    # XOR with the salt first
    ciphertext = xor(ciphertext, salt)
    
    cipher = DES3.new(key, DES3.MODE_ECB)
    padded_plaintext = cipher.decrypt(ciphertext)
    
    try:
        # Attempt to unpad the decrypted plaintext
        plaintext = unpad(padded_plaintext, DES3.block_size)
    except ValueError as e:
        print("Padding Error:", e)
        return None
    
    # Unsalt the plaintext
    plaintext = xor(plaintext, salt)
    
    return plaintext

# Your known values
key = '1234567890ABCDEF0123456789ABCDEF'  # Your encryption key
encrypted_flag = '65eb0b3de2d9b1a312d168dc83bf1e65ac3f0d95a30129a27e3ce994ae408979e084530fb47ff8c7be4260820c183b999b4357f3d3e8425ffbef7b859f9ee86876c22e29e32ccbf2'  # Encrypted flag

# Generate salt (replace this with the known salt if you have it)
# This is an assumption, and you should replace it with the correct salt if you know it.
salt = b'12345678'  # Replace this with your known salt value (must be 8 bytes)

# Decrypt the flag
decrypted_flag = decrypt_3des_ecb(key, encrypted_flag, salt)

if decrypted_flag:
    print("Decrypted Flag (hex):", decrypted_flag.hex())
    print("Decrypted Flag (ASCII):", decrypted_flag.decode('utf-8', errors='ignore'))
else:
    print("Decryption failed.")
