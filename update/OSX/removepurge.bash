#!/bin/bash

echo 'Removing Purge...'

## change ownership and permissions of the plist file to make it launchctl compatible
chown root /Library/LaunchDaemons/com.purge.plist
chmod 644 /Library/LaunchDaemons/com.purge.plist

## start Purge for this session
echo 'Removing purge...'

## launch the plist so that we can use it without a reboot
launchctl unload /Library/LaunchDaemons/com.purge.plist

## wait a couple seconds to allow Purge to unload
sleep 2

## Remove Purge plist
rm /Library/LaunchDaemons/com.purge.plist

## display the running status of purge
launchctl list | grep com.purge
