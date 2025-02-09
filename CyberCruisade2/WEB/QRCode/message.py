from selenium import webdriver
from selenium.webdriver.common.by import By
import threading
import time
import base64
from PIL import Image
from io import BytesIO
import cv2
from pyzbar.pyzbar import decode
import requests

# Configuration
BASE_URL = "http://cybercrusade.helb-prigogine.be:8089"
SUBMIT_URL = BASE_URL + "/submit"

# Lancer Selenium en mode headless (sans interface graphique)
options = webdriver.ChromeOptions()
options.add_argument("--headless")
driver = webdriver.Chrome(options=options)
driver.get(BASE_URL)

# Stockage des parties
qr_parts = {}
lock = threading.Lock()  # Sécurise l'accès aux données dans les threads

# Fonction pour récupérer les QR codes dès qu'ils apparaissent
def get_qr_parts():
    while len(qr_parts) < 3:
        with lock:
            img_element = driver.find_element(By.ID, "qr-code")
            part_element = driver.find_element(By.ID, "part-number")

            part_text = part_element.text.strip()
            if ":" in part_text:
                parts = part_text.split(":")
                if len(parts) > 1 and parts[1].strip().isdigit():
                    part_number = int(parts[1].strip())
                    qr_base64 = img_element.get_attribute("src").split(",")[1]

                    if part_number not in qr_parts:
                        qr_parts[part_number] = qr_base64
                        print(f"✅ Partie {part_number} récupérée")
            else:
                print("⚠️ Partie non détectée, réessai...")

        time.sleep(0.1)  # Vérification rapide


# Lancer l'écoute des parties QR Code
qr_thread = threading.Thread(target=get_qr_parts)
qr_thread.start()

# Attendre qu'on ait au moins 2 parties et les fusionner
while len(qr_parts) < 2:
    time.sleep(0.1)

# Fusionner partie 1 + 2 immédiatement
with lock:
    images = [Image.open(BytesIO(base64.b64decode(qr_parts[i]))) for i in sorted(qr_parts.keys())]
    temp_width = sum(img.width for img in images)
    max_height = max(img.height for img in images)

    temp_qr = Image.new("RGB", (temp_width, max_height))
    x_offset = 0
    for img in images:
        temp_qr.paste(img, (x_offset, 0))
        x_offset += img.width

print("🛠️ Fusion préliminaire (partie 1 + 2) faite. En attente de la partie 3...")

# Attendre l'arrivée de la partie 3
while len(qr_parts) < 3:
    time.sleep(0.1)

# Fusion finale avec partie 3
with lock:
    images.append(Image.open(BytesIO(base64.b64decode(qr_parts[3]))))
    total_width = sum(img.width for img in images)
    final_qr = Image.new("RGB", (total_width, max_height))

    x_offset = 0
    for img in images:
        final_qr.paste(img, (x_offset, 0))
        x_offset += img.width

final_qr_path = "final_qr.png"
final_qr.save(final_qr_path)
print(f"📷 QR Code final sauvegardé sous '{final_qr_path}'.")

# Scanner le QR Code
def scan_qr(image_path):
    image = cv2.imread(image_path)
    decoded_objects = decode(image)
    return decoded_objects[0].data.decode("utf-8") if decoded_objects else None

# Scanner et envoyer immédiatement le token
token = scan_qr(final_qr_path)
if token:
    print(f"🔑 Token extrait : {token}")
    response = requests.post(SUBMIT_URL, data={"token": token})
    print(f"📩 Réponse serveur : {response.text}")
else:
    print("❌ Erreur : QR Code illisible.")

# Fermer Selenium
driver.quit()