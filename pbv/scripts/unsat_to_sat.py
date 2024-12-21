import os
import re


def split_assertions_in_file(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    with open(file_path, 'w') as file:
        for line in lines:
            # Find all occurrences of "(assert"
            occurrences = [m.start() for m in re.finditer(r'\(assert', line)]

            if len(occurrences) > 1:
                # Write the part of the line up to the first "(assert"
                first_part = line[:occurrences[1]].strip()
                file.write(first_part + '\n')

                # Write each subsequent "(assert" in a new line
                remaining_parts = line[occurrences[1]:].split('(assert')
                for assert_part in remaining_parts:
                    if assert_part.strip():
                        file.write('(assert' + assert_part.strip() + '\n')
            else:
                file.write(line)

def assert_count(file_path):
    count = 0
    # Read the original file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    for line in lines:
        if 'assert' in line:
            count += 1
    return count

def modify_one_assert_in_file(file_path):
    # Read the original file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Open the file in write mode to modify the contents
    with open(file_path, 'w') as file:
        multiple_lines = 0
        for line in lines:
            if line == '(assert\n':
                modified_line = line.replace('assert', 'assert (not').strip()
                file.write(modified_line + '\n')
                multiple_lines = 1
            elif multiple_lines and line == ')\n':
                modified_line = line.replace(')', '))').strip()
                file.write(modified_line + '\n')
                multiple_lines = 0
            elif 'assert' in line:
                # Modify the line to insert "(not" after "assert" and ")" at the end of the line
                modified_line = line.replace('assert', 'assert (not').strip() + ')\n'
                file.write(modified_line)
            else:
                # If no modification needed, write the original line
                file.write(line)

def modify_multiple_assertions_in_file(file_path, num):
    # Read the original file
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Open the file in write mode to modify the contents
    with open(file_path, 'w') as file:
        first_ass = 0
        for line in lines:
            if 'assert' in line:
                if first_ass == 0:
                    # Modify the line to insert "(not" after "assert" and ")" at the end of the line
                    modified_line = line.replace('assert', 'assert (not (and').strip() + ' '
                    modified_line = re.sub(r'\)\s*$', '', modified_line.strip())
                    file.write(modified_line + ' ')
                elif first_ass == num - 1:
                    # Remove "(assert" and the trailing ")" at the end of the line
                    modified_line = re.sub(r'\(assert\s*', '', line)
                    modified_line = re.sub(r'\)\s*$', '', modified_line.strip())
                    file.write(modified_line + ')))\n')
                else:
                    # Remove "(assert"
                    modified_line = re.sub(r'\(assert\s*', '', line)
                    modified_line = re.sub(r'\)\s*$', '', modified_line.strip())
                    file.write(modified_line + ' ')
                first_ass = first_ass + 1
            else:
                # If no modification needed, write the original line
                file.write(line)




def modify_assertions_in_directory(directory_path):
    # Iterate over all files in the given directory
    for root, _, files in os.walk(directory_path):
        for file in files:
            file_path = os.path.join(root, file)
            # Modify the assertions in the file
            split_assertions_in_file(file_path)
            ass = assert_count(file_path)
            if ass == 1:
                modify_one_assert_in_file(file_path)
            else:
                modify_multiple_assertions_in_file(file_path, ass)

# Define the directory path
directory_path = 'ic_concat'

# Modify assertions in all files in the given directory
modify_assertions_in_directory(directory_path)
