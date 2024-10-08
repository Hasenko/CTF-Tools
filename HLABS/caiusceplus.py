encrypted_flag = [45635, 45632, 45639, 45629, 45654, 45597, 45645, 45616, 45647, 45616, 45646, 45626, 45579, 45645, 45626, 45605, 45648, 45646, 45615, 45626, 45639, 45579, 45579, 45638, 45626, 45617, 45583, 45645, 45580, 45583, 45629, 45639, 45582, 45646, 45578, 45656]

def encrypt(str, key):
    return list(map(lambda c: ord(c)+key, str))

def decrypt(lst, key):
    return ''.join(list(map(lambda d: chr(d-key), lst)))
 
a,b,c,d = 1928,0x331,41909,0b1101101101

secret_key = 45531

FLAG = decrypt(encrypted_flag, secret_key)
print(FLAG)