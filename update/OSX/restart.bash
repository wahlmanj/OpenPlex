#!/bin/bash

## stop and restart processes
echo 'Restarting PlexConnect...'

stop.bash
sleep 4
start.bash

## display the running status of PlexConnect
#./PlexConnect_daemon.bash status
launchctl list | grep com.plex.plexconnect.bash

if [ ! -f /Applications/PlexConnect/PlexConnect.log ]
then
echo 'No log present'
else
## Display PlexConnect log
FILE="/Applications/PlexConnect/PlexConnect.log"
echo "*** File - $FILE contents ***"
cat $FILE
fi
