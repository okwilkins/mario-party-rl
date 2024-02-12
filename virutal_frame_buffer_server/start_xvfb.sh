#!/bin/bash
/usr/bin/pulseaudio -D --exit-idle-time=-1 --disallow-exit --verbose

Xvfb :0 -screen 0 640x480x24 -listen tcp -fbdir /dev/shm -ac