#!/bin/bash

# Check if enough arguments are supplied
if [ "$#" -lt 4 ]; then
    echo "Usage: $0 <src_dir> <target_dir> <str_to_replace> <replaced_str>"
    exit 1
fi

# Input arguments
src_dir=$1
target_dir=$2
STR1="$3"
STR2="$4"

# Traverse directories and subdirectories in the source directory
find "$src_dir" -type d | while read -r dir; do
    # Get the directory's relative path
    relative_dir="${dir#$src_dir/}"

    # Create the corresponding directory in the target location
    dir_target="$target_dir/$relative_dir-sat-$STR1-to-$STR2"
    mkdir -p "$dir_target"

    # Traverse files in the current directory
    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            # Check if the file contains STR1
            if grep -q "$STR1" "$file"; then
                # Replace the first occurrence of STR1 with STR2
                output_file="$dir_target/$(basename "$file")"
                sed "0,/$STR1/s//$STR2/" "$file" > "$output_file"
            fi
        fi
    done
done

# Remove all empty directories in the target directory
find "$target_dir" -type d -empty -delete

echo "Process completed and empty directories removed."
