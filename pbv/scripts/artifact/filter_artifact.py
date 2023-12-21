import os

############################### initilize filter file
# filter_file = {}
#
# filter_path = "./filter.txt"
# with open(filter_path, "r") as f:
#     for line in f.readlines():
#         line = line.split(':')
#         line[-1] = line[-1].replace('\n', '')
#         if len(line) < 2:
#             filter_file[line[0]] = [line[0]]
#         else:
#             if line[0] in filter_file.keys():
#                 filter_file[line[0]].append(line[1])
#             else:
#                 filter_file[line[0]] = [line[-1]]
#
# print(filter_file)

################################ delete empty
# directory_path = './bv_to_bool_bench/'
# out_dir = './compress/'
#
# def inFilter(filename):
#     for key in filter_file.keys():
#         if key in filename:
#             for value in filter_file[key]:
#                 if value in filename:
#                     return True
#     return False
#
# for filename in os.listdir(directory_path):
#     if "values" not in filename or not inFilter(filename):
#         continue
#     with open(directory_path + filename, "r") as f:
#         content = f.read()
#
#     if "(assert true)" in content and "(assert false)" in content:
#         continue
#
#     with open(out_dir + filename, "w") as f:
#         f.write(content)


################################### delete duplicates
# directory_path = './compress/'
# out_dir = './real/'
#
# def equal_without_number(str1, str2):
#     for i in range(1, min(len(str1), len(str2))+1):
#         if str1[-1].isdigit() or str2[-1].isdigit():
#             if str1[-1].isdigit():
#                 str1 = str1[:-1]
#             if str2[-1].isdigit():
#                 str2 = str2[:-1]
#         else:
#             return str1 == str2
#     return str1 == str2
#
# file = "example_0.smt2"
# for filename in os.listdir(directory_path):
#     with open(directory_path + filename, "r") as f:
#         content = f.read()
#
#     if equal_without_number(file[:-5], filename[:-5]):
#         continue
#     with open(out_dir + filename, "w") as f:
#         f.write(content)
#     file = filename

########################### convert 4 to k
import re
directory_path = './real/'
out_dir = './conv/'
not4 = 0

for filename in os.listdir(directory_path):
    content = ""
    with open(directory_path+filename, "r") as f:
        content += "(set-logic ALL)\n"
        # content += "(set-option :produce-models true)\n"
        content += "(declare-const k Int)"
        content += f.read()

    contentk = content.replace("_ BitVec 4", "_ BitVec k")
    contentk = re.sub(r'_ bv(\d+) 4', r'_ bv\1 k', contentk)
    if contentk == content:
        print(filename + ':')
        print(content+'\n')
        not4 += 1

    with open(out_dir + filename, "w") as f:
        f.write(contentk)

print(not4)