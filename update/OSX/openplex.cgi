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

          createplistbash)
          echo "Output of createplistbash :<pre>"
          /usr/local/bin/createplistbash.bash
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

          quititunesbash)
          echo "Output of quititunesbash :<pre>"
          /usr/local/bin/quititunesbash.bash
          echo "</pre>"
          ;;

          logbash)
          echo "Output of logbash :<pre>"
          /usr/local/bin/logbash.bash
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
          
          appwebbash)
          echo "Output of appwebbash :<pre>"
          /usr/local/bin/appwebbash.bash
          echo "</pre>"
          ;;

	esac
    fi
     
    # print out the form
     
    # page header
    echo "<form method=get>"
    echo "<br>"
    echo "<p>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src="https://raw.githubusercontent.com/wahlmanj/OpenPlex/master/WebconnectHD/OPLogo.png" name=cmd title= Update_WebConnect value=updatewcbash>"
    echo "<br>"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" img src="https://raw.githubusercontent.com/wahlmanj/OpenPlex/master/WebconnectHD/startplex.png" name=cmd title=Start_PlexConnect value=startbash>&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" src="https://raw.githubusercontent.com/wahlmanj/OpenPlex/master/WebconnectHD/stopplex.png" name=cmd title= Stop_PlexConnect value=stopbash>&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" img src="https://raw.githubusercontent.com/wahlmanj/OpenPlex/master/WebconnectHD/update.png" name=cmd title= Update_PlexConnect value=updaterbash>"
    echo "<p>"
    echo "<p>"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Choose/switch your theme:"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=ibaabash> Clone iBaa GitHub <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=cyberghostbash> Clone CyberGhost84 GitHub <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=falcobash> Clone Falco953 GitHub <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=stoffezbash> Clone Stoffez GitHub <br>"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OpenPlex commands:"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=appwebbash> Update OpenPlex <br>"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cert/Hijack management:"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=restorecertsbash> Restore Certs <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=removecertsbash> Delete Certs <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=createcertbash> Generate trailers Certs <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=createimoviebash> Generate imovie Certs <br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name=cmd value=createwsjbash> Generate wsj Certs <br>"
    echo "<br>"
    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit>"
    echo "<br>"
    echo "</form>"
    echo "</body>"
    echo "</html>"
