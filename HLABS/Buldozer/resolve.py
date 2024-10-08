"""
Challenge 2: Buffer Overflow Challenge
Description: In this challenge, the program prompts for user input and checks it against a specific value. If the input matches the value, it executes system("cat flag.txt") to display the flag.

Vulnerability Analysis: The function responsible for reading the input (FUN_004010c0) used gets(), which is known to be unsafe due to the lack of bounds checking. This vulnerability allows for a buffer overflow that can manipulate adjacent memory locations.

Exploit Steps:

    Identifying the Buffer and Target Variable: The buffer (local_38) has a size of 44 bytes, followed by a 4-byte integer (local_c).
    Determining the Target Value: The goal is to overwrite local_c to equal 0x4c5b6a7f.
    Constructing the Payload: To achieve this, we created a payload consisting of 44 'A' characters followed by the little-endian representation of 0x4c5b6a7f.


python3 -c 'print("A" * 44 + "\x7f\x6a\x5b\x4c")' | nc hlabs.helb-prigogine.be <port>

"""