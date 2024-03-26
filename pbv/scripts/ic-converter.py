import os

directory = "verify-ic"

# List all files in the directory
files = os.listdir(directory)

# Iterate through each file
for file_name in files:
    if "_4bit.s" not in file_name:
        # If the file name doesn't contain the specified string, remove it
        os.remove(os.path.join(directory, file_name))
        print(f"Removed: {file_name}")

# Iterate through each file in the directory
for file_name in os.listdir(directory):
    # Construct the full file path
    file_path = os.path.join(directory, file_name)

    # Read the content of the file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Modify the content
    modified_lines = []
    for i, line in enumerate(lines):
        # Replace "4" with "k"
        modified_line = line.replace("4", "k")

        # Add the line "(declare-const k Int)" to the third line
        if i == 1:
            modified_line += "(declare-const k Int)\n"

        modified_lines.append(modified_line)

    # Write back the modified content to the file
    with open(file_path, 'w') as file:
        file.writelines(modified_lines)

# Iterate through each file in the directory
for file_name in os.listdir(directory):
    # Check if "_4bit" is in the file name
    if "_4bit" in file_name:
        # Construct the full file path
        old_file_path = os.path.join(directory, file_name)

        # Create the new file name by replacing "_4bit" with "_kbit"
        new_file_name = file_name.replace("_4bit", "_kbit")
        new_file_path = os.path.join(directory, new_file_name)

        # Rename the file
        os.rename(old_file_path, new_file_path)
        print(f"Renamed: {file_name} to {new_file_name}")
