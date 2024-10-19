import subprocess

# Function to execute the command with the given input
def run_executable(input_value):
    # Execute the command and provide input
    process = subprocess.Popen(['./dynamite_hard.exe'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    output, error = process.communicate(input=input_value.encode())
    
    # Decode and return the output and error
    return output.decode('utf-8').strip(), error.decode('utf-8').strip()

# Iterate through numbers from 0 to 9999
for i in range(10000):
    # Format the number as a four-digit string
    input_value = str(i).zfill(4)  # or you can use f"{i:04}"
    
    # Run the executable with the current input value
    output, error = run_executable(input_value)

    # Print the output for debugging
    print(f'Trying password: {input_value} - Output: {output}')

    # Check for the success condition
    if "dear" in output.lower():  # Change this condition as necessary
        print(f'Success! The password is: {input_value}')
        break  # Stop the loop if "good" appears in the output

    if error:
        print(f'Error for {input_value}: {error}')
