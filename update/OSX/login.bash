#!/bin/bash

if pgrep "Plex\ Media\ Server" >/dev/null 2>&1
then
open -a ScreenSaverEngine
else
/usr/bin/osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Plex Media Server.app", hidden:true}'
open -a ScreenSaverEngine
fi
