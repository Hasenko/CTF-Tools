import requests

def download_image(url, save_path):
    # Send a GET request to the image URL
    response = requests.get(url)
    
    # Check if the request was successful
    if response.status_code == 200:
        # Write the image content to a file
        with open(save_path, 'wb') as f:
            f.write(response.content)
        print(f"Image downloaded successfully to '{save_path}'.")
    else:
        print("Failed to download image. Status code:", response.status_code)

# Example usage:
image_url = "http://cha.ccu-ctf.be:4569/qrcode"  # Replace with the URL of the image you want to download
save_path = "qrcode.png"  # Replace with the path where you want to save the image
download_image(image_url, save_path)
