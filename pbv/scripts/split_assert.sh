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
        # Output file path in target directory
        output_file="$TARGET_DIR/$(basename "$file")"

        # Process the file
        while IFS= read -r line; do
            # Check if the line contains more than one "(assert"
            assert_count=$(echo "$line" | grep -o "(assert" | wc -l)

            if [ "$assert_count" -gt 1 ]; then
                # Split the line into multiple lines
                # Replace all "(assert" with a newline and "(assert"
                echo "$line" | sed 's/(assert/\n(assert/g' >> "$output_file"
            else
                # Write the line as is if there is only one "(assert"
                echo "$line" >> "$output_file"
            fi
        done < "$file"
    fi
done

echo "Process completed."
