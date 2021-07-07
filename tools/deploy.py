#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from os import *
def ls(dir = "/"):
    for d in listdir(dir):
        if path.isdir(d):
            print(d)
ls()
