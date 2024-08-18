#!/bin/env python3

from collections import defaultdict, OrderedDict
import subprocess
import sys

# pip install prettytable 
from prettytable import PrettyTable as pt

def main(terms=[]):
    git_log = subprocess.check_output(['git', 'log', "--pretty=format:%ae (%an) as %ce (%cn)\t%ci\t%ai\t%h"])

    users = defaultdict(list)
    for line in git_log.split(b'\n'):
        name, commit_time, author_time, commit_hash = line.strip().decode('utf-8').split('\t')
        
        users[name].append((commit_time, author_time, commit_hash))

    data = OrderedDict()
    for name, dates in sorted(users.items(), key=lambda x:x[0]):
        if terms:
            n = name.lower()
            found = False
            for term in terms:
                if term in n:
                    found = True
                    break
            if not found:
                continue
        data[name] = dates

    for name, dates in data.items(): 
        print("%s" % name)
        tb = pt()
        tb.field_names = ['Commit Date', 'Author Date', 'Commit Hash']
        tb.add_rows(dates)
        print(tb)
        print("")

if __name__ == '__main__':
    terms = sys.argv[1:]

    main(terms=terms)
