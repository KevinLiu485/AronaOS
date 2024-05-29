import sys
import regex

src = sys.argv[1]

with open(src, 'r') as f:
    lines = f.readlines()
    for line in lines:
        if regex.match(r'### .*', line):
            code = 'const ' + line.split(' ')[2] + ': usize = ' + line.split(' ')[3].strip() + ';'
            print(code)