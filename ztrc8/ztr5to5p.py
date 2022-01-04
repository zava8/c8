from itertools import chain
from glob import glob

# https://www.guru99.com/python-regular-expressions-complete-tutorial.html
import re
# re.match(pattern, string, flags=0)
# re.match function returns a match object on success, None on failure.
# group(num=0) : This method returns entire match (or specific subgroup num)
# groups() : This method returns all matching subgroups in a tuple (empty if there weren't any)

# for name in glob('../llvm/include/llvm/IR/Attributes.td'):
# for name in glob('./t2.cpp'):
# with open('./t2.cpp') as fn:
with open('../readme.md') as fn:
    lines = [line.lower() for line in fn.readlines()]
with open('../readme.md', 'w') as out:
    out.writelines(lines)
with open('../readme.md') as fn2:
    content = fn2.read()
    content = content.replace('q', 'k').replace('j', 'z').replace('w', 'v').replace('f', 'ph').replace('x', 'ks')
# with open('./t2.cpp') as fn2:
#     content = fn2.readme()
#     content = content.replace(':', 'A').replace(';', 'B').replace('<', 'C').replace('=', 'D').replace('>', 'E').replace('?', 'F')
#     heks_matches = re.findall(r"0[xX][0-9a-f]+",content)
with open('../readme.md', 'w') as out2:
    out2.write(content)
