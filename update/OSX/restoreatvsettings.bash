stop.bash
start.bash
cp /Applications/plexconnect_BACKUP/ATVSettings.cfg /Applications/PlexConnect
cd /Applications/PlexConnect
chown root:admin ATVSettings.cfg
chmod 644 ATVSettings.cfg

## Display ATVSettings.cfg
FILE="/Applications/PlexConnect/ATVSettings.cfg"
echo "*** File - $FILE contents ***"
cat $FILE
