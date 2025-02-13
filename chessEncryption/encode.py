import os
import sys

from time import time
from math import log2
from chess import pgn, Board
from util import to_binary_string

def encode(file_path: str, output_directory: str = "output_pgn"):
    # Start the encoding process
    start_time = time()

    # Ensure the output directory exists
    os.makedirs(output_directory, exist_ok=True)

    # Read binary of file
    print("Reading file...")
    file_bytes = list(open(file_path, "rb").read())
    file_bits_count = len(file_bytes) * 8  # Total bits in file

    # Initialize variables for encoding
    output_pgns: list[str] = []
    file_bit_index = 0
    chess_board = Board()

    print("\nEncoding file...")
    
    game_number = 1  # Track the game number for file naming

    while True:
        legal_moves = list(chess_board.generate_legal_moves())

        # Assign moves a binary value based on its index
        move_bits = {}
        max_binary_length = min(int(log2(len(legal_moves))), file_bits_count - file_bit_index)

        for index, legal_move in enumerate(legal_moves):
            move_binary = to_binary_string(index, max_binary_length)
            if len(move_binary) > max_binary_length:
                break
            move_bits[legal_move.uci()] = move_binary

        # Get the next binary chunk from the file
        closest_byte_index = file_bit_index // 8
        file_chunk_pool = "".join([to_binary_string(byte, 8) for byte in file_bytes[closest_byte_index: closest_byte_index + 2]])
        next_file_chunk = file_chunk_pool[file_bit_index % 8: file_bit_index % 8 + max_binary_length]

        # Push the chess move that corresponds to the next chunk
        for move_uci in move_bits:
            move_binary = move_bits[move_uci]
            if move_binary == next_file_chunk:
                chess_board.push_uci(move_uci)
                break

        file_bit_index += max_binary_length

        # Check if the game is in a terminal state or EOF
        eof_reached = file_bit_index >= file_bits_count
        if (
            chess_board.legal_moves.count() <= 1
            or chess_board.is_insufficient_material()
            or chess_board.can_claim_draw()
            or eof_reached
        ):
            # Create a PGN representation of the game
            pgn_board = pgn.Game()
            pgn_board.add_line(chess_board.move_stack)
            game_pgn = str(pgn_board)

            # Save the PGN to a file
            output_file = os.path.join(output_directory, f"game_{game_number}.pgn")
            with open(output_file, "w") as file:
                file.write(game_pgn)
            output_pgns.append(game_pgn)

            # Print status and reset the board for a new game
            print(f"Saved game {game_number} to {output_file}")
            chess_board.reset()
            game_number += 1

        if eof_reached:
            break

    print(
        f"\nSuccessfully converted file to PGN with "
        f"{len(output_pgns)} game(s) "
        f"({round(time() - start_time, 3)}s)."
    )

    # Return the list of PGN strings for reference (optional)
    return output_pgns

# Run the decode function if executed as a script
if __name__ == "__main__":
    if len(sys.argv) == 3:
        input_file_path = sys.argv[1]
        output_folder_path = sys.argv[2]
        encode(input_file_path, output_folder_path)
    elif len(sys.argv) == 2:
        input_file_path = sys.argv[1]
        encode(input_file_path)
    else:
        print("Usage: python3 encode.py <file_to_encode> [output_folder_path]")