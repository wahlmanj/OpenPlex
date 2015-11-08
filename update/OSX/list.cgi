#!/bin/sh
    echo "Content-type: text/html\n"

    # our html header
    echo "<html>"
    echo "<head><title>WebConnect</title></head>"
    echo "<font color=white><body bgcolor="#A9A9A9">"
    echo "<body>"

 # read in our parameters
    CMD=`echo "$QUERY_STRING" | sed -n 's/^.*cmd=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
    FOLDER=`echo "$QUERY_STRING" | sed -n 's/^.*folder=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"| sed "s/%2F/\//g"`
     FOLDER1=`echo "$QUERY_STRING" | sed -n 's/^.*folder1=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"| sed "s/%2F/\//g"`
FOLDER2=`echo "$QUERY_STRING" | sed -n 's/^.*folder2=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"| sed "s/%2F/\//g"`
     
    # test if any parameters were passed
    if [ $CMD ]
    then
      case "$CMD" in
          removecertsbash)
          echo "Output of removecertsbash :<pre>"
          /usr/local/bin/removecertsbash.bash
          echo "</pre>"
          ;;

          restorecertsbash)
          echo "Output of restorecertsbash :<pre>"
          /usr/local/bin/restorecertsbash.bash
          echo "</pre>"
          ;;

          createcertbash)
          echo "Output of createcertbash :<pre>"
          /usr/local/bin/createcertbash.bash
          echo "</pre>"
          ;;

          createimoviebash)
          echo "Output of createimoviebash :<pre>"
          /usr/local/bin/createimoviebash.bash
          echo "</pre>"
          ;;

          createwsjbash)
          echo "Output of createwsjbash :<pre>"
          /usr/local/bin/createwsjbash.bash
          echo "</pre>"
          ;;

          updaterbash)
          echo "Output of updaterbash :<pre>"
          /usr/local/bin/updaterbash.bash
          echo "</pre>"
          ;;

          startbash)
          echo "Output of startbash :<pre>"
          /usr/local/bin/startbash.bash
          echo "</pre>"
          ;;

          stopbash)
          echo "Output of stopbash :<pre>"
          /usr/local/bin/stopbash.bash
          echo "</pre>"
          ;;

          restartbash)
          echo "Output of restartbash :<pre>"
          /usr/local/bin/restartbash.bash
          echo "</pre>"
          ;;
          
          statusbash)
          echo "Output of statusbash :<pre>"
          /usr/local/bin/statusbash.bash
          echo "</pre>"
          ;;

          updatewcbash)
          echo "Output of updatewcbash :<pre>"
          /usr/local/bin/updatewcbash.bash
          echo "</pre>"
          ;;
          
          pmsscanbash)
          echo "Output of pmsscanbash :<pre>"
          /usr/local/bin/pmsscanbash.bash
          echo "</pre>"
          ;;

          rebootbash)
          echo "Output of rebootbash :<pre>"
          /usr/local/bin/rebootbash.bash
          echo "</pre>"
          ;;

          lockbash)
          echo "Output of lockbash :<pre>"
          /usr/local/bin/lockbash.bash
          echo "</pre>"
          ;;
          
          shutdownbash)
          echo "Output of shutdownbash :<pre>"
          /usr/local/bin/shutdownbash.bash
          echo "</pre>"
          ;;
          
          sleepbash)
          echo "Output of sleepbash :<pre>"
          /usr/local/bin/sleepbash.bash
          echo "</pre>"
          ;;

          itunesbash)
          echo "Output of itunesbash :<pre>"
          /usr/local/bin/itunesbash.bash
          echo "</pre>"
          ;;

          utorrentbash)
          echo "Output of utorrentbash :<pre>"
          /usr/local/bin/utorrentbash.bash
          echo "</pre>"
          ;;

          phtbash)
          echo "Output of phtbash :<pre>"
          /usr/local/bin/phtbash.bash
          echo "</pre>"
          ;;

          pmpbash)
          echo "Output of pmpbash :<pre>"
          /usr/local/bin/pmpbash.bash
          echo "</pre>"
          ;;

          pmsbash)
          echo "Output of pmsbash :<pre>"
          /usr/local/bin/pmsbash.bash
          echo "</pre>"
          ;;

          quititunesbash)
          echo "Output of quititunesbash :<pre>"
          /usr/local/bin/quititunesbash.bash
          echo "</pre>"
          ;;
          
          whobash)
          echo "Output of whobash :<pre>"
          /usr/local/bin/whobash.bash
          echo "</pre>"
          ;;
          
          who)
          echo "Output of who :<pre>"
          /usr/local/bin/who.bash
          echo "</pre>"
          ;;

          wakebash)
          echo "Output of wakebash :<pre>"
          /usr/local/bin/wakebash.bash
          echo "</pre>"
          ;;

          tvbash)
          echo "Output of tvbash :<pre>"
          /usr/local/bin/tvbash.bash
          echo "</pre>"
          ;;
          
          trashbash)
          echo "Output of trashbash :<pre>"
          /usr/local/bin/trashbash.bash
          echo "</pre>"
          ;;

          cyberghostbash)
          echo "Output of cyberghostbash :<pre>"
          /usr/local/bin/cyberghostbash.bash
          echo "</pre>"
          ;;

          falcobash)
          echo "Output of falcobash :<pre>"
          /usr/local/bin/falcobash.bash
          echo "</pre>"
          ;;

          ibaabash)
          echo "Output of ibaabash :<pre>"
          /usr/local/bin/ibaabash.bash
          echo "</pre>"
          ;;

          stoffezbash)
          echo "Output of stoffezbash :<pre>"
          /usr/local/bin/stoffezbash.bash
          echo "</pre>"
          ;;
          
          wahlmanjbash)
          echo "Output of wahlmanjbash :<pre>"
          /usr/local/bin/wahlmanjbash.bash
          echo "</pre>"
          ;;
          
          backupbash)
          echo "Output of backupbash :<pre>"
          /usr/local/bin/backupbash.bash
          echo "</pre>"
          ;;
          
          restorebash)
          echo "Output of restorebash :<pre>"
          /usr/local/bin/restorebash.bash
          echo "</pre>"
          ;;
          
          lognormalbash)
          echo "Output of lognormalbash :<pre>"
          /usr/local/bin/lognormalbash.bash
          echo "</pre>"
          ;;

          loghighbash)
          echo "Output of loghighbash :<pre>"
          /usr/local/bin/loghighbash.bash
          echo "</pre>"
          ;;
          
          appwebbash)
          echo "Output of appwebbash :<pre>"
          /usr/local/bin/appwebbash.bash
          echo "</pre>"
          ;;

          restoreatvsettingsbash)
          echo "Output of restoreatvsettingsbash :<pre>"
          /usr/local/bin/restoreatvsettingsbash.bash
          echo "</pre>"
          ;;

          backupatvsettingsbash)
          echo "Output of backupatvsettingsbash :<pre>"
          /usr/local/bin/backupatvsettingsbash.bash
          echo "</pre>"
          ;;

          quitpmsbash)
          echo "Output of quitpmsbash :<pre>"
          /usr/local/bin/quitpmsbash.bash
          echo "</pre>"
          ;;

          quitpmpbash)
          echo "Output of quitpmpbash :<pre>"
          /usr/local/bin/quitpmpbash.bash
          echo "</pre>"
          ;;

          quitphtbash)
          echo "Output of quitphtbash :<pre>"
          /usr/local/bin/quitphtbash.bash
          echo "</pre>"
          ;;

	esac
    fi

    # print out the form

    # page header
    echo "<p>"
    echo "<center>"
    echo "<h2>WebConnect</h2>"
    echo "</center>"
    echo "<p>"
    echo "<p>"
     
    echo "<center>"
    echo "<h2>Please choose your option below</h2>"
    echo "</center>"
    echo "<form method=get>"
    echo "<br>"
    echo "Choose/switch your theme:"
    echo "<br>"
    echo "<input type=radio name=cmd value=ibaabash> iBaa Theme <br>"
    echo "<input type=radio name=cmd value=cyberghostbash> CyberGhost84 Theme <br>"
    echo "<input type=radio name=cmd value=falcobash> Falco953 Theme <br>"
    echo "<input type=radio name=cmd value=stoffezbash> Stoffez Theme <br>"
    echo "<input type=radio name=cmd value=wahlmanjbash> Wahlmanj theme <br>"
    echo "<br>"
    echo "PlexConnect commands:"
    echo "<br>"
    echo "<input type=radio name=cmd value=appwebbash> Update OpenPlex <br>"
    echo "<input type=radio name=cmd value=backupatvsettingsbash> Backup ATVSettings.cfg <br>"
    echo "<input type=radio name=cmd value=restoreatvsettingsbash> Restore ATVSettings.cfg <br>"
    echo "<input type=radio name=cmd value=backupbash> Backup all settings <br>"
    echo "<input type=radio name=cmd value=restorebash> Restore all settings <br>"
    echo "<input type=radio name=cmd value=lognormalbash> Set loglevel to Normal <br>"
    echo "<input type=radio name=cmd value=loghighbash> Set loglevel to High <br>"
    echo "<input type=radio name=cmd value=updaterbash> Update PlexConnect <br>"
    echo "<input type=radio name=cmd value=startbash> Start PlexConnect <br>"
    echo "<input type=radio name=cmd value=stopbash> Stop PlexConnect <br>"
    echo "<input type=radio name=cmd value=restartbash> Restart PlexConnect <br>"
    echo "<input type=radio name=cmd value=statusbash> Status PlexConnect <br>"
    echo "<input type=radio name=cmd value=updatewcbash> Update WebConnect <br>"
    echo "<br>"
    echo "Cert/Hijack management:"
    echo "<br>"
    echo "<input type=radio name=cmd value=restorecertsbash> Restore Certs <br>"
    echo "<input type=radio name=cmd value=removecertsbash> Delete Certs <br>"
    echo "<input type=radio name=cmd value=createcertbash> Generate trailers Certs <br>"
    echo "<input type=radio name=cmd value=createimoviebash> Generate imovie Certs <br>"
    echo "<input type=radio name=cmd value=createwsjbash> Generate wsj Certs <br>"
    echo "<br>"
    echo "Plex Media Server/OSX App options:"
    echo "<br>"
    echo "<input type=radio name=cmd value=pmsscanbash> Update PMS Library <br>"
    echo "<input type=radio name=cmd value=pmsbash> Start Plex Media Server <br>"
    echo "<input type=radio name=cmd value=quitpmsbash> Quit Plex Media Server<br>"
    echo "<input type=radio name=cmd value=pmpbash> Start Plex Media Player <br>"
    echo "<input type=radio name=cmd value=quitpmpbash> Quit Plex Media Player<br>"
    echo "<input type=radio name=cmd value=phtbash> Start Plex Home Theater <br>"
    echo "<input type=radio name=cmd value=quitphtbash> Quit Plex Home Theater<br>"
    echo "<input type=radio name=cmd value=tvbash> Start TeamViewer <br>"
    echo "<input type=radio name=cmd value=utorrentbash> Start uTorrent <br>"
    echo "<input type=radio name=cmd value=itunesbash> Start iTunes <br>"
    echo "<input type=radio name=cmd value=quititunesbash> Quit iTunes <br>"
    echo "<br>"
    echo "<a href="__PLEXWEB__">PlexWebLan</a>&nbsp;&nbsp;&nbsp;<a href="__PLEXWEBWAN__">PlexWebWan</a>&nbsp;&nbsp;&nbsp;<a href="https://plex.tv">MyPlexSharing</a>&nbsp;&nbsp;&nbsp;<a href="https://itunes.apple.com/us/app/fing-network-scanner/id430921107?mt=8">WOL IOS APP</a>"
    echo "</p>"
    echo "OSX system commands:"
    echo "<br>"
    echo "<input type=radio name=cmd value=rebootbash> Reboot OSX <br>"
    echo "<input type=radio name=cmd value=lockbash> Lock Screen <br>"
    echo "<input type=radio name=cmd value=sleepbash> Sleep OSX <br>"
    echo "<input type=radio name=cmd value=shutdownbash> Shutdown OSX <br>"    
    echo "<input type=radio name=cmd value=whobash> Who Am I root <br>"
    echo "<input type=radio name=cmd value=who> Who Am I web <br>"
    echo "<input type=radio name=cmd value=wakebash> Wake Reason <br>"
    echo "<input type=radio name=cmd value=trashbash> Empty Trash Can<br>"
    echo "<br>"
    echo "<input type=submit>"
    echo "<br>"
    echo "</form>"
    echo "</body>"
    echo "</html>"
