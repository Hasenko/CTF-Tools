#!/usr/local/bin/python

import pickle
import base64
try:
    encoded_data = input("pickle or paprika ? ")
    clean_data = ''.join(encoded_data.split())
    pickle_data = base64.b64decode(clean_data)
    result = pickle.loads(pickle_data)
    print("Unserialization done :", result)

except Exception as e:
    print("Error :", e)
