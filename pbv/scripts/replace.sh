#!/bin/bash

# Function to replace occurrences in a file
replace_in_file() {
    local file=$1
    local search=$2
    local replace=$3
    local copy=$4
    if [ "$copy" = true ]; then
        local backup_file="${file%.*}_$replace.${file##*.}"
        cp "$file" "$backup_file"
        echo "Created backup of '$file' as '$backup_file'."
    fi
    sed -i "s/$search/$replace/g" "$file"
    echo "Replaced '$search' with '$replace' in file '$file'."
}

# Function to replace occurrences in all files in a directory
replace_in_directory() {
    local dir=$1
    local search=$2
    local replace=$3
    local copy=$4
    find "$dir" -type f | while read -r file; do
        if [ "$copy" = true ]; then
            local backup_file="${file%.*}_$replace.${file##*.}"
            cp "$file" "$backup_file"
            echo "Created backup of '$file' as '$backup_file'."
        fi
        sed -i "s/$search/$replace/g" "$file"
    done
    echo "Replaced '$search' with '$replace' in all files under directory '$dir'."
}

# Check if the correct number of arguments is provided
if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
    echo "Usage: $0 filename_or_directory search_string replace_string [-c]"
    exit 1
fi

# Check for the -c flag
COPY=false
if [ "$4" = "-c" ]; then
    COPY=true
fi

# Assign arguments to variables
TARGET=$1
SEARCH_STRING=$2
REPLACE_STRING=$3

# Check if the target is a file or directory and call the appropriate function
if [ -f "$TARGET" ]; then
    replace_in_file "$TARGET" "$SEARCH_STRING" "$REPLACE_STRING" "$COPY"
elif [ -d "$TARGET" ]; then
    replace_in_directory "$TARGET" "$SEARCH_STRING" "$REPLACE_STRING" "$COPY"
else
    echo "Target '$TARGET' is neither a file nor a directory!"
    exit 1
fi
