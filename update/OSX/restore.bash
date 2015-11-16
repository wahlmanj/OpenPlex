#!/bin/bash

stopbash.bash

## Wait till PlexConnect saves settings
sleep 8

## cd to PlexConnect directory
cd /Applications/PlexConnect
PlexConnectPath=${PWD}

cp /Applications/plexconnect_BACKUP/ATVSettings.cfg /Applications/PlexConnect
cp /Applications/plexconnect_BACKUP/settings.cfg /Applications/PlexConnect
cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates
cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates
cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates

fanartcache="${PlexConnectPath}/assets/fanartcache"
if [ -d "$fanartcache" ]; then
rm /Applications/PlexConnect/assets/fanartcache/*
cp -R /Applications/plexconnect_BACKUP/fanartcache/* /Applications/PlexConnect/assets/fanartcache
else
echo 'fanartcache dir not found'

fi

brotusericons="${PlexConnectPath}/assets/templates/galaxy/images/flow"
if [ -d "$brotusericons" ]; then
cp -R /Applications/plexconnect_BACKUP/flow/* /Applications/PlexConnect/assets/templates/plex/images/flow
cp -R /Applications/plexconnect_BACKUP/flow/* /Applications/PlexConnect/assets/templates/galaxy/images/flow
else
echo 'brotuser flow dir not found'

fi

cyberghosticons="${PlexConnectPath}/assets/thumbnails/Plex/images/custom"
if [ -d "$cyberghosticons" ]; then
cp -R /Applications/plexconnect_BACKUP/flow/* /Applications/PlexConnect/assets/thumbnails/Plex/images/custom/flow
cp -R /Applications/plexconnect_BACKUP/top/* /Applications/PlexConnect/assets/thumbnails/Plex/images/custom/top
else
echo 'Cyberghost flow and top dir not found'

fi

stoffezicons="${PlexConnectPath}/assets/thumbnails"
if [ -d "$stoffezicons" ]; then
cp -R /Applications/plexconnect_BACKUP/flow/* /Applications/PlexConnect/assets/thumbnails
cp -R /Applications/plexconnect_BACKUP/top/* /Applications/PlexConnect/assets/thumbnails
else
echo 'stoffez flow dir not found'

fi

falcoicons="${PlexConnectPath}/assets/thumbnails"
if [ -d "$falcoicons" ]; then
cp -R /Applications/plexconnect_BACKUP/flow/* /Applications/PlexConnect/assets/thumbnails
cp -R /Applications/plexconnect_BACKUP/top/* /Applications/PlexConnect/assets/thumbnails
else
echo 'falco953 flow dir not found'

fi

startbash.bash

echo 'All available PlexConnect settings have been restored'
