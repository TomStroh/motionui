#!/bin/bash

while [ true ]
do
# freier Speicherplatz auslesen
size=$(df -k /dev/root | tail -1 | awk '{print $4}')
#wenn Speicherplatz kleiner 10 MB, sollen älteste Aufzeichnungen gelöscht werden
if (($size < 10000)); then
# Auflisten aller vorhandenen Aufzeichnungen nach Zeit, danach löschen der ältesten Datei
	cd /home/pi/motionui/public/video/ 
	ls -t | sed -e '1,1d' | xargs -d '\n' rm
	echo "Speicherplatz demnächst voll" 
        #10 Min warten bis zur nächsten Ausführung, wenn Speicherplatz nicht voll
        sleep 600;
else
	 echo "Speicherplatz nicht voll"
fi
done
