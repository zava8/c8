from itertools import chain
from glob import glob

for name in glob('../llvm/include/llvm/IR/Attributes.td'):
    with open(name) as fn:
        lines = [line.lower() for line in fn.readlines()]
    with open(name, 'w') as out:
        out.writelines(lines)
    with open(name) as fn2:
        content = fn2.read()
        content = content.replace(':', 'A').replace(';', 'B').replace('<', 'C').replace('=', 'D').replace('>', 'E').replace('?', 'F')
    with open(name, 'w') as out2:
        out2.write(content)
