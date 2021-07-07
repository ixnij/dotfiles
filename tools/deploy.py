#!/usr/bin/env python3

"""
this python script is used for search & find files.
"""

import os

def fd(dr = "/Users/thomas.wu/Projects"):
    for i in os.listdir(dr):
        fullpath = os.path.join(dr, i)
        if os.path.isdir(fullpath):
            fd(fullpath)
        print(fullpath)

fd()
