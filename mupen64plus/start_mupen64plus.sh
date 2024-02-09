#!/bin/bash

# Start pulseaudio server
pulseaudio -D --verbose --exit-idle-time=-1 --disallow-exit
pactl load-module module-native-protocol-tcp auth-anonymous=1

# Start the emulator
mupen64plus --nospeedlimit --resolution 640x480 roms/mario_party_usa.z64