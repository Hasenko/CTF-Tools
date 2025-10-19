print("    ______     __          __          __  \n"
      "   / _________/ /_  ____  / /_  ____  / /_ \n"
      "  / __/ / ___/ __ \/ __ \/ __ \/ __ \/ __/ \n"
      " / /___/ /__/ / / / /_/ / /_/ / /_/ / /_   \n"
      "/_____/\___/_/ /_/\____/_.___/\____/\__/   \n")
print("{:>40}".format('Echobot is now running'))
print("{:>40}".format('ctrl+c to exit'))

while True: 
    try:
        you_said = input(" You: ")
        if you_said.lower() == "tell me secret":
            print(f" Bot: sure! here is the secret \n")
            break
        print(f" Bot: {you_said} \n")
    except:
        exit()

with open("flag.txt", "r") as f:
    print(" ==>", f.read())

