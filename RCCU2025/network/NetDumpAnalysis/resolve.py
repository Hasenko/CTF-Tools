def calculate_checksum(header: bytes) -> int:
    """
    Calculate the IP header checksum.
    `header` should be a byte string of the IP header with the checksum field set to 0.
    """
    if len(header) % 2 != 0:
        header += b'\x00'  # pad if not even

    total = 0
    for i in range(0, len(header), 2):
        word = (header[i] << 8) + header[i + 1]
        total += word

    # Add carries
    while total > 0xFFFF:
        total = (total & 0xFFFF) + (total >> 16)

    # One's complement
    checksum = ~total & 0xFFFF
    return checksum

# Example usage with a 20-byte IP header (checksum field set to 0)
# Here's a sample IP header (without options) as a hex string:
ip_header_hex = "4500003c1c46400040060000ac100a63ac100a0c"
ip_header_hex = "45000034653d40003f0600000a42356f0a4233e6"

"""
Packet n°5

5c e9 31 cb da 2a ac 1f 6b 8d 01 de 08 00 45 00
00 34 65 3d 40 00 3f 06 XX XX 0a 42 35 6f 0a 42
33 e6 05 39 f5 0a cd ca 09 a6 7f d4 78 9a 80 10
01 fd 66 97 00 00 01 01 08 0a eb d6 3e 68 b9 a2
e2 4a
"""

ip_header_bytes = bytes.fromhex(ip_header_hex)

checksum = calculate_checksum(ip_header_bytes)
print(f"Checksum: 0x{checksum:04x}")