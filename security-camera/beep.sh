#!/bin/bash

BEEPVALUE=`cat /home/pi/motionui/security-camera/beep.txt`

#If beepvalue is on --> play beep else play nothing
if [ "$BEEPVALUE" == "on" ]; then
       omxplayer /home/pi/motionui/security-camera/beep.wav
    echo "BEEP an!"  
else
        echo "BEEP aus!" 
fi
