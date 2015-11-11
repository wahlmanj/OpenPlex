#!/bin/bash

cd ~/Library/Application\ Support/OpenPlex
# fetch changes, git stores them in FETCH_HEAD
git fetch
# check for remote changes in origin repository
newUpdatesAvailable=`git diff HEAD FETCH_HEAD`
if [ "$newUpdatesAvailable" != "" ]
then
git pull
cp -R ~/Library/Application\ Support/OpenPlex/update /Applications/PlexConnect
cd /Applications/PlexConnect/update/OSX
chmod -R ugo+rw /Applications/PlexConnect/update/OSX/
chmod +x install.bash
./install.bash
git reset --hard
else
echo "no updates available"
fi
