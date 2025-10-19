from Crypto.Util.number import bytes_to_long, long_to_bytes
from sympy import factorint
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization
import base64

class RSA():
    def __init__(self, e, p, q):
        self.e = e
        self.p = p
        self.q = q
        self.n = self.p * self.q
        self.phi = (self.p - 1) * (self.q - 1)
        self.d = pow(self.e, -1, self.phi)

    def decrypt(self, message):
        return long_to_bytes(pow(message, self.d, self.n))

# Step 1: Extract values from the public key
public_key_pem = """-----BEGIN PUBLIC KEY-----
MEQwDQYJKoZIhvcNAQEBBQADMwAwMAIpAKw6jlnduhqx2McMyJqjPIz6Hyd1e3nM
Z+mgBYCAsC8roS0Z7X26SccCAwEAAQ==
-----END PUBLIC KEY-----"""

# Load the public key from PEM format
public_key_bytes = public_key_pem.encode('utf-8')
public_key = serialization.load_pem_public_key(public_key_bytes, backend=default_backend())

# Extract e and n
if isinstance(public_key, rsa.RSAPublicKey):
    # Get the public numbers
    numbers = public_key.public_numbers()
    e = numbers.e
    n = numbers.n

# Step 2: Factor n to find p and q
factors = factorint(n)
p, q = factors.keys()

# Step 3: Create RSA instance
rsa_instance = RSA(e, p, q)

# Step 4: Retrieve the secret message you got from netcat
secret_message = 909700427316956103892584184370076931696453974583702027713820867257001510359230598373290543957948113412628685169254860593980641331596292617490009124591079848309147163479187959292915015653341338977561587697276823153936140667387583568578415428172808297926426388798672242384489818010276234776
decrypted_message = rsa_instance.decrypt(secret_message)

# Step 5: Print the decrypted message
decrypted_bytes = rsa_instance.decrypt(secret_message)

# Attempt to print as raw bytes
print("Decrypted Bytes:", decrypted_bytes)

# Attempt different decoding methods
try:
    print("Decoded Message (UTF-8):", decrypted_bytes.decode('utf-8'))
except UnicodeDecodeError:
    try:
        print("Decoded Message (Latin-1):", decrypted_bytes.decode('latin-1'))
    except UnicodeDecodeError:
        print("Failed to decode using both UTF-8 and Latin-1")

# Print in hexadecimal
print("Decrypted Message in Hex:", decrypted_bytes.hex())

hex_string = "585c334d4a4ca527f2704b2096f5c2e1fbc7b30657f9297baa028642d557a27a51193132d7b2176f"
ascii_output = bytes.fromhex(hex_string).decode('latin-1', errors='ignore')
print("Hex to ASCII:", ascii_output)
