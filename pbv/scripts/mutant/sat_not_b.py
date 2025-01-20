import os

def process_files(src_dir):
    for filename in os.listdir(src_dir):
        assert_line = 0
        i = 0
        src_path = os.path.join(src_dir, filename)

        # Only process files that are regular files
        if not os.path.isfile(src_path):
            continue

        with open(src_path, 'r') as file:
            lines = file.readlines()

        for line in lines:
            # Modify the second line if it starts with "(assert"
            if lines[i].strip().startswith("(assert"):
                assert_line += 1
                if assert_line == 2:
                    # Add "(not " after "(assert " and ")" at the end of the line
                    lines[i] = lines[i].replace("(assert ", "(assert (not ").rstrip("\n") + ")\n"
            i +=1

        # Write the modified content back to the same file
        with open(src_path, 'w') as file:
            file.writelines(lines)

        print(f"Processed: {filename}")

if __name__ == "__main__":
    import sys

    # Check for source directory argument
    if len(sys.argv) != 2:
        print("Usage: python script.py <source_directory>")
        sys.exit(1)

    src_directory = sys.argv[1]

    # Process files
    process_files(src_directory)
