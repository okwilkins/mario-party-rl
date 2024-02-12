#!/bin/bash
/usr/bin/pulseaudio -D --load="module-native-protocol-unix socket=/tmp/pulseaudio.socket auth-anonymous=1" --exit-idle-time=-1 --disallow-exit --verbose

# Start the emulator
mupen64plus --nospeedlimit --resolution 640x480 ~/roms/mario_party_usa.z64