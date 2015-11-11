if [ -s ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app ]
then rm -Rf ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app
fi
if [ -s ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app ]
then rm -Rf ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.app
fi
if [ -s ~/Library/Application\ Support/OpenPlex/updater/updater.app ]
then rm -Rf ~/Library/Application\ Support/OpenPlex/updater/updater.app
fi
export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
cd ~/Library/Application\ Support/OpenPlex
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
else
echo "no updates available"
fi
# Allow OpenPlex git and app to update to display proper git HEAD commit
sleep 1
chmod 777 /Applications/PlexConnect/update/OSX
cp -R ~/Library/Application\ Support/OpenPlex/update/* /Applications/PlexConnect/update/OSX
