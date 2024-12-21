#!/bin/bash

# Check if folder is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <folder>"
  exit 1
fi

# Folder path from the argument
folder="$1"

# Initialize the sum variable
sum=0
total=0

# Loop over all .smt2 files in the given folder
for file in "$folder"/*.smt2; do
  # Check if the file exists to handle empty folder case
  if [ ! -f "$file" ]; then
    echo "No .smt2 files found in $folder"
    exit 1
  fi
  total=$((total + 1))
  # Run the pbvsolver command and capture the output (either 1 or 0)
  output=$(./pbvsolver "$file" --simplify=0)
  
  # Add the output to the sum
  sum=$((sum + output))
done

# Print the final sum
echo "simplify: $sum / $total"
