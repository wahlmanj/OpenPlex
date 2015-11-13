#!/bin/bash

## save path to installer files
## cd "$( cd "$( dirname "$0" )" && pwd )"
cd /Applications/PlexConnect/update/OSX
InstallerPath=${PWD}

## find PlexConnect main path
cd ../..
PlexConnectPath=${PWD}

## go back to InstallerPath
cd update/OSX
DefaultPath=${PWD}

# current user
whoami=${USER}

## Generate wcios.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcios.bash
ed -s wcios.bash << EOF
1
a
:1234\/cgi-bin\/ios.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcios.bash << EOF
i
sed -i '' 's/__IOS__/http:\/\/
.
1,2j
wq
EOF
ed -s wcios.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wclist.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wclist.bash
ed -s wclist.bash << EOF
1
a
:1234\/cgi-bin\/list.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wclist.bash << EOF
i
sed -i '' 's/__LIST__/http:\/\/
.
1,2j
wq
EOF
ed -s wclist.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wcopenplex.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcopenplex.bash
ed -s wcopenplex.bash << EOF
1
a
:1234\/cgi-bin\/openplex.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcopenplex.bash << EOF
i
sed -i '' 's/__OPENPLEX__/http:\/\/
.
1,2j
wq
EOF
ed -s wcopenplex.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wcdefault.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcdefault.bash
ed -s wcdefault.bash << EOF
1
a
:1234\/cgi-bin\/bash.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcdefault.bash << EOF
i
sed -i '' 's/__DEFAULT__/http:\/\/
.
1,2j
wq
EOF
ed -s wcdefault.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate wcinstaller.bash based on OSX IP Address for webconnect.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > wcinstaller.bash
ed -s wcinstaller.bash << EOF
1
a
:1234\/cgi-bin\/installer.cgi/g' webconnect.cgi
.
1,2j
wq
EOF
ed -s wcinstaller.bash << EOF
i
sed -i '' 's/__INSTALLER__/http:\/\/
.
1,2j
wq
EOF
ed -s wcinstaller.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexweb.bash based on OSX IP Address for bash.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > plexweb.bash
ed -s plexweb.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' bash.cgi
.
1,2j
wq
EOF
ed -s plexweb.bash << EOF
i
sed -i '' 's/__PLEXWEB__/http:\/\/
.
1,2j
wq
EOF
ed -s plexweb.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexwebios.bash based on OSX IP Address for ios.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > plexwebios.bash
ed -s plexwebios.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' ios.cgi
.
1,2j
wq
EOF
ed -s plexwebios.bash << EOF
i
sed -i '' 's/__PLEXWEB__/http:\/\/
.
1,2j
wq
EOF
ed -s plexwebios.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexweblist.bash based on OSX IP Address for list.cgi
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > plexweblist.bash
ed -s plexweblist.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' list.cgi
.
1,2j
wq
EOF
ed -s plexweblist.bash << EOF
i
sed -i '' 's/__PLEXWEB__/http:\/\/
.
1,2j
wq
EOF
ed -s plexweblist.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate PlexWebWan.bash based on Wan IP Address for bash.cgi
curl icanhazip.com > plexwebwan.bash
ed -s plexwebwan.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' bash.cgi
.
1,2j
wq
EOF
ed -s plexwebwan.bash << EOF
i
sed -i '' 's/__PLEXWEBWAN__/http:\/\/
.
1,2j
wq
EOF
ed -s plexwebwan.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexwebioswan.bash based on Wan IP Address for ios.cgi
curl icanhazip.com > plexwebioswan.bash
ed -s plexwebioswan.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' ios.cgi
.
1,2j
wq
EOF
ed -s plexwebioswan.bash << EOF
i
sed -i '' 's/__PLEXWEBWAN__/http:\/\/
.
1,2j
wq
EOF
ed -s plexwebioswan.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate plexweblistwan.bash based on Wan IP Address for list.cgi
curl icanhazip.com > plexweblistwan.bash
ed -s plexweblistwan.bash << EOF
1
a
:32400\/web\/index.html#!\/dashboard/g' list.cgi
.
1,2j
wq
EOF
ed -s plexweblistwan.bash << EOF
i
sed -i '' 's/__PLEXWEBWAN__/http:\/\/
.
1,2j
wq
EOF
ed -s plexweblistwan.bash << EOF
i
cd /Library/WebServer/CGI-Executables
.
wq
EOF

## Generate xml.bash based on OSX IP Address for all .xml files
ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 > xml.bash
ed -s xml.bash << EOF
1
a
/g' *xml
.
1,2j
wq
EOF
ed -s xml.bash << EOF
i
sed -i '' 's/__LOCALIP__/
.
1,2j
wq
EOF
ed -s xml.bash << EOF
i
#!/bin/bash
.
wq
EOF

## WebConnect Requirements
cp bash.cgi /Library/WebServer/CGI-Executables/
cp ios.cgi /Library/WebServer/CGI-Executables/
cp list.cgi /Library/WebServer/CGI-Executables/
cp openplex.cgi /Library/WebServer/CGI-Executables/
cp installer.cgi /Library/WebServer/CGI-Executables/
cp webconnect.cgi /Library/WebServer/CGI-Executables/
chmod +x /Library/WebServer/CGI-Executables/bash.cgi
chmod +x /Library/WebServer/CGI-Executables/ios.cgi
chmod +x /Library/WebServer/CGI-Executables/list.cgi
chmod +x /Library/WebServer/CGI-Executables/installer.cgi
chmod +x /Library/WebServer/CGI-Executables/openplex.cgi
chmod +x /Library/WebServer/CGI-Executables/webconnect.cgi

## check for script dir, if not exists then create it for systemwide access
if [ -d /usr/local/bin ]; then
echo exits
else
mkdir -p /usr/local/bin
fi

## copy files to /usr/local/bin for system wide access
cp 10.10vb.bash /usr/local/bin
cp appupdate.bash /usr/local/bin
cp appupdatebash.bash /usr/local/bin
cp appweb.bash /usr/local/bin
cp appwebbash.bash /usr/local/bin
cp atvsettingsauto.bash /usr/local/bin
cp atvsettingsautobash.bash /usr/local/bin
cp auto.bash /usr/local/bin
cp backup.bash /usr/local/bin
cp backupbash.bash /usr/local/bin
cp backupatvsettings.bash /usr/local/bin
cp backupatvsettingsbash.bash /usr/local/bin
cp bootlock.bash /usr/local/bin
cp bootlockbash.bash /usr/local/bin
cp clt.bash /usr/local/bin
cp cltbash.bash /usr/local/bin
cp createautobash.bash /usr/local/bin
cp createcert.bash /usr/local/bin
cp createcertbash.bash /usr/local/bin
cp createimovie.bash /usr/local/bin
cp createimoviebash.bash /usr/local/bin
cp createpurge.bash /usr/local/bin
cp createpurgebash.bash /usr/local/bin
cp createwsj.bash /usr/local/bin
cp createwsjbash.bash /usr/local/bin
cp cyberghostbash.bash /usr/local/bin
cp falcobash.bash /usr/local/bin
cp firewall.bash /usr/local/bin
cp firewallbash.bash /usr/local/bin
cp flexget.bash /usr/local/bin
cp flexgetbash.bash /usr/local/bin
cp hide /usr/local/bin
cp hide.bash /usr/local/bin
cp ibaabash.bash /usr/local/bin
cp icon.bash /usr/local/bin
cp install.bash /usr/local/bin
cp installbash.bash /usr/local/bin
cp itunes.bash /usr/local/bin
cp itunesbash.bash /usr/local/bin
cp lock.bash /usr/local/bin
cp lockbash.bash /usr/local/bin
cp loghigh.bash /usr/local/bin
cp loghighbash.bash /usr/local/bin
cp login.bash /usr/local/bin
cp loginbash.bash /usr/local/bin
cp lognormal.bash /usr/local/bin
cp lognormalbash.bash /usr/local/bin
cp muteboot.bash /usr/local/bin
cp pht.bash /usr/local/bin
cp phtbash.bash /usr/local/bin
cp pmsbash.bash /usr/local/bin
cp pillow.bash /usr/local/bin
cp plexweb.bash /usr/local/bin
cp plexwebbash.bash /usr/local/bin
cp plexwebwan.bash /usr/local/bin
cp plexwebwanbash.bash /usr/local/bin
cp plexwebios.bash /usr/local/bin
cp plexwebiosbash.bash /usr/local/bin
cp plexwebioswan.bash /usr/local/bin
cp plexwebioswanbash.bash /usr/local/bin
cp plexweblist.bash /usr/local/bin
cp plexweblistbash.bash /usr/local/bin
cp plexweblistwan.bash /usr/local/bin
cp plexweblistwanbash.bash /usr/local/bin
cp pmp.bash /usr/local/bin
cp pmpbash.bash /usr/local/bin
cp pms.bash /usr/local/bin
cp pmsscan.bash /usr/local/bin
cp pmsscanbash.bash /usr/local/bin
cp purge.bash /usr/local/bin
cp purgebash.bash /usr/local/bin
cp purgesettings.bash /usr/local/bin
cp purgesettingsbash.bash /usr/local/bin
cp pythonkiller.bash /usr/local/bin
cp pythonkillerbash.bash /usr/local/bin
cp quit /usr/local/bin
cp quit.bash /usr/local/bin
cp quititunes.bash /usr/local/bin
cp quititunesbash.bash /usr/local/bin
cp quitpht.bash /usr/local/bin
cp quitphtbash.bash /usr/local/bin
cp quitpmp.bash /usr/local/bin
cp quitpmpbash.bash /usr/local/bin
cp quitpms.bash /usr/local/bin
cp quitpmsbash.bash /usr/local/bin
cp reboot.bash /usr/local/bin
cp rebootbash.bash /usr/local/bin
cp removeauto.bash /usr/local/bin
cp removeautobash.bash /usr/local/bin
cp removecerts.bash /usr/local/bin
cp removecertsbash.bash /usr/local/bin
cp removepurge.bash /usr/local/bin
cp removepurgebash.bash /usr/local/bin
cp restart.bash /usr/local/bin
cp restartbash.bash /usr/local/bin
cp restoreatvsettings.bash /usr/local/bin
cp restoreatvsettingsbash.bash /usr/local/bin
cp restore.bash /usr/local/bin
cp restorebash.bash /usr/local/bin
cp restorecertsbash.bash /usr/local/bin
cp restorecerts.bash /usr/local/bin
cp settings.bash /usr/local/bin
cp settingsbash.bash /usr/local/bin
cp show /usr/local/bin
cp show.bash /usr/local/bin
cp shutdown.bash /usr/local/bin
cp shutdownbash.bash /usr/local/bin
cp sleep.bash /usr/local/bin
cp sleepbash.bash /usr/local/bin
cp start.bash /usr/local/bin
cp startbash.bash /usr/local/bin
cp status.bash /usr/local/bin
cp statusbash.bash /usr/local/bin
cp stoffezbash.bash /usr/local/bin
cp stop.bash /usr/local/bin
cp stopbash.bash /usr/local/bin
cp sudoersfix.bash /usr/local/bin
cp sudoersfixbash.bash /usr/local/bin
cp timemachine.bash /usr/local/bin
cp timemachinebash.bash /usr/local/bin
cp trashbase.bash /usr/local/bin
cp trashbasebash.bash /usr/local/bin
cp trash.bash /usr/local/bin
cp trashbash.bash /usr/local/bin
cp tv.bash /usr/local/bin
cp tvbash.bash /usr/local/bin
cp uninstall.bash /usr/local/bin
cp uninstallbash.bash /usr/local/bin
cp unmuteboot.bash /usr/local/bin
cp updatebash.bash /usr/local/bin
cp updaterbash.bash /usr/local/bin
cp updatewcbash.bash /usr/local/bin
cp utorrent.bash /usr/local/bin
cp utorrentbash.bash /usr/local/bin
cp wahlmanjbash.bash /usr/local/bin
cp wake.bash /usr/local/bin
cp wakebash.bash /usr/local/bin
cp wcdefault.bash /usr/local/bin
cp wcdefaultbash.bash /usr/local/bin
cp wcinstaller.bash /usr/local/bin
cp wcinstallerbash.bash /usr/local/bin
cp wcios.bash /usr/local/bin
cp wciosbash.bash /usr/local/bin
cp wclist.bash /usr/local/bin
cp wclistbash.bash /usr/local/bin
cp wcopenplex.bash /usr/local/bin
cp wcopenplexbash.bash /usr/local/bin
cp websharing.bash /usr/local/bin
cp websharingbash.bash /usr/local/bin
cp who.bash /usr/local/bin
cp whobash.bash /usr/local/bin
cp wol.bash /usr/local/bin
cp xml.bash /usr/local/bin

## replace __DEFAULTPATH__ in default createauto.bash
## save directly to the /usr/local/bin folder
sed -e "s/__DEFAULTPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createauto.bash" > /usr/local/bin/createauto.bash

## replace __INSTALLERPATH__ in default createimovie.bash
## save directly to the /usr/local/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createimovie.bash" > /usr/local/bin/createimovie.bash

## replace __INSTALLERPATH__ in default createwsj.bash
## save directly to the /usr/local/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createwsj.bash" > /usr/local/bin/createwsj.bash

## replace __INSTALLERPATH__ in default createcert.bash
## save directly to the /usr/local/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createcert.bash" > /usr/local/bin/createcert.bash

## replace __DEFAULTPATH__ in default createplist.bash
## save directly to the /usr/local/bin folder
sed -e "s/__DEFAULTPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/createplist.bash" > /usr/local/bin/createplist.bash

## replace __USERNAME__in default fixgit.bash
## save directly to the /usr/local/bin folder
##sed -e "s/__USERNAME__/$whoami/" "${DefaultPath}/fixgit.bash" > /usr/local/bin/fixgit.bash

## replace __INSTALLERPATH__ in default update.bash
## save directly to the /usr/local/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${DefaultPath}/update.bash" > /usr/local/bin/update.bash

## replace __INSTALLERPATH__ in default updater.bash
## save directly to the /usr/local/bin folder
sed -e "s/__INSTALLERPATH__/${InstallerPath//\//\\/}/" "${DefaultPath}/updater.bash" > /usr/local/bin/updater.bash

## replace __DEFAULTPATH__ in default webconnect.bash
## save directly to the /usr/local/bin folder
##sed -e "s/__DEFAULTPATH__/${InstallerPath//\//\\/}/" "${InstallerPath}/webconnect.bash" > /usr/local/bin/webconnect.bash

## fix permissions
chmod +x /usr/local/bin/10.10vb.bash
chmod +x /usr/local/bin/appupdate.bash
chmod +x /usr/local/bin/appupdatebash.bash
chmod +x /usr/local/bin/appweb.bash
chmod +x /usr/local/bin/appwebbash.bash
chmod +x /usr/local/bin/atvsettingsauto.bash
chmod +x /usr/local/bin/atvsettingsautobash.bash
chmod +x /usr/local/bin/auto.bash
chmod +x /usr/local/bin/backupatvsettings.bash
chmod +x /usr/local/bin/backupatvsettingsbash.bash
chmod +x /usr/local/bin/backup.bash
chmod +x /usr/local/bin/backupbash.bash
chmod +x /usr/local/bin/bootlock.bash
chmod +x /usr/local/bin/bootlockbash.bash
chmod +x /usr/local/bin/clt.bash
chmod +x /usr/local/bin/cltbash.bash
chmod +x /usr/local/bin/createauto.bash
chmod +x /usr/local/bin/createautobash.bash
chmod +x /usr/local/bin/createcert.bash
chmod +x /usr/local/bin/createcertbash.bash
chmod +x /usr/local/bin/createimovie.bash
chmod +x /usr/local/bin/createimoviebash.bash
chmod +x /usr/local/bin/createpurge.bash
chmod +x /usr/local/bin/createpurgebash.bash
chmod +x /usr/local/bin/createwsj.bash
chmod +x /usr/local/bin/createwsjbash.bash
chmod +x /usr/local/bin/cyberghostbash.bash
chmod +x /usr/local/bin/falcobash.bash
chmod +x /usr/local/bin/firewall.bash
chmod +x /usr/local/bin/firewallbash.bash
chmod +x /usr/local/bin/flexget.bash
chmod +x /usr/local/bin/flexgetbash.bash
chmod +x /usr/local/bin/hide
chmod +x /usr/local/bin/hide.bash
chmod +x /usr/local/bin/ibaabash.bash
chmod +x /usr/local/bin/icon.bash
chmod +x /usr/local/bin/install.bash
chmod +x /usr/local/bin/installbash.bash
chmod +x /usr/local/bin/itunes.bash
chmod +x /usr/local/bin/itunesbash.bash
chmod +x /usr/local/bin/lock.bash
chmod +x /usr/local/bin/lockbash.bash
chmod +x /usr/local/bin/loghigh.bash
chmod +x /usr/local/bin/loghighbash.bash
chmod +x /usr/local/bin/login.bash
chmod +x /usr/local/bin/loginbash.bash
chmod +x /usr/local/bin/lognormal.bash
chmod +x /usr/local/bin/lognormalbash.bash
chmod +x /usr/local/bin/muteboot.bash
chmod +x /usr/local/bin/pht.bash
chmod +x /usr/local/bin/phtbash.bash
chmod +x /usr/local/bin/pillow.bash
chmod +x /usr/local/bin/plexweb.bash
chmod +x /usr/local/bin/plexwebbash.bash
chmod +x /usr/local/bin/plexwebwan.bash
chmod +x /usr/local/bin/plexwebwanbash.bash
chmod +x /usr/local/bin/plexwebios.bash
chmod +x /usr/local/bin/plexwebiosbash.bash
chmod +x /usr/local/bin/plexwebioswan.bash
chmod +x /usr/local/bin/plexwebioswanbash.bash
chmod +x /usr/local/bin/plexweblist.bash
chmod +x /usr/local/bin/plexweblistbash.bash
chmod +x /usr/local/bin/plexweblistwan.bash
chmod +x /usr/local/bin/plexweblistwanbash.bash
chmod +x /usr/local/bin/pmp.bash
chmod +x /usr/local/bin/pmpbash.bash
chmod +x /usr/local/bin/pms.bash
chmod +x /usr/local/bin/pmsbash.bash
chmod +x /usr/local/bin/pmsscan.bash
chmod +x /usr/local/bin/pmsscanbash.bash
chmod +x /usr/local/bin/purge.bash
chmod +x /usr/local/bin/purgebash.bash
chmod +x /usr/local/bin/purgesettings.bash
chmod +x /usr/local/bin/purgesettingsbash.bash
chmod +x /usr/local/bin/pythonkiller.bash
chmod +x /usr/local/bin/pythonkillerbash.bash
chmod +x /usr/local/bin/quit
chmod +x /usr/local/bin/quit.bash
chmod +x /usr/local/bin/quititunes.bash
chmod +x /usr/local/bin/quititunesbash.bash
chmod +x /usr/local/bin/quitpht.bash
chmod +x /usr/local/bin/quitphtbash.bash
chmod +x /usr/local/bin/quitpmp.bash
chmod +x /usr/local/bin/quitpmpbash.bash
chmod +x /usr/local/bin/quitpms.bash
chmod +x /usr/local/bin/quitpmsbash.bash
chmod +x /usr/local/bin/reboot.bash
chmod +x /usr/local/bin/rebootbash.bash
chmod +x /usr/local/bin/removeauto.bash
chmod +x /usr/local/bin/removeautobash.bash
chmod +x /usr/local/bin/removecerts.bash
chmod +x /usr/local/bin/removecertsbash.bash
chmod +x /usr/local/bin/removepurge.bash
chmod +x /usr/local/bin/removepurgebash.bash
chmod +x /usr/local/bin/restart.bash
chmod +x /usr/local/bin/restartbash.bash
chmod +x /usr/local/bin/restore.bash
chmod +x /usr/local/bin/restorebash.bash
chmod +x /usr/local/bin/restoreatvsettings.bash
chmod +x /usr/local/bin/restoreatvsettingsbash.bash
chmod +x /usr/local/bin/restorecerts.bash
chmod +x /usr/local/bin/restorecertsbash.bash
chmod +x /usr/local/bin/settings.bash
chmod +x /usr/local/bin/settingsbash.bash
chmod +x /usr/local/bin/show
chmod +x /usr/local/bin/show.bash
chmod +x /usr/local/bin/shutdown.bash
chmod +x /usr/local/bin/shutdownbash.bash
chmod +x /usr/local/bin/sleep.bash
chmod +x /usr/local/bin/sleepbash.bash
chmod +x /usr/local/bin/start.bash
chmod +x /usr/local/bin/startbash.bash
chmod +x /usr/local/bin/status.bash
chmod +x /usr/local/bin/statusbash.bash
chmod +x /usr/local/bin/stoffezbash.bash
chmod +x /usr/local/bin/stop.bash
chmod +x /usr/local/bin/stopbash.bash
chmod +x /usr/local/bin/sudoersfix.bash
chmod +x /usr/local/bin/sudoersfixbash.bash
chmod +x /usr/local/bin/timemachine.bash
chmod +x /usr/local/bin/timemachinebash.bash
chmod +x /usr/local/bin/trash.bash
chmod +x /usr/local/bin/trashbash.bash
chmod +x /usr/local/bin/trashbasebash.bash
chmod +x /usr/local/bin/tv.bash
chmod +x /usr/local/bin/tvbash.bash
chmod +x /usr/local/bin/uninstall.bash
chmod +x /usr/local/bin/uninstallbash.bash
chmod +x /usr/local/bin/unmuteboot.bash
chmod +x /usr/local/bin/update.bash
chmod +x /usr/local/bin/updatebash.bash
chmod +x /usr/local/bin/updatewcbash.bash
chmod +x /usr/local/bin/updater.bash
chmod +x /usr/local/bin/updaterbash.bash
chmod +x /usr/local/bin/utorrent.bash
chmod +x /usr/local/bin/utorrentbash.bash
chmod +x /usr/local/bin/wahlmanjbash.bash
chmod +x /usr/local/bin/wake.bash
chmod +x /usr/local/bin/wakebash.bash
chmod +x /usr/local/bin/wcdefault.bash
chmod +x /usr/local/bin/wcdefaultbash.bash
chmod +x /usr/local/bin/wcinstaller.bash
chmod +x /usr/local/bin/wcinstallerbash.bash
chmod +x /usr/local/bin/wcios.bash
chmod +x /usr/local/bin/wciosbash.bash
chmod +x /usr/local/bin/wclist.bash
chmod +x /usr/local/bin/wclistbash.bash
chmod +x /usr/local/bin/wcopenplex.bash
chmod +x /usr/local/bin/wcopenplexbash.bash
chmod +x /usr/local/bin/websharing.bash
chmod +x /usr/local/bin/websharingbash.bash
chmod +x /usr/local/bin/who.bash
chmod +x /usr/local/bin/whobash.bash
chmod +x /usr/local/bin/wol.bash
chmod +x /usr/local/bin/xml.bash

if [ -s /Applications/PlexConnect/update/OSX/airplay.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/airplay.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/clt.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/clt.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/shairport.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/shairport.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/storefront.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/storefront.bash
fi
if [ -s /Applications/PlexConnect/update/OSX/PlexConnect.bash ]
then
chmod +x /Applications/PlexConnect/update/OSX/PlexConnect.bash
fi
if [ -s /usr/local/bin/uninstall.bash ]
then
chmod +x /usr/local/bin/uninstall.bash
fi

## Themes
chmod 4755 /usr/local/bin/cyberghost.bash
chmod 4755 /usr/local/bin/ibaa.bash
chmod 4755 /usr/local/bin/stoffez.bash
chmod 4755 /usr/local/bin/falco.bash
chmod 4755 /usr/local/bin/wahlmanj.bash

## PlexConnect Commands
chmod 4755 /usr/local/bin/appweb.bash
chmod 4755 /usr/local/bin/backupatvsettings.bash
chmod 4755 /usr/local/bin/restoreatvsettings.bash
chmod 4755 /usr/local/bin/backup.bash
chmod 4755 /usr/local/bin/restore.bash
chmod 4755 /usr/local/bin/loghigh.bash
chmod 4755 /usr/local/bin/lognormal.bash
chmod 4755 /usr/local/bin/updater.bash
chmod 4755 /usr/local/bin/start.bash
chmod 4755 /usr/local/bin/stop.bash
chmod 4755 /usr/local/bin/restart.bash
chmod 4755 /usr/local/bin/status.bash
chmod 4755 /usr/local/bin/updatewc.bash

## Hijacks
chmod 4755 /usr/local/bin/restorecerts.bash
chmod 4755 /usr/local/bin/removecerts.bash
chmod 4755 /usr/local/bin/createcert.bash
chmod 4755 /usr/local/bin/createimovie.bash
chmod 4755 /usr/local/bin/createwsj.bash

## PMS/OS X
chmod 4755 /usr/local/bin/pmsscan.bash
chmod 4755 /usr/local/bin/pms.bash
chmod 4755 /usr/local/bin/quitpms.bash
chmod 4755 /usr/local/bin/pmp.bash
chmod 4755 /usr/local/bin/quitpmp.bash
chmod 4755 /usr/local/bin/pht.bash
chmod 4755 /usr/local/bin/quitpht.bash
chmod 4755 /usr/local/bin/tv.bash
chmod 4755 /usr/local/bin/utorrent.bash
chmod 4755 /usr/local/bin/itunes.bash
chmod 4755 /usr/local/bin/quititunes.bash

## OS X
chmod 4755 /usr/local/bin/trash.bash
chmod 4755 /usr/local/bin/who.bash
chmod 4755 /usr/local/bin/whobash.bash
chmod 4755 /usr/local/bin/shutdown.bash
chmod 4755 /usr/local/bin/wake.bash
chmod 4755 /usr/local/bin/sleep.bash
chmod 4755 /usr/local/bin/lock.bash
chmod 4755 /usr/local/bin/reboot.bash


## Import LAN and WAN IP's into webconnect cgi files
plexwebbash.bash
plexwebwan.bash
plexwebios.bash
plexwebioswan.bash
plexweblist.bash
plexweblistwan.bash
wclist.bash
wcinstaller.bash
wcios.bash
wcdefault.bash
wcopenplex.bash

if [ -s /usr/local/bin/sudoers.bash ]
then
rm /usr/local/bin/sudoers.bash
fi

if [ -s /wclist.bash ]
then
rm /wclist.bash
fi

if [ -s /wcinstaller.bash ]
then
rm /wcinstaller.bash
fi

if [ -s /wcios.bash ]
then
rm /wcios.bash
fi

if [ -s /wcdefault.bash ]
then
rm /wcdefault.bash
fi

if [ -s /wcopenplex.bash ]
then
rm /wcopenplex.bash
fi

if [ -s /plexweb.bash ]
then
rm /plexweb.bash
fi

if [ -s /plexwebwan.bash ]
then
rm /plexwebwan.bash
fi

if [ -s /plexwebios.bash ]
then
rm /plexwebios.bash
fi

if [ -s /plexwebioswan.bash ]
then
rm /plexwebioswan.bash
fi

if [ -s /plexweblist.bash ]
then
rm /plexweblist.bash
fi

if [ -s /plexweblistwan.bash ]
then
rm /plexweblistwan.bash
fi

if [ -s /plexwebios.bash ]
then
rm /plexwebios.bash
fi

if [ -s /xml.bash ]
then
rm /xml.bash
fi

if [ -s /Applications/plexconnect_BACKUP ]
then
chmod -R 777 /Applications/plexconnect_BACKUP
fi

echo 'WebConnect has been updated. Refresh your browser if no icons appear.'
