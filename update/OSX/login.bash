#!/bin/bash

if pgrep "Plex\ Media\ Server" >/dev/null 2>&1
then
/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine
else
open /Applications/Plex\ Media\ Server.app
/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine
fi
