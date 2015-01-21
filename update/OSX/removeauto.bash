#!/bin/bash

## go back to InstallerPath
cd /Library/LaunchDaemons

## launch the plist so that we can use it without a reboot
launchctl unload com.plex.plexconnect.auto.plist

## Copy com.plex.plexconnect.auto.plist
rm com.plex.plexconnect.auto.plist
