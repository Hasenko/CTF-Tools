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
