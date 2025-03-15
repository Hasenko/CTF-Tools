import os
def zip_to_binary(input_folder, output_folder):
    os.makedirs(output_folder, exist_ok=True)  # Ensure output folder exists
    
    for file_name in sorted(os.listdir(input_folder)):
        if file_name.endswith(".zip"):  # Process only zip files
            zip_path = os.path.join(input_folder, file_name)
            output_path = os.path.join(output_folder, f"{file_name}.txt")
            
            try:
                with open(zip_path, "rb") as zip_file:
                    binary_data = zip_file.read()
                    binary_string = "".join(f"{byte:08b}" for byte in binary_data)
                    
                    with open(output_path, "w") as output_file:
                        output_file.write(binary_string)
                    
                    print(f"Binary data saved to {output_path}")
            except Exception as e:
                print(f"Error processing {file_name}: {e}")

# Example usage
zip_to_binary("input_zip", "output_txt")