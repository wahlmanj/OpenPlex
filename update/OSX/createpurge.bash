#!/bin/bash

## find update/OSX path
cd /Applications/PlexConnect/update/OSX

## Copy com.plex.plexconnect.auto.plist
cp com.purge.plist /Library/LaunchDaemons

## create autostart plist for next boot
echo 'Installing Purge...'

## change ownership and permissions of the plist file to make it launchctl compatible
chown root /Library/LaunchDaemons/com.purge.plist
chmod 644 /Library/LaunchDaemons/com.purge.plist

## start Purge for this session
echo 'Enabled purge...'

## launch the plist so that we can use it without a reboot
launchctl load /Library/LaunchDaemons/com.purge.plist

## wait a couple seconds to allow Purge to load
sleep 2

## display the running status of PlexConnect
#./PlexConnect_daemon.bash status
launchctl list | grep com.purge
