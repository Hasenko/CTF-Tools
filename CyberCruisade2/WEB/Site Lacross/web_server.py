from http.server import SimpleHTTPRequestHandler, HTTPServer

class MyHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        print("Data leaked:", self.path)  # Logs the stolen data
        with open("leak.txt", "a") as f:
            f.write(self.path + "\n")
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'Captured')

server_address = ('', 8080)
httpd = HTTPServer(server_address, MyHandler)
print("Listening on port 8080...")
httpd.serve_forever()
