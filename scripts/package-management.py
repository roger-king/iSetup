#!/usr/bin/env python
import subprocess
import sys
import json

def install(operating_system, p):
    root_cmd = None

    if operating_system == 'mac':
        root_cmd = 'brew'
    elif operating_system == 'fedora':
        root_cmd = 'dnf'
    
    subprocess.call([root_cmd, 'install', p], shell=True)

if __name__ == '__main__':
    p = json.load(open('applications.json'))['programming']
    s = sys.argv[1]

    for package in p:
        print('install %s' % package['name'])
        package_name = None

        if s == 'mac':
            package_name = package['mac']
        elif s == 'fedora':
            package_name = package['fedora']
        
        install(s, package_name)
