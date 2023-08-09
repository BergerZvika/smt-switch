#!/bin/sh

rm artif
# Iterate over each file in the artifact directory
for file in ./benchmarks/artifact/*; do
    if [ -f "$file" ]; then
        # Run the command with the current file as an argument
        timeout 2 ./build/pbvsolver $file -d >> artif
        echo " " >> artif
    fi
done