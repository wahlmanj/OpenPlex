#!/bin/bash

## stop and unload PlexConnect
stop.bash

## Wait until plexConnect is unloaded
sleep 3

## Remove OpenPlex & WebConnect scripts & folders
rm -Rf /usr/local/git/OP
rm -Rf /usr/local/git/OpenPlex
rm /Library/LaunchDaemons/com.plex.plexconnect.bash.plist
rm /Library/WebServer/CGI-Executables/bash.cgi
rm /Library/WebServer/CGI-Executables/installer.cgi
rm /Library/WebServer/CGI-Executables/ios.cgi
rm /Library/WebServer/CGI-Executables/list.cgi
rm /Library/WebServer/CGI-Executables/openplex.cgi
rm /Library/WebServer/CGI-Executables/webconnect.cgi
rm /usr/bin/10.10vb.bash
rm /usr/bin/appweb.bash
rm /usr/bin/appwebbash.bash
rm /usr/bin/auto.bash
rm /usr/bin/backupatvsettings.bash
rm /usr/bin/backupatvsettingsbash.bash
rm /usr/bin/backup.bash
rm /usr/bin/backupbash.bash
rm /usr/bin/createauto.bash
rm /usr/bin/createautobash.bash
rm /usr/bin/createcert.bash
rm /usr/bin/createcertbash.bash
rm /usr/bin/createimovie.bash
rm /usr/bin/createimoviebash.bash
rm /usr/bin/createplist.bash
rm /usr/bin/createwsj.bash
rm /usr/bin/createwsjbash.bash
rm /usr/bin/cyberghost.bash
rm /usr/bin/cyberghostbash.bash
rm /usr/bin/falco.bash
rm /usr/bin/falcobash.bash
rm /usr/bin/hide
rm /usr/bin/hide.bash
rm /usr/bin/ibaa.bash
rm /usr/bin/ibaabash.bash
rm /usr/bin/install.bash
rm /usr/bin/installbash.bash
rm /usr/bin/itunes.bash
rm /usr/bin/itunesbash.bash
rm /usr/bin/lock.bash
rm /usr/bin/lockbash.bash
rm /usr/bin/loghigh.bash
rm /usr/bin/loghighbash.bash
rm /usr/bin/lognormal.bash
rm /usr/bin/lognormalbash.bash
rm /usr/bin/muteboot.bash
rm /usr/bin/pht.bash
rm /usr/bin/phtbash.bash
rm /usr/bin/pillow.bash
rm /usr/bin/plexweb.bash
rm /usr/bin/plexwebbash.bash
rm /usr/bin/plexwebwan.bash
rm /usr/bin/plexwebwanbash.bash
rm /usr/bin/plexwebios.bash
rm /usr/bin/plexwebiosbash.bash
rm /usr/bin/plexwebioswan.bash
rm /usr/bin/plexwebioswanbash.bash
rm /usr/bin/plexweblist.bash
rm /usr/bin/plexweblistbash.bash
rm /usr/bin/plexweblistwan.bash
rm /usr/bin/plexweblistwanbash.bash
rm /usr/bin/pms.bash
rm /usr/bin/pmsbash.bash
rm /usr/bin/pmsscan.bash
rm /usr/bin/pmsscanbash.bash
rm /usr/bin/purgesettings.bash
rm /usr/bin/purgesettingsbash.bash
rm /usr/bin/pythonkiller.bash
rm /usr/bin/pythonkillerbash.bash
rm /usr/bin/quit
rm /usr/bin/quit.bash
rm /usr/bin/quititunes.bash
rm /usr/bin/quititunesbash.bash
rm /usr/bin/reboot.bash
rm /usr/bin/rebootbash.bash
rm /usr/bin/removecerts.bash
rm /usr/bin/removecertsbash.bash
rm /usr/bin/restart.bash
rm /usr/bin/restartbash.bash
rm /usr/bin/restore.bash
rm /usr/bin/restorebash.bash
rm /usr/bin/restoreatvsettings.bash
rm /usr/bin/restoreatvsettingsbash.bash
rm /usr/bin/restorecerts.bash
rm /usr/bin/restorecertsbash.bash
rm /usr/bin/show
rm /usr/bin/show.bash
rm /usr/bin/shutdown.bash
rm /usr/bin/shutdownbash.bash
rm /usr/bin/sleep.bash
rm /usr/bin/sleepbash.bash
rm /usr/bin/start.bash
rm /usr/bin/startbash.bash
rm /usr/bin/status.bash
rm /usr/bin/statusbash.bash
rm /usr/bin/stoffez.bash
rm /usr/bin/stoffezbash.bash
rm /usr/bin/stop.bash
rm /usr/bin/stopbash.bash
rm /usr/bin/sudoers.bash
rm /usr/bin/sudoersfix.bash
rm /usr/bin/sudoersfixbash.bash
rm /usr/bin/timemachine.bash
rm /usr/bin/timemachinebash.bash
rm /usr/bin/trash.bash
rm /usr/bin/trashbash.bash
rm /usr/bin/trashbase.bash
rm /usr/bin/tv.bash
rm /usr/bin/tvbash.bash
rm /usr/bin/uninstallbash.bash
rm /usr/bin/unmuteboot.bash
rm /usr/bin/update.bash
rm /usr/bin/updatebash.bash
rm /usr/bin/updatewc.bash
rm /usr/bin/updatewcbash.bash
rm /usr/bin/updater.bash
rm /usr/bin/updaterbash.bash
rm /usr/bin/utorrent.bash
rm /usr/bin/utorrentbash.bash
rm /usr/bin/wahlmanj.bash
rm /usr/bin/wahlmanjbash.bash
rm /usr/bin/wake.bash
rm /usr/bin/wakebash.bash
rm /usr/bin/wcdefault.bash
rm /usr/bin/wcinstaller.bash
rm /usr/bin/wcinstallerbash.bash
rm /usr/bin/wcios.bash
rm /usr/bin/wclist.bash
rm /usr/bin/wclistbash.bash
rm /usr/bin/wcopenplex.bash
rm /usr/bin/wcopenplexbash.bash
rm /usr/bin/websharing.bash
rm /usr/bin/websharingbash.bash
rm /usr/bin/who.bash
rm /usr/bin/whobash.bash
rm /usr/bin/wol.bash
rm /usr/bin/xml.bash

cp /Applications/PlexConnect/update/OSX/defaultsudoers /etc/sudoers
chmod 440 /etc/sudoers

if [ -s /Applications/PlexConnect ]
then
rm -Rf /Applications/PlexConnect
fi

if [ -s __HOME__/Library/Application\ Support/OpenPlex ]
then
rm -Rf __HOME__/Library/Application\ Support/OpenPlex
fi

if [ -s /Applications/OpenPlex ]
then
rm -Rf /Applications/OpenPlex
fi

if [ -s /Applications/OpenPlex.app ]
then
rm -Rf /Applications/OpenPlex.app
fi



killall OpenPlex

## Explain uninstall has been completed
echo 'OpenConnect and WebConnect have been uninstalled if there is numerous rm commands during this script you did not install WebConnect'
