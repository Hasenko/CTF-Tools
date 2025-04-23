
import time
import random

"""
    private static long b = 0;
    private static long c = 5;
    private static List<a> d = null;
    private static long e = 3;
    private static String pwd = "";
    private static long x = 2;
    private static long y = 2;
"""

class MainActivity:
    # Class variables to mimic the static variables in the original Java code
    b = 0  # Initial timestamp
    c = 5  # Multiplier
    d = []  # List of 'a' objects
    e = 3  # Additive constant
    pwd = ""  # Generated password
    x = 2  # Current index
    y = 2  # Target index

    class A:
        def __init__(self, a, b):
            self.a = a  # Time threshold 1
            self.b = b  # Time threshold 2

    @classmethod
    def initialize_thresholds(cls):
        # Recreate the static initialization from the Java code
        cls.d = []
        cls.d.append(cls.A(27, 37))
        cls.d.append(cls.A(5, 10))
        cls.d.append(cls.A(12, 18))
        cls.d.append(cls.A(7, 12))
        cls.d.append(cls.A(37, 70))
        cls.d.append(cls.A(10, 14))
        cls.d.append(cls.A(45, 55))
        cls.d.append(cls.A(2, 10))

    @classmethod
    def generate_password(cls):
        # Get current time in milliseconds
        current_time = int(time.time() * 1000)

        # Check if enough time has passed since last generation
        if cls.b == 0:
            # First run: initialize
            cls.b = current_time
            return 0

        # Calculate time elapsed
        time_elapsed = (current_time - cls.b) / 1000.0

        # Check if we have a valid configuration
        if not cls.d or cls.x >= len(cls.d):
            return 0

        # Get current 'a' object
        current_obj = cls.d[int(cls.x)]

        # Check time constraints
        if time_elapsed < current_obj.a or time_elapsed > current_obj.b:
            # Time outside allowed range, move to next index
            cls.x = cls.y
            return 0

        # Generate password using complex calculation
        base_calc = cls.c * cls.x + cls.e
        password_index = base_calc % len(cls.d)
        cls.x = password_index

        # Construct password
        cls.pwd = str(base_calc) + str(cls.pwd)

        # Special condition when x reaches y
        if cls.x == cls.y:
            # Create password string with special prefix/suffix
            full_pwd = f"CSC{{{cls.pwd}}}"
            print(full_pwd)  # In Python, we'll print instead of showing Toast

        # Update last generation time
        cls.b = current_time
        return 0

# Example usage
def main():
    MainActivity.initialize_thresholds()
    
    # Generate password multiple times
    for _ in range(100000000):
        MainActivity.generate_password()

if __name__ == "__main__":
    main()