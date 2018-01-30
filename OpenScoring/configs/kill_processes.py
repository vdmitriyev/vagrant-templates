#!/usr/bin/env python3

__author__      = "Viktor Dmitriyev"
__version__     = "1.0"
__date__        = "30.01.2018"
__description__ = "Kills targeted process on Linux system."

import os
import sys
import argparse

def main(process_name):

    #process_name = process_name[1:-1]
    print(process_name)
    cmd  = 'ps -ef | grep "{0}"'.format(process_name)
    print(cmd)
    processes = os.popen(cmd).read()
    processes = processes.split("\n")
    processes = processes[0].split(" ")
    pid = -1
    for p in processes:
        try:
            pid = int(p)
            print('Found following PID: {0}'.format(pid))
            break
        except:
            continue

    print('Killing following PID: {0}'.format(pid))
    os.system('kill {0}'.format(str(pid)))


if __name__ == '__main__':

    # fetching input parameters
    parser = argparse.ArgumentParser(description='{0}\nVersion - {1}.\n'.format(__description__, __version__))

    # amount
    parser.add_argument(
        '--process',
        dest='process',
        help='A process string to be stoped. Must be in "" (e.g. "java -jar...")')

    # parse input parameters
    args = parser.parse_args()

    main(args.process)
