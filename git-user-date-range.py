#!/bin/env python3

import datetime
from collections import defaultdict
import subprocess

# pip install prettytable 
from prettytable import PrettyTable as pt

def main():
    git_log = subprocess.check_output(['git', 'log', "--pretty=format:%ae (%an) as %ce (%cn)\t%ct"])

    users = defaultdict(list)
    for line in git_log.split(b'\n'):
        name, commit_time = line.strip().decode('utf-8').split('\t')
        commit_time = datetime.datetime.fromtimestamp(int(commit_time))

        users[name].append(commit_time)

    data = []
    for name, dates in sorted(users.items(), key=lambda x:x[0]):
        start, end = min(dates), max(dates)

        parts = (name, start, end, len(dates))
        data.append((start, parts))

    tb = pt()
    tb.field_names = ['User', 'First Commit', 'Last Commit', 'Count']
    
    #print('\t'.join(('User', 'First Commit', 'Last Commit', 'Count')))        
    for _, parts in sorted(data, key=lambda x:x[0]):
        tb.add_row(parts)
        #print('\t'.join(str(s) for s in parts))
    print(tb)

if __name__ == '__main__':
    main()
