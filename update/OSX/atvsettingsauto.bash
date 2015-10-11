start.bash
sleep 4
stop.bash
while : ; do
    [[ -f "/Applications/PlexConnect/ATVSettings.cfg" ]] && break
    echo "Pausing until ATVSettings.cfg exists."
    sleep 1
    restart.bash
done
stop.bash
sleep 3
cp /Applications/plexconnect_BACKUP/ATVSettings.cfg /Applications/PlexConnect
cd /Applications/PlexConnect
chown root:admin ATVSettings.cfg
chmod 644 ATVSettings.cfg
start.bash
## Display ATVSettings.cfg
FILE="/Applications/PlexConnect/ATVSettings.cfg"
echo "*** File - $FILE contents ***"
cat $FILE
