from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])  # Accepts both GET and POST
def capture_data():
    if request.method == 'POST':
        received_data = request.form.to_dict()  # Retrieve POST data
        print("POST REVEIVED")
    else:
        received_data = request.args.to_dict()  # Retrieve GET parameters

    referer = request.headers.get('Referer', 'No referer')
    user_agent = request.headers.get('User-Agent', 'No user agent')
    ip_address = request.headers.get('X-Forwarded-For', request.remote_addr)

    print("\n[+] Incoming Request:")
    print(f"    - Method: {request.method}")
    print(f"    - Data Received: {received_data}")
    print(f"    - Referer: {referer}")
    print(f"    - User-Agent: {user_agent}")
    print(f"    - IP Address: {ip_address}")

    return "Logged", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
