from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def capture_data():
    leak = request.args.get('leak', 'No leak provided')
    referer = request.headers.get('Referer', 'No referer')
    user_agent = request.headers.get('User-Agent', 'No user agent')
    ip_address = request.headers.get('X-Forwarded-For', request.remote_addr)

    print(f"\n[+] Incoming Request:")
    print(f"    - Leak: {leak}")
    print(f"    - Referer: {referer}")
    print(f"    - User-Agent: {user_agent}")
    print(f"    - IP Address: {ip_address}")

    return "Logged", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
