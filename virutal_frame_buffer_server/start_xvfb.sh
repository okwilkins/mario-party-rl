#!/bin/bash
pulseaudio -D --verbose --exit-idle-time=-1 --disallow-exit
Xvfb :0 -screen 0 640x480x24 -listen tcp -fbdir /dev/shm -ac