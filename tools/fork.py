#!/usr/bin/env python3

import os
pid = os.fork()
if pid == 0:
    print("PID == 0 !!!!")
print("%s %s" % (os.getpid(), os.getppid()))

