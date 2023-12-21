import os
import shutil
import sys
import subprocess
import shlex
"""
create temp file in cvc5 directory smt-switch/deps/cvc5/build/bin run:
    ./cvc5 ~/rewrite/bv_formula.sy --sygus-rr-synth --sygus-abort-size=3 --dag-thresh=0 |grep "rewrite" | head -n500 > temp
    ./cvc5 ~/rewrite/bv_term.sy --sygus-rr-synth --sygus-abort-size=3 --dag-thresh=0 |grep "rewrite" | head -n500 > temp

convert temp to smt2 files:
    python3 rewrite_to_smt2.py temp
""" 

cvc5 = "./cvc5/build/bin/cvc5"
file = sys.argv[1]

def make_smt2(rule, bit_width, dir, count):
    rule = rule.replace("\n", "")
    rule = rule.replace("rewrite", "distinct")
    path = f'{dir}/test-pbv{count}.smt2'
    with open(path, "w") as o:
        o.write("(set-logic ALL)\n"
                "(set-option :produce-models true)\n"
                "(set-option :incremental true)\n"
                "(declare-const k Int)\n"
                f"(declare-const s (_ BitVec {bit_width}))\n"
                f"(declare-const t (_ BitVec {bit_width}))\n")
        o.write(f'(assert {rule})\n')
        o.write("(check-sat)\n"
                "(exit)")
    return path

def run_cvc5(file_path):
    command = f"{cvc5} ./{file_path}"  # Replace with the actual command and arguments you want to run
    timeout_seconds = 5

    try:
        result = subprocess.run(shlex.split(command), capture_output=True, text=True, timeout=timeout_seconds)
        if result.returncode == 0:
            return result.stdout
        else:
            return result.stderr
    except subprocess.TimeoutExpired:
        return "Timeout"
    except Exception as e:
        return f'{str(e)}'

dir = "benchmarks"
try:
    os.mkdir(dir)
except:
    dir = "benchmarks"

dir_temp = "dir_temp"
try:
    os.mkdir(dir_temp)
except:
    dir_temp = "dir_temp"

count = 0
with open(file, "r") as f:
    lines = f.readlines()
    # remove benchmarks who sat between bit-width 1- 10
    for line in lines:
        sat = 0
        for i in range(1, 11):
            file_path = make_smt2(line, i, dir_temp, f'{count}_{i}')
            res = run_cvc5(file_path)
            if res == "sat\n":
                sat = 1
                break
            os.remove(file_path)
        if not sat:
            path = make_smt2(line, "k", dir, count)
            count += 1
shutil.rmtree(dir_temp)
