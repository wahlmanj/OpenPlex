#!/bin/bash

export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
stop.bash
sleep 4
trashbase.bash
cd /Applications
git clone https://github.com/stoffez/PlexConnect.git
mkdir -p /Applications/PlexConnect/update/OSX
cd __HOME__/Library/Application\ Support/OpenPlex
# fetch changes, git stores them in FETCH_HEAD
git fetch
# check for remote changes in origin repository
newUpdatesAvailable=`git diff HEAD FETCH_HEAD`
if [ "$newUpdatesAvailable" != "" ]
then
git pull
cp -R __HOME__/Library/Application\ Support/OpenPlex/update /Applications/PlexConnect
cd /Applications/PlexConnect/update/OSX
chmod -R ugo+rw /Applications/PlexConnect/update/OSX/
chmod +x install.bash
./install.bash
git reset --hard
else
echo "no updates available"
fi
echo 'Stoffez cloned to /Applications/PlexConnect'
