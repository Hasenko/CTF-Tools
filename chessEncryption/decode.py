import os
import sys
from time import time
from math import log2
from chess import pgn, Board
from util import get_pgn_games

###
### Pass in a folder path containing PGN files and an output file path
### It decodes the PGN moves to reconstruct the original file
###
def decode(folder_path: str, output_file_path: str):
    start_time = time()

    # Concatenate all PGN files in the folder into one string
    pgn_string = ""
    for filename in os.listdir(folder_path):
        if filename.endswith(".pgn"):
            with open(os.path.join(folder_path, filename), "r") as file:
                pgn_string += file.read() + "\n\n"

    # Load games from concatenated PGN string
    games: list[pgn.Game] = get_pgn_games(pgn_string)

    total_move_count = 0
    output_data = ""

    # Open output file in binary write mode
    with open(output_file_path, "wb") as output_file:
        for game_index, game in enumerate(games):
            chess_board = Board()
            game_moves = list(game.mainline_moves())
            total_move_count += len(game_moves)

            for move_index, move in enumerate(game_moves):
                # Get UCIs of legal moves in current position
                legal_move_ucis = [
                    legal_move.uci() for legal_move in list(chess_board.generate_legal_moves())
                ]

                # Get binary of the move played, using its index in the legal moves
                move_binary = bin(legal_move_ucis.index(move.uci()))[2:]

                # If this is the last move of the last game, ensure binary length is a multiple of 8
                if game_index == len(games) - 1 and move_index == len(game_moves) - 1:
                    max_binary_length = min(
                        int(log2(len(legal_move_ucis))),
                        8 - (len(output_data) % 8)
                    )
                else:
                    max_binary_length = int(log2(len(legal_move_ucis)))

                # Pad move binary to meet max binary length
                required_padding = max(0, max_binary_length - len(move_binary))
                move_binary = ("0" * required_padding) + move_binary

                # Play move on board
                chess_board.push_uci(move.uci())

                # Add move binary to output data string
                output_data += move_binary

                # If output binary pool is multiple of 8, flush it to file
                if len(output_data) % 8 == 0:
                    output_file.write(
                        bytes([
                            int(output_data[i * 8: i * 8 + 8], 2)
                            for i in range(len(output_data) // 8)
                        ])
                    )
                    output_data = ""

    print(
        f"\nSuccessfully decoded PGN with {len(games)} game(s), {total_move_count} total move(s)"
        f" ({round(time() - start_time, 3)}s)."
    )


# Run the decode function if executed as a script
if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <pgn_folder_path> <output_file_path>")
    else:
        folder_path = sys.argv[1]
        output_file_path = sys.argv[2]
        decode(folder_path, output_file_path)
