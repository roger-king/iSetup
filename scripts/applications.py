#!/usr/bin/env python

import urllib2
import os
import sys
import json

def get_dmg(dl_path, filename, url):
    file = urllib2.urlopen(url)
    data = file.read()

    with open(os.path.join(dl_path,filename), "wb") as app:
        app.write(data)


if __name__ == '__main__':
    apps = json.load(open('applications.json'))['apps']
    dl_path = sys.argv[1]
    for app in apps:
        get_dmg(dl_path, app['filename'], app['mac'])
