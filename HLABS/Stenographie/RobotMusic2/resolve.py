# Hex data from the non-zero part of the file
hex_data = '8c6696ce164c6296ce16cc6696ce164236aea662960c'

# Convert hex to bytes
byte_data = bytes.fromhex(hex_data)

# Try to decode as ASCII
print(byte_data.decode('ascii', errors='ignore'))