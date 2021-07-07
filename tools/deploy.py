#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os

def fd(dry = "/Users/thomas.wu/Projects/Repositories"):
    for i in os.listdir(dry):
        if os.path.isdir(i):
            print(i, end=" ")
            fd(os.path.join(dry,i))
fd()
