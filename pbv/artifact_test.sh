#!/bin/sh

rm artif
# Iterate over each file in the artifact directory
for file in ./benchmarks/artifact/*; do
    if [ -f "$file" ]; then
        # Run the command with the current file as an argument
        echo "$file:" >> artif
        timeout 2 ./build/pbvsolver $file -d -w -p >> artif
        echo " " >> artif
    fi
done