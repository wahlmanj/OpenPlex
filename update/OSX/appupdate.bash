cd ~/Library/Application\ Support/OpenPlex
git fetch
newUpdatesAvailable=`git diff HEAD FETCH_HEAD`
if [ "$newUpdatesAvailable" != "" ]
then
echo "Updates Available"
else
echo "Already up-to-date."
fi