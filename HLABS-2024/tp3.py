#!/usr/bin/env python3

try:
  program = input('Enter a program:')
  response = exec(program)
  print(f"You entered `{response}`")
  if response == "password":
    print("Yeah, good job !")
    quit()
except:
  pass

print("No good...")
