import base64

obfuscated_string = "MturA+s7EREp"
obfuscated_bytes = base64.b64decode(obfuscated_string)

deobfuscated_bytes = bytearray(obfuscated_bytes)
for i in range(len(deobfuscated_bytes)):
    deobfuscated_bytes[i] = (((deobfuscated_bytes[i] & 0xFF) >> 3) | ((deobfuscated_bytes[i] << 5) & 0xFF)) & 0xFF
    deobfuscated_bytes[i] ^= 18  # XOR with 18

deobfuscated_secret = deobfuscated_bytes.decode()
print("Deobfuscated secret:", deobfuscated_secret)
