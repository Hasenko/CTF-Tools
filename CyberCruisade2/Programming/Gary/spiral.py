import numpy as np

class SpiralMatrix:
    def create_spiral_matrix(input_list, clockwise=True, start_direction='right'):
        """
        Convert a list into a spiral matrix with configurable rotation and starting direction.
        
        Args:
            input_list (list): Input list of elements to be arranged in spiral form
            clockwise (bool): True for clockwise rotation, False for counter-clockwise
            start_direction (str): Starting direction ('right', 'left', 'up', 'down')
            
        Returns:
            list: 2D list representing the spiral matrix
        """
        if not input_list:
            return []

        # Calculate matrix dimensions
        n = int((len(input_list) ** 0.5 + 0.99))  # Round up to nearest square
        if n % 2 == 0:  # Ensure odd dimensions for center starting point
            n += 1
            
        # Create empty matrix
        matrix = [[None] * n for _ in range(n)]
        
        # Starting position (center)
        x = y = n // 2
        
        # Define direction vectors based on rotation direction
        if clockwise:
            directions = {
                'right': (1, 0),
                'down': (0, 1),
                'left': (-1, 0),
                'up': (0, -1)
            }
            direction_order = ['right', 'down', 'left', 'up']
        else:
            directions = {
                'right': (1, 0),
                'up': (0, -1),
                'left': (-1, 0),
                'down': (0, 1)
            }
            direction_order = ['right', 'up', 'left', 'down']
        
        # Validate and get starting direction
        if start_direction not in directions:
            raise ValueError(f"Invalid start_direction. Must be one of {list(directions.keys())}")
        
        # Find starting direction index
        current_direction = direction_order.index(start_direction)
        
        steps = 1  # Number of steps in current direction
        step_count = 0  # Steps taken in current direction
        
        # Fill the matrix
        for i, value in enumerate(input_list):
            if i >= n * n:  # Stop if we've exceeded matrix size
                break
            
            matrix[y][x] = value
            step_count += 1
            
            # Get current direction vector
            dx, dy = directions[direction_order[current_direction]]
            
            # Move to next position
            x += dx
            y += dy
            
            # Change direction if needed
            if step_count == steps:
                step_count = 0
                current_direction = (current_direction + 1) % 4
                
                # Increase steps every two direction changes
                if current_direction % 2 == 0:
                    steps += 1

        return matrix
    
    def unspiral_matrix(matrix, clockwise=True, start_direction='right'):
        """
        Convert a spiral matrix back into a flat list, starting from the center and moving outward.

        Args:
            matrix (list of list): 2D spiral matrix (n x n)
            clockwise (bool): True if the original spiral was clockwise, False otherwise
            start_direction (str): Starting direction ('right', 'left', 'up', 'down')

        Returns:
            list: Flattened list of elements in the unspiraled order
        """
        if not matrix or not matrix[0]:
            return []

        n = len(matrix)  # Assuming an n x n matrix
        visited = [[False] * n for _ in range(n)]
        output_list = []

        # Define movement directions
        if clockwise:
            directions = ['right', 'down', 'left', 'up']
            movement = {'right': (0, 1), 'down': (1, 0), 'left': (0, -1), 'up': (-1, 0)}
        else:
            directions = ['down', 'right', 'up', 'left']
            movement = {'down': (1, 0), 'right': (0, 1), 'up': (-1, 0), 'left': (0, -1)}

        # Get starting position (center of the matrix)
        x = y = n // 2
        output_list.append(matrix[y][x])
        visited[y][x] = True

        # Find initial direction index
        current_direction = directions.index(start_direction)

        steps = 1  # Number of steps in current direction
        step_count = 0  # Steps taken in current direction
        turns = 0  # Number of turns made (every 2 turns, steps increase)

        for _ in range(n * n - 1):  # We've already added the center element
            dx, dy = movement[directions[current_direction]]
            x += dx
            y += dy

            if 0 <= x < n and 0 <= y < n and not visited[y][x]:
                output_list.append(matrix[y][x])
                visited[y][x] = True
                step_count += 1
            else:
                # Undo movement and change direction
                x -= dx
                y -= dy
                current_direction = (current_direction + 1) % 4
                dx, dy = movement[directions[current_direction]]
                x += dx
                y += dy
                output_list.append(matrix[y][x])
                visited[y][x] = True
                step_count = 1  # Reset step count

            # Change direction if step count reaches the current step limit
            if step_count == steps:
                step_count = 0
                current_direction = (current_direction + 1) % 4
                turns += 1
                if turns % 2 == 0:  # Increase step size every two turns
                    steps += 1

        return output_list

    def print_matrix(matrix):
        """
        Print the matrix in a formatted way.
        
        Args:
            matrix (list): 2D list to be printed
        """
        if not matrix:
            return
            
        # Find the maximum width needed for any element
        max_width = max(len(str(element)) for row in matrix for element in row if element is not None)
        
        for row in matrix:
            formatted_row = [str(elem).center(max_width) if elem is not None else ' ' * max_width for elem in row]
            print(' '.join(formatted_row))

        print()