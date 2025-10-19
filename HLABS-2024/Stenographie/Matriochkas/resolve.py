def extract_bmp_from_bin(bin_file, output_file):
    with open(bin_file, 'rb') as f:
        data = f.read()
        
        # Look for 'BM' header
        header_index = data.find(b'BM')
        if header_index == -1:
            print("BMP header not found!")
            return
        
        # Read the header size to find where pixel data starts
        header_size = 54  # Standard BMP header size
        # Total size is usually in bytes 2-5 of the header
        file_size = int.from_bytes(data[header_index + 2:header_index + 6], 'little')
        
        # Extract the entire BMP data
        bmp_data = data[header_index:header_index + file_size]
        
        with open(output_file, 'wb') as out:
            out.write(bmp_data)
        print(f"BMP extracted to {output_file}")

# Run the extraction
extract_bmp_from_bin('extracted_data.bin', 'hidden_image.bmp')