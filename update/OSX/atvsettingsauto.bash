start.bash
stop.bash
sleep 4
while : ; do
    [[ -f "/Applications/PlexConnect/ATVSettings.cfg" ]] && break
    echo "Pausing until ATVSettings.cfg exists."
    sleep 4
    restart.bash
done
stop.bash
sleep 3
cp /Applications/PlexConnect/ATVSettings.cfg /Applications/plexconnect_BACKUP/ATVSettingsauto.cfg
cd /Applications/plexconnect_BACKUP
grep -B2 myplex_auth ATVSettings.cfg | sed '/^--$/d' > myplex.temp
sed '1,3d' myplex.temp > myplex.auto
rm myplex.temp
cat myplex.auto >> ATVSettingsauto.cfg
cp /Applications/plexconnect_BACKUP/ATVSettingsauto.cfg /Applications/PlexConnect/ATVSettings.cfg
rm ATVSettingsauto.cfg
cd /Applications/PlexConnect
chown root:admin ATVSettings.cfg
chmod 644 ATVSettings.cfg
start.bash
