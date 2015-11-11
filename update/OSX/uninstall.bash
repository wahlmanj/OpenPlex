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
rm /usr/local/bin/10.10vb.bash
rm /usr/local/bin/appupdate.bash
rm /usr/local/bin/appupdatebash.bash
rm /usr/local/bin/appweb.bash
rm /usr/local/bin/appwebbash.bash
rm /usr/local/bin/atvsettingsauto.bash
rm /usr/local/bin/atvsettingsautobash.bash
rm /usr/local/bin/auto.bash
rm /usr/local/bin/backupatvsettings.bash
rm /usr/local/bin/backupatvsettingsbash.bash
rm /usr/local/bin/backup.bash
rm /usr/local/bin/backupbash.bash
rm /usr/local/bin/bootlock.bash
rm /usr/local/bin/bootlockbash.bash
rm /usr/local/bin/createauto.bash
rm /usr/local/bin/createautobash.bash
rm /usr/local/bin/createcert.bash
rm /usr/local/bin/createcertbash.bash
rm /usr/local/bin/createimovie.bash
rm /usr/local/bin/createimoviebash.bash
rm /usr/local/bin/createpurge.bash
rm /usr/local/bin/createpurgebash.bash
rm /usr/local/bin/createplist.bash
rm /usr/local/bin/createwsj.bash
rm /usr/local/bin/createwsjbash.bash
rm /usr/local/bin/cyberghost.bash
rm /usr/local/bin/cyberghostbash.bash
rm /usr/local/bin/falco.bash
rm /usr/local/bin/falcobash.bash
rm /usr/local/bin/hide
rm /usr/local/bin/hide.bash
rm /usr/local/bin/ibaa.bash
rm /usr/local/bin/icon.bash
rm /usr/local/bin/ibaabash.bash
rm /usr/local/bin/install.bash
rm /usr/local/bin/installbash.bash
rm /usr/local/bin/itunes.bash
rm /usr/local/bin/itunesbash.bash
rm /usr/local/bin/lock.bash
rm /usr/local/bin/lockbash.bash
rm /usr/local/bin/loghigh.bash
rm /usr/local/bin/loghighbash.bash
rm /usr/local/bin/login.bash
rm /usr/local/bin/loginbash.bash
rm /usr/local/bin/lognormal.bash
rm /usr/local/bin/lognormalbash.bash
rm /usr/local/bin/muteboot.bash
rm /usr/local/bin/pht.bash
rm /usr/local/bin/phtbash.bash
rm /usr/local/bin/pillow.bash
rm /usr/local/bin/plexweb.bash
rm /usr/local/bin/plexwebbash.bash
rm /usr/local/bin/plexwebwan.bash
rm /usr/local/bin/plexwebwanbash.bash
rm /usr/local/bin/plexwebios.bash
rm /usr/local/bin/plexwebiosbash.bash
rm /usr/local/bin/plexwebioswan.bash
rm /usr/local/bin/plexwebioswanbash.bash
rm /usr/local/bin/plexweblist.bash
rm /usr/local/bin/plexweblistbash.bash
rm /usr/local/bin/plexweblistwan.bash
rm /usr/local/bin/plexweblistwanbash.bash
rm /usr/local/bin/pms.bash
rm /usr/local/bin/pmsbash.bash
rm /usr/local/bin/pmsscan.bash
rm /usr/local/bin/pmsscanbash.bash
rm /usr/local/bin/purge.bash
rm /usr/local/bin/purgebash.bash
rm /usr/local/bin/purgesettings.bash
rm /usr/local/bin/purgesettingsbash.bash
rm /usr/local/bin/pythonkiller.bash
rm /usr/local/bin/pythonkillerbash.bash
rm /usr/local/bin/quit
rm /usr/local/bin/quit.bash
rm /usr/local/bin/quititunes.bash
rm /usr/local/bin/quititunesbash.bash
rm /usr/local/bin/reboot.bash
rm /usr/local/bin/rebootbash.bash
rm /usr/local/bin/removeauto.bash
rm /usr/local/bin/removeautobash.bash
rm /usr/local/bin/removecerts.bash
rm /usr/local/bin/removecertsbash.bash
rm /usr/local/bin/removepurge.bash
rm /usr/local/bin/removepurgebash.bash
rm /usr/local/bin/restart.bash
rm /usr/local/bin/restartbash.bash
rm /usr/local/bin/restore.bash
rm /usr/local/bin/restorebash.bash
rm /usr/local/bin/restoreatvsettings.bash
rm /usr/local/bin/restoreatvsettingsbash.bash
rm /usr/local/bin/restorecerts.bash
rm /usr/local/bin/restorecertsbash.bash
rm /usr/local/bin/show
rm /usr/local/bin/show.bash
rm /usr/local/bin/shutdown.bash
rm /usr/local/bin/shutdownbash.bash
rm /usr/local/bin/sleep.bash
rm /usr/local/bin/sleepbash.bash
rm /usr/local/bin/start.bash
rm /usr/local/bin/startbash.bash
rm /usr/local/bin/status.bash
rm /usr/local/bin/statusbash.bash
rm /usr/local/bin/stoffez.bash
rm /usr/local/bin/stoffezbash.bash
rm /usr/local/bin/stop.bash
rm /usr/local/bin/stopbash.bash
rm /usr/local/bin/sudoers.bash
rm /usr/local/bin/sudoersfix.bash
rm /usr/local/bin/sudoersfixbash.bash
rm /usr/local/bin/timemachine.bash
rm /usr/local/bin/timemachinebash.bash
rm /usr/local/bin/trash.bash
rm /usr/local/bin/trashbash.bash
rm /usr/local/bin/trashbase.bash
rm /usr/local/bin/trashbasebash.bash
rm /usr/local/bin/tv.bash
rm /usr/local/bin/tvbash.bash
rm /usr/local/bin/uninstallbash.bash
rm /usr/local/bin/unmuteboot.bash
rm /usr/local/bin/update.bash
rm /usr/local/bin/updatebash.bash
rm /usr/local/bin/updatewc.bash
rm /usr/local/bin/updatewcbash.bash
rm /usr/local/bin/updater.bash
rm /usr/local/bin/updaterbash.bash
rm /usr/local/bin/utorrent.bash
rm /usr/local/bin/utorrentbash.bash
rm /usr/local/bin/wahlmanj.bash
rm /usr/local/bin/wahlmanjbash.bash
rm /usr/local/bin/wake.bash
rm /usr/local/bin/wakebash.bash
rm /usr/local/bin/wcdefault.bash
rm /usr/local/bin/wcdefaultbash.bash
rm /usr/local/bin/wcinstaller.bash
rm /usr/local/bin/wcinstallerbash.bash
rm /usr/local/bin/wcios.bash
rm /usr/local/bin/wciosbash.bash
rm /usr/local/bin/wclist.bash
rm /usr/local/bin/wclistbash.bash
rm /usr/local/bin/wcopenplex.bash
rm /usr/local/bin/wcopenplexbash.bash
rm /usr/local/bin/websharing.bash
rm /usr/local/bin/websharingbash.bash
rm /usr/local/bin/who.bash
rm /usr/local/bin/whobash.bash
rm /usr/local/bin/wol.bash
rm /usr/local/bin/xml.bash

cp /Applications/PlexConnect/update/OSX/defaultsudoers /etc/sudoers
chmod 440 /etc/sudoers

if [ -s /Applications/PlexConnect ]
then
rm -Rf /Applications/PlexConnect
fi

if [ -s ~/Library/Application\ Support/OpenPlex ]
then
rm -Rf ~/Library/Application\ Support/OpenPlex
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

rm /usr/local/bin/uninstall.bash

## Explain uninstall has been completed
echo 'OpenConnect and WebConnect have been uninstalled if there is numerous rm commands during this script you did not install WebConnect'
