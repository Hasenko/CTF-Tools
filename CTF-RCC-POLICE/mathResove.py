import requests

# URL to send the POST request
url = "http://cha.ccu-ctf.be:9488/challenge"
response = requests.get(url)

while True:
    
# Send a GET request to the challenge page
    
    lines = response.text.split("\n")

    # Extract token and math problem from the lines
    token_line = [line for line in lines if "Your token is" in line][0]
    token = token_line.split('"')[1]

    math_problem_line = [line for line in lines if "Challenge #" in line][0]
    math_problem = math_problem_line.split(":")[1].strip()

    # Splitting the math problem into components
    components = math_problem.split()

    # Extracting nb1, operation, and nb2
    nb1 = int(components[0])
    operation = components[1]
    nb2 = int(components[2])

    print("token : ", token)
    print("pb:", math_problem)
    print("nb1:", nb1)
    print("operation:", operation)
    print("nb2:", nb2)

    # Perform the arithmetic operation
    if operation == '+':
        result = nb1 + nb2
    elif operation == '-':
        result = nb1 - nb2
    elif operation == '*':
        result = nb1 * nb2
    elif operation == '/':
        result = nb1 / nb2

    print("Result:", result)
# Data to be sent in the POST request
    data = {
        "token": token,
        "response": result
    }

    # Sending the POST request
    response = requests.post(url, data=data)

    # Print the response from the server
    print(response.text)

    if not response.text.startswith("Your token is "):
        break
