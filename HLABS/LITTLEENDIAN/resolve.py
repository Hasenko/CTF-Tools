import struct

def read_binary_file(file_path):
    total_sum = 0

    with open(file_path, 'rb') as f:
        while True:
            # Read the size of the data (1 byte)
            size_bytes = f.read(1)
            if not size_bytes:
                break  # End of file
            
            # Unpack the length field (1 byte)
            len_field = struct.unpack('<B', size_bytes)[0]
            print(f"Read length: {len_field}")  # Debugging line
            
            # Read the data field based on the length
            data_bytes = f.read(len_field)
            if len(data_bytes) != len_field:
                print(f"Expected {len_field} bytes, but got {len(data_bytes)} bytes.")
                break
            
            # Interpret the data bytes as an unsigned integer
            data_value = int.from_bytes(data_bytes, byteorder='little', signed=False)
            total_sum += data_value
            print(f"Read data: {data_value} (hex: {data_value:#x})")  # Debugging line

    return total_sum

def main():
    file_path = 'data.bin'  # Replace with your actual file path
    total_sum = read_binary_file(file_path)
    print(f"helb{{{total_sum}}}")

if __name__ == '__main__':
    main()

"""
explication :

lis le fichier binaire par sequence d'octet.

comment sont lit les octets ?

lit la valeur du premier octet (ex : 3)
ensuite prend les 3 prochains octet et les converties en décimal

donc :

0000 0011 | 0100 1010 | 1100 1111 | 0101 1100
    3           74         206          94

ensuite vu que le challenge dit que ça doit être en little endian, on inverse les octets (ce qui est a gauche vaut le moins)
donc :

74 * 256^0  = 74
206 * 256^1 = 52736
94 * 256^2  = 61440

donc la valeur ajoutée à la somme total est :
    -> 74 + 52736 + 61440
    -> 114250
"""