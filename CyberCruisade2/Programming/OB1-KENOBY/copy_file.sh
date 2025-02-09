#!/bin/bash

FILE_TO_COPY="MyPasswords.sh.x"
DEST_FOLDER="./copies"

mkdir -p "$DEST_FOLDER"

for i in $(seq -w 0000 9999); do
    cp "$FILE_TO_COPY" "$DEST_FOLDER/MyPasswords_$i.sh.x"
done

echo "Copied $FILE_TO_COPY 1000 times in $DEST_FOLDER."
