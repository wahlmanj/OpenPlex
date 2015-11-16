#!/bin/bash

## cd to PlexConnect directory
cd /Applications/PlexConnect
PlexConnectPath=${PWD}

## cd to PlexConnect Backup directory
cd /Applications/plexconnect_BACKUP
BackupPath=${PWD}

stopbash.bash

## allow atvsettings.cfg to generate if first clean shutdown
sleep 4

customicons="${BackupPath}/flow"
if [ -d "$customicons" ]; then
echo 'flow and top backup dir already present'
else
mkdir /Applications/plexconnect_BACKUP/top
mkdir /Applications/plexconnect_BACKUP/flow
echo 'flow and top backup dir created'

fi

brotusericons="${PlexConnectPath}/assets/templates/galaxy/images/flow"
if [ -d "$brotusericons" ]; then
cp -R /Applications/PlexConnect/assets/templates/plex/images/flow/* /Applications/plexconnect_BACKUP/flow
cp -R /Applications/PlexConnect/assets/templates/galaxy/images/flow/* /Applications/plexconnect_BACKUP/flow
else
echo 'brotuser flow dir not found'

fi

cyberghosticons="${PlexConnectPath}/assets/thumbnails/Plex/images/custom"
if [ -d "$cyberghosticons" ]; then
cp -R /Applications/PlexConnect/assets/thumbnails/Plex/images/custom/flow/* /Applications/plexconnect_BACKUP/flow
cp -R /Applications/PlexConnect/assets/thumbnails/Plex/images/custom/top/* /Applications/plexconnect_BACKUP/top
else 
echo 'Cyberghost flow and top dir not found'

fi

stoffezicons="${PlexConnectPath}/assets/thumbnails"
if [ -d "$stoffezicons" ]; then
cp -R /Applications/PlexConnect/assets/thumbnails/* /Applications/plexconnect_BACKUP/flow
cp -R /Applications/PlexConnect/assets/thumbnails/* /Applications/plexconnect_BACKUP/top
else
echo 'stoffez dir not found'

fi

falcoicons="${PlexConnectPath}/assets/thumbnails"
if [ -d "$falcoicons" ]; then
cp -R /Applications/PlexConnect/assets/thumbnails/* /Applications/plexconnect_BACKUP/flow
cp -R /Applications/PlexConnect/assets/thumbnails/* /Applications/plexconnect_BACKUP/top
else
echo 'falco dir not found'

fi

startbash.bash

if [ -s /Applications/plexconnect_BACKUP ]
then
chmod -R 777 /Applications/plexconnect_BACKUP
fi

echo 'All available PlexConnect settings have been backed up'
