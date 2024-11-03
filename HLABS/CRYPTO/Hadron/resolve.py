import hashlib

# Define the inputs
input_a = bytes.fromhex("d131dd02c5e6eec4693d9a0698aff95c2fcab58712467eab4004583eb8fb7f89 55ad340609f4b30283e488832571415a085125e8f7cdc99fd91dbdf280373c5b d8823e3156348f5bae6dacd436c919c6dd53e2b487da03fd02396306d248cda0 e99f33420f577ee8ce54b67080a80d1ec69821bcb6a8839396f9652b6ff72a70")
input_b = bytes.fromhex("d131dd02c5e6eec4693d9a0698aff95c2fcab50712467eab4004583eb8fb7f89 55ad340609f4b30283e4888325f1415a085125e8f7cdc99fd91dbd7280373c5b d8823e3156348f5bae6dacd436c919c6dd53e23487da03fd02396306d248cda0 e99f33420f577ee8ce54b67080280d1ec69821bcb6a8839396f965ab6ff72a70")

# Hash the inputs using MD5
hash_a = hashlib.md5(input_a).hexdigest()
hash_b = hashlib.md5(input_b).hexdigest()

# Output the results
print("Hash of Input A:", hash_a)
print("Hash of Input B:", hash_b)
print("Hashes are identical:", hash_a == hash_b)

"""
solution :
    create a new user with a password that as a md5 collision (see above)
    then create a new user with the same login but a new password that as a md5 colision and the flag will be print.

helb{H4dR0n_c0Ll1s10N_d3t3cT3d_In_MD5_S3rV1c3}
"""