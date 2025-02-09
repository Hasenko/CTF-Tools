#!/bin/bash

DEST_FOLDER="./copies"
OUTPUT_FILE="output.txt"

rm -f "$OUTPUT_FILE"  # Remove old output file if it exists

for i in $(seq -w 0000 9999); do
    FILE="$DEST_FOLDER/MyPasswords_$i.sh.x"

    echo "Testing key $i in $FILE" | tee -a "$OUTPUT_FILE"
    echo -e "\n" | "$FILE" -k "$i" | tee -a "$OUTPUT_FILE"

done

echo "Brute force testing completed. Results saved in $OUTPUT_FILE."

: '
title : OB1-Kenoby-0

description :
    Break the code!!!

    -h for help

file given : MyPasswords.sh.x

solution :
    When the file is execute with -h argument, I know that I have to do "-k [4 digit password]" to retrieve the flag.
    But the trick is that when i do more than 3 attemps in 24h, the file is blocked.

    To remove this verification, I had to edit .Save file (created when launching the file) and put a big number.
    Another solution is to create 10000 copies of the file given and test a single password on a file.
'