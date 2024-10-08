import os

def sum_numbers_in_file(file_name):
    with open(file_name, 'r') as file:
        content = file.read()
        # Strip whitespace and filter out empty strings
        numbers = [int(num.strip()) for num in content.split(',') if num.strip().isdigit()]
        return sum(numbers)

def main():
    total_sum = 0
    for i in range(0, 284):  # Loop through file_1.txt to file_283.txt
        file_name = f"files/file_{i}.txt"
        if os.path.exists(file_name):  # Check if the file exists
            total_sum += sum_numbers_in_file(file_name)
        else:
            print(f"Warning: {file_name} does not exist.")
    
    print(f"Total sum of all numbers in all files: {total_sum}")

if __name__ == "__main__":
    main()


"""
solution :

parcourir tout les fichiers et prendre faire l'addition de chaque nombre présent en faisant attention au format
"""