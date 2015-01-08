stop.bash
sleep 4
while : ; do
    [[ -f "/Applications/PlexConnect/ATVSettings.cfg" ]] && break
    echo "Pausing until ATVSettings.cfg exists."
    sleep 1
done
cp /Applications/PlexConnect/ATVSettings.cfg /Applications/plexconnect_BACKUP
start.bash

## Display ATVSettings.cfg
FILE="/Applications/plexconnect_BACKUP/ATVSettings.cfg"
echo "*** File - $FILE contents ***"
cat $FILE
