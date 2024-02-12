#!/bin/bash
pulseaudio --start --disallow-exit -vvv
x11vnc -forever -viewonly -shared -nopw -noshm