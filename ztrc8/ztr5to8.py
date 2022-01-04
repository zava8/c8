# github.com/zava8/font/daunlod/men_msiin_8210/u8.ttf to vieu generated t2.c8
import re
from glob import glob

# from itertools import chain

content = ''
with open('./t2.cpp') as fn2:
    content = fn2.read().lower()
    content = content.replace(':', 'A').replace(';', 'B').replace('<', 'C').replace('=', 'D').replace('>', 'E').replace('?', 'F')
    heks_matches = re.findall(r"0[xX][0-9a-f]+",content)
    # print("content is : ", content)
    # print("heks_matches is : ", heks_matches)
    heks_matches8 = [];
    for heks_match in heks_matches:
        heks_matches8.append(heks_match.replace('x', 'X').replace('a', ':').replace('b', ';').replace('c', '<').replace('d', '=').replace('e', '<').replace('f', '?'))
    # print("heks_matches8 is : ", heks_matches8)
    for count, heks_match8 in enumerate(heks_matches8):
        content = content.replace(heks_matches[count], heks_match8, 1)
    content = content.replace('q', 'k').replace('j', 'z').replace('w', 'v').replace('f', 'ph').replace('x', 'ks')
with open('./t2_generated.c8', 'w') as out2:
    out2.write(content)
