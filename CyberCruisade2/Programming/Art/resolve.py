# Open the input file and read its content
with open('new.txt', 'r') as f:
    content = f.read()

# Open the output file to write the modified content
with open('outddput.txt', 'w') as f:
    for char in content:
        # Check if the character is a ';' and add a newline after it
        if char == ';':
            f.write(char + '\n')  # Write the semicolon followed by a newline
        else:
            f.write(char)  # Write the character as is

print("Modified content has been written to 'output.txt'.")

print("Color codes have been removed. Cleaned content has been written to 'cleaned_output.txt'.")

"""
solution :
    The netcat server send a series of character, delimited by ANSI color.

    To resolve the challenge, I had to write every output in a file. Then after, I had to add '\n' when a ';' was found.
    After that, by unzoom at maximum, i could find an ascii art with the flag. 
"""