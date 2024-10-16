from os import urandom
from Crypto.Cipher import DES3
from Crypto.Util.Padding import pad, unpad

salt = urandom(8) # 8 bytes ! don't try to bruteforce it you dont't have enough time for that...

def xor(a, b):
    # Create an empty list to store the results
    result = bytearray()  # Use bytearray for better performance
    b_length = len(b)
    
    # Iterate over each byte of 'a'
    for i in range(len(a)):
        # Perform XOR with the corresponding byte of 'b'
        result.append(a[i] ^ b[i % b_length])  # Repeat b using the modulo operator

    return bytes(result)  # Convert to bytes and return


# Function to encrypt a message in ECB mode
def encrypt_3des_ecb(key, plaintext):
    key = bytes.fromhex(key)
    plaintext = bytes.fromhex(plaintext)
    plaintext = xor(plaintext, salt) # salting
    cipher = DES3.new(key, DES3.MODE_ECB)
    padded_text = pad(plaintext, DES3.block_size)  # Padding
    ciphertext = cipher.encrypt(padded_text)  
    ciphertext = xor(ciphertext, salt)
    return ciphertext

# Function to decrypt a message in ECB mode
def decrypt_3des_ecb(key, ciphertext):
    key = bytes.fromhex(key)
    ciphertext = bytes.fromhex(ciphertext)
    ciphertext = xor(ciphertext, salt)
    cipher = DES3.new(key, DES3.MODE_ECB)
    padded_plaintext = cipher.decrypt(ciphertext)
    unpadded = unpad(padded_plaintext, DES3.block_size) # Unpadding
    plaintext = xor(unpadded, salt) # unsalting
    return plaintext


# Sample of encrypt/decrypt
key = '1234567890ABCDEF0123456789ABCDEF'
plain_text = '68656c6c6f206c657320676172732c20656e66696e206465206c612063727970746f202120616c6c657a20617520626f756c6f7420212121'

# Encrypting the message
encrypted_message = encrypt_3des_ecb(key, plain_text)
print(f"Encrypted message (hex): {encrypted_message.hex()}")

# Decrypting the encrypted message
decrypted_message = decrypt_3des_ecb(key, encrypted_message.hex())
print(f"Decrypted message (hex, original text): {decrypted_message.hex()}")

byte_data = bytes.fromhex(decrypted_message.hex())
decoded_string = byte_data.decode('utf-8')
print(f"Decrypted message (hex, original text decoded): {decoded_string}")