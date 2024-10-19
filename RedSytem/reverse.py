import base64
import base58

def try_decode_bases(encoded_str):
    encodings = [
        ('Base64', base64.b64decode),
        ('Base32', base64.b32decode),
        ('Base58', base58.b58decode),
        ('Base85', base64.b85decode),
        ('Ascii85', base64.a85decode),
    ]
    
    for name, decode_func in encodings:
        try:
            # Try to decode
            decoded_bytes = decode_func(encoded_str)
            decoded_str = decoded_bytes.decode('utf-8')
            
            # Check if the decoded string starts with 'ctf'
            if decoded_str.startswith('ctf'):
                print(f"Decoded with {name}: {decoded_str}")
                return decoded_str
        except Exception as e:
            # Print error message only if necessary for debugging
            #print(f"Failed with {name}: {str(e)}")
            continue

    print("No valid base encoding found.")
    return None

# Test the function with the encoded string
encoded_string = "7P0\\WlY9VaBX'<9.H&FKK=+#s$ke'<0dDy=Zb[V9#fC5j(^4?:^C=6\\WnbmjjooiBi^csi($?5JwU{OP6l/HPx-LPFBKl0o{8\\;0#q[TgkCr&rRO/,/;h9_G**ZHj.;v3^H=5}_W(eBZSajQ.)]V!>UU9nLL)aDv8wQMlG,l?3aiTfU8E;;?pg5g.V<s'50j5%1J7K+B(km#;ib'AE&dhJY8bMO8;qrlE^/;"
try_decode_bases(encoded_string)