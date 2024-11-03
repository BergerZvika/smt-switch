import os

# Define the source directory
source_dir = 'benchmarks'

# Iterate over all files in the source directory
for filename in os.listdir(source_dir):
    source_file_path = os.path.join(source_dir, filename)

    # Check if the path is a file (not a directory)
    if os.path.isfile(source_file_path):
        # Read the file content
        with open(source_file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        # Replace the target string
        updated_content = content.replace('#b0000', '(_ bv0 k)')
        updated_content = updated_content.replace('#b0001', '(_ bv1 k)')
        updated_content = updated_content.replace('#b0100', '(_ bvk k)')
        updated_content = updated_content.replace('#b1111', '(bvnot (_ bv0 k))')

        # Write the updated content back to the file
        with open(source_file_path, 'w', encoding='utf-8') as file:
            file.write(updated_content)

print("Files have been updated successfully.")