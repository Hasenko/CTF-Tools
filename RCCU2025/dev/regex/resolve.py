import re
import random
import string

# The regex pattern (same as your explanation)
pattern = re.compile(r'^(?=(.))(?!\1{2})(?=(?:.[02468]){2})(?=(?:.[13579]){3})(?=(?:.*[a-z]{2,5}))[a-z0-9]{8,13}$')

# Function to generate a random string of length 8 to 13
def generate_random_candidate():
    length = random.randint(8, 13)
    chars = string.ascii_lowercase + string.digits
    return ''.join(random.choice(chars) for _ in range(length))

# Brute-force until a match is found (limit to avoid infinite loops)
max_attempts = 100000
while True:
    candidate = generate_random_candidate()
    if pattern.match(candidate):
        print(f"✅ Valid flag found: {candidate}")
        break
else:
    print("❌ No valid string found after max attempts.")