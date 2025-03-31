#!/bin/bash

# Function to replace the pattern in a file
replace_pattern_in_file() {
    local file="$1"
    sed -i -E 's/\(_ bv([0-9]+|[a-zA-Z]) ([0-9]+|[a-zA-Z])\)/(int_to_pbv \2 \1)/g' "$file"
}

# Function to process the directory recursively
process_directory() {
    local dir="$1"
    find "$dir" -type f | while read -r file; do
        replace_pattern_in_file "$file"
        echo "$file"
    done
}

# Replace 'your_directory_path' with the path to your directory
directory_path="benchmarks"
process_directory "$directory_path"