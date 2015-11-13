#!/bin/sh
OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

if [ "$OSX_VERS" -eq 6 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 7 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 8 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 9 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 10 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
installbash.bash
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 11 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
# Grant Assistive Access to Terminal and “osascript”.
sqlite3 <<EOF
.open '/Library/Application Support/com.apple.TCC/TCC.db'
insert or replace into access values('kTCCServiceAccessibility','com.apple.Terminal',0,1,1,NULL,NULL);
insert or replace into access values('kTCCServiceAccessibility','OpenPlex.updater',0,1,1,NULL,NULL);
insert or replace into access values('kTCCServiceAccessibility','$(which osascript)',1,1,1,NULL,NULL);
.quit
EOF
# allow OpenPlex to load before opening app
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 12 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 13 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 14 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo ''; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
osascript <<EOF
tell app "System Events" to tell process "OpenPlex"
click menu bar item 1 of menu bar 2
end tell
EOF
killall updater
echo $OSX_VERS
fi