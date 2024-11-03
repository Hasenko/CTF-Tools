def extract_bmp_from_bin(bin_file, output_file):
    with open(bin_file, 'rb') as f:
        data = f.read()
        
        # Look for 'BM' header
        header_index = data.find(b'BM')
        if header_index == -1:
            print("BMP header not found!")
            return
        
        bmp_size = 200 * 154 * 3 + 54  # +54 for the header // 200 = width; 154 = height
        bmp_data = data[header_index:header_index + bmp_size]
        
        with open(output_file, 'wb') as out:
            out.write(bmp_data)
        print(f"BMP extracted to {output_file}")

# Run the extraction
extract_bmp_from_bin('extracted_data.bin', 'hidden_image.bmp')