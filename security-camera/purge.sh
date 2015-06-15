#!/bin/bash

while [ true ]
do
EXPIREDAYS=`cat /home/pi/motionui/security-camera/ini.txt`
DAYS=1440
EXPIREAGE=`expr $EXPIREDAYS \* $DAYS`
echo $EXPIREAGE

find /home/pi/motionui/public/video/ -type f -mmin +$EXPIREAGE -delete
done
