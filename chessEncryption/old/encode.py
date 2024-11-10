from time import time
from math import log2
from chess import pgn, Board
from util import to_binary_string

import sys


###
### Enter a file path
### and it returns a string of 1 or more PGNs that represent it
###
def encode(intput_file_path: str, pgn_output_file_path: str):
    start_time = time()

    # read binary of file
    print("reading file...")

    file_bytes = list(open(intput_file_path, "rb").read())

    # record number of bits in file
    file_bits_count = len(file_bytes) * 8

    # convert file to chess moves
    print("\nencoding file...")

    output_pgns: list[str] = []

    file_bit_index = 0

    chess_board = Board()

    while True:
        legal_moves = list(chess_board.generate_legal_moves())

        # assign moves a binary value based on its index
        move_bits = {}

        max_binary_length = min(
            int(log2(
                len(legal_moves)
            )),
            file_bits_count - file_bit_index
        )

        for index, legal_move in enumerate(legal_moves):
            move_binary = to_binary_string(index, max_binary_length)
            if len(move_binary) > max_binary_length:
                break

            move_bits[legal_move.uci()] = move_binary

        # take next binary chunk from the file
        closest_byte_index = file_bit_index // 8

        file_chunk_pool = "".join([
            to_binary_string(byte, 8)
            for byte in file_bytes[closest_byte_index : closest_byte_index + 2]
        ])

        next_file_chunk = file_chunk_pool[
            file_bit_index % 8
            : file_bit_index % 8 + max_binary_length
        ]

        # push chess move that corresponds with next chunk
        for move_uci in move_bits:
            move_binary = move_bits[move_uci]

            if move_binary == next_file_chunk:
                chess_board.push_uci(move_uci)
                break

        # move the pointer along by the chunk size
        file_bit_index += max_binary_length

        # check if the game is in a terminal state or EOF
        # if it is, convert it to a pgn and add to pgn list
        eof_reached = file_bit_index >= file_bits_count

        if (
            chess_board.legal_moves.count() <= 1
            or chess_board.is_insufficient_material()
            or chess_board.can_claim_draw()
            or eof_reached
        ):
            pgn_board = pgn.Game()
            pgn_board.add_line(chess_board.move_stack)

            output_pgns.append(str(pgn_board))

            chess_board.reset()

        if eof_reached: break

    print(
        f"\nsuccessfully converted file to pgn with "
        + f"{len(output_pgns)} game(s) "
        + f"({round(time() - start_time, 3)}s)."
    )

    with open(pgn_output_file_path, "w") as output_file:
        output_file.write("".join(output_pgns))

    # return pgn string
    return "\n\n".join(output_pgns)

# Run the decode function if executed as a script
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_file_path> <output_file_path.pgn>")
    else:
        input_file_path = sys.argv[1]
        pgn_output_file_path = sys.argv[2]
        encode(input_file_path, pgn_output_file_path)