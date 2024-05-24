#!/bin/bash
LOCKFILE="/tmp/print_sh.lock"

# Check if lock file exists
if [ -e "$LOCKFILE" ]; then
    echo "Script is already running. Exiting."
    exit 1
fi

# Create lock file
touch "$LOCKFILE"

DIRECTORY="/home/uelei/print"
cd $DIRECTORY
# Remove white spaces, accents, and slashes from filenames
for file in *; do
    if [ -f "$file" ]; then
        new_file=$(echo "$file" | tr -d '[:space:]' | iconv -f UTF-8 -t ASCII//TRANSLIT | tr -d '/')
        [ "$file" != "$new_file" ] && mv "$file" "$new_file"
    fi
done

function imprimir() {
for file in "$DIRECTORY"/*; do
        if [ -f "$file" ]; then
            lp -d "EPSON_L120_Series" "$file"
            rm "$file"  # Optionally remove the file after printing
            echo $file
        fi
done
sleep 10  # Adjust the sleep interval as needed
}

imprimir
imprimir
imprimir
imprimir
imprimir


# Remove lock file when script finishes
rm -f "$LOCKFILE"

