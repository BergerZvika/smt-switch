import os

yourpath = 'benchmarks'
out = open('tests.txt', 'w')


for root, dirs, files in os.walk(yourpath, topdown=False):
    for name in files:
        file = name
        num = name.replace(".smt2","").replace("test-pbv", "")
        if int(num) < 1000:
            out.write( '\t{' + f' "{name}",\n\t\t' + '{ smt::Result(smt::UNSAT)}},\n')

out.close()

