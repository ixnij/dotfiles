#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os

def fd(dry = "/"):
    for i in os.listdir(dry):
        if os.path.isdir(i):
            print(i)
fd()
