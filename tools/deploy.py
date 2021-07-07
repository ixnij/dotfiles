#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os

def fd(dry = "/"):
    for i in os.listdir(dry):
        print(i)
fd()
