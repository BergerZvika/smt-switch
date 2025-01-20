#!/bin/bash

# Check if there are exactly 2 arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <src_dir> <target_dir>"
    exit 1
fi

SRC_DIR="$1"
TARGET_DIR="$2"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Loop through all files in the source directory
for file in "$SRC_DIR"/*; do
    if [ -f "$file" ]; then
        # Check if the file contains at least two occurrences of "assert"
        assert_count=$(grep -o "assert" "$file" | wc -l)
        
        if [ "$assert_count" -ge 2 ]; then
            # Process the file and modify the second occurrence of "assert"
            output_file="$TARGET_DIR/$(basename "$file")"
            first_found=false
            second_found=false

            while IFS= read -r line; do
                if [[ "$line" == *"assert"* ]]; then
                    if [ "$first_found" = false ]; then
                        first_found=true
                    elif [ "$second_found" = false ]; then
                        # Modify the second occurrence of "assert"
                        line=$(echo "$line" | sed -r 's/(assert\s+)(.*)/\1(not \2)/')
                        # line="${line})"
                        second_found=true
                    fi
                fi
                # Write the processed line to the output file
                echo "$line" >> "$output_file"
            done < "$file"
        fi
    fi
done

echo "Process completed."
