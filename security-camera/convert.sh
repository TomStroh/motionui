#!/bin/bash
VIDEODIR="/home/pi/motionui/security-camera"

while [ true ]
do
    # Start avi to mp4 converting
    CONVERTABLEFILES=(`echo $(ls $VIDEODIR/video | grep .avi) | tr "," "\n"`)
    sleep 70
    for FILE in "${CONVERTABLEFILES[@]}"
    do
        VIDEOFILE=$VIDEODIR"/video/"$FILE
    	VIDEOFILEMP4="/home/pi/motionui/public/video/"${FILE/.avi/.mp4}
        echo $VIDEOFILE" to "$VIDEOFILEMP4
	ffmpeg -i $VIDEOFILE $VIDEOFILEMP4
    done

    # Removing converted files sources
    for FILE in "${CONVERTABLEFILES[@]}"
    do
        VIDEOFILE=$VIDEODIR"/video/"$FILE
        VIDEOFILEMP4="/home/pi/motionui/public/video/"${FILE/.avi/.mp4}
        
        #if old avi file exist in /home/pi/security-camera/video delete it
        if [[ -f $VIDEOFILE && -f $VIDEOFILEMP4 ]]
        then
            echo "REMOVE "$VIDEOFILE
            rm -f $VIDEOFILE
        fi
    done

done
