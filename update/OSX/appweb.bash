if [ -s __HOME__/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app ]
then rm -Rf __HOME__/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app
fi
if [ -s __HOME__/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app ]
then rm -Rf __HOME__/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app
fi
if [ -s __HOME__/Library/Application\ Support/OpenPlex/updater/updater.app ]
then rm -Rf __HOME__/Library/Application\ Support/OpenPlex/updater/updater.app
fi
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
cd __HOME__/Library/Application\ Support/OpenPlex
# fetch changes, git stores them in FETCH_HEAD
git fetch
# check for remote changes in origin repository
newUpdatesAvailable=`git diff HEAD FETCH_HEAD`
if [ "$newUpdatesAvailable" != "" ]
then
## get update
echo "OpenPlex update available, Installing..."
git pull
git reset --hard
afplay /System/Library/Sounds/Glass.aiff
else
echo "no updates available"
fi
# Allow OpenPlex git and app to update to display proper git HEAD commit
sleep 1
chmod 777 /Applications/PlexConnect/Update/OSX
cp -R __HOME__/Library/Application\ Support/OpenPlex/update/* /Applications/PlexConnect/update/OSX
