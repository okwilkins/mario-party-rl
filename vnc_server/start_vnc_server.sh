#!/bin/bash
pulseaudio --start --disallow-exit -vvv
pasystray
x11vnc -forever -viewonly -shared -nopw -noshm