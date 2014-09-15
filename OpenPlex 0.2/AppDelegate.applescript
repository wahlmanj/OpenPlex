--
--  AppDelegate.applescript
--  OpenPlex 0.2.8
--
--  Originally designed by iCyberGhost on 5/02/14.
--  Originally coded by Wahlman.j on 5/02/14.
--  Copyright (c) 2014 CyberGhost & Wahlman.j. All rights reserved.
--  myProgressBar's incrementBy_(20)

script AppDelegate
    property parent : class "NSObject"
    
    property aNotifcation:missing value
    
    property advancedProgressBar : missing value
    
    property codeProgressBar : missing value
    
    property WCProgressBar : missing value
    
    property trailersProgressBar : missing value
    
    property imovieProgressBar : missing value
    
    property wsjProgressBar : missing value
    
    property baaProgressBar : missing value
    
    property ghostProgressBar : missing value
    
    property brotuserProgressBar : missing value
    
    property wahlmanjProgressBar : missing value
    
    property stoffezProgressBar : missing value
    
    property falcoProgressBar : missing value

    property theNext : ""
    
    property theNetwork : ""
    
    property theRouter : ""
    
    property theLocalNode : ""



--scripts


    on buttonhandlernewuserinstaller_(sender)
        tell codeProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "echo install present"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                else if not (exists folder "Applications:PlexConnect" of the startup disk) then
                do shell script "echo install not present"
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        end try
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "sudoers.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
        do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
        do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
        do shell script "rm -R /Applications/PlexConnect"
        set theURL to "http://sourceforge.net/projects/git-osx-installer/files/git-1.9.0-intel-universal-snow-leopard.dmg/download?use_mirror=autoselect"
        tell application "Safari" to make new document with properties {URL:theURL}
        display notification "Git has been downloaded install the git dmg" with title "OpenPlex Status"
        delay 7
        display notification "No Theme Installed..." with title "PlexConnect Status"
        tell codeProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlernewuserinstaller_
    
    on buttonhandlerip_(sender)
        try
            set myTemp to do shell script "mktemp -t txt"
            do shell script "curl -s http://checkip.dyndns.org &> " & myTemp & " &2> /dev/null"
            
            # CHANGE THE DELAY HERE…
            delay 3
            set extIP to do shell script "sed 's/[a-zA-Z/<> :]//g' " & myTemp
            
            if extIP = "" then
                set my theNetwork to "No connection"
                else if extIP contains "=" then
                set theNetwork to "Can't get IP"
                else
                set theNetwork to extIP
            end if
            on error
            set theNetwork to "No connection"
        end try
        
        try
            set oldDelims to AppleScript's text item delimiters
            set AppleScript's text item delimiters to "gateway:"
            set theGateway to do shell script "route get default | grep gateway"
            set AppleScript's text item delimiters to oldDelims
            set theRouter to the last word of theGateway
            on error
            set my theRouter to "No connection"
        end try
        
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        
        display notification  theLocalNode with title "Mac IP Address"
        
        repeat
            try
                getRouter()
                getIP()
                getLocalNode()
                userInfo()
                if result = "Try Again" then
                    getIP()
                    else if theNext = "Copy" then
                    
                    getCopyItem()
                    exit repeat
                    
                end if
                
                on error
                exit repeat
            end try
        end repeat
    end buttonhandlerip_
    
    on buttonhandlerSSL_(sender)
        try
            set myTemp to do shell script "mktemp -t txt"
            do shell script "curl -s http://checkip.dyndns.org &> " & myTemp & " &2> /dev/null"
            
            # CHANGE THE DELAY HERE…
            delay 3
            set extIP to do shell script "sed 's/[a-zA-Z/<> :]//g' " & myTemp
            
            if extIP = "" then
                set my theNetwork to "No connection"
                else if extIP contains "=" then
                set theNetwork to "Can't get IP"
                else
                set theNetwork to extIP
            end if
            on error
            set theNetwork to "No connection"
        end try
        
        try
            set oldDelims to AppleScript's text item delimiters
            set AppleScript's text item delimiters to "gateway:"
            set theGateway to do shell script "route get default | grep gateway"
            set AppleScript's text item delimiters to oldDelims
            set theRouter to the last word of theGateway
            on error
            set my theRouter to "No connection"
        end try
        
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        
        display notification  theLocalNode & "/trailer.cer" with title "Cert URL"
        
        repeat
            try
                getRouter()
                getIP()
                getLocalNode()
                userInfo()
                if result = "Try Again" then
                    getIP()
                    else if theNext = "Copy" then
                    
                    getCopyItem()
                    exit repeat
                    
                end if
                
                on error
                exit repeat
            end try
        end repeat
    end buttonhandlerSSL_
    
    on buttonhandleruas_(sender)
        tell advancedProgressBar to startAnimation:me -- another way
        set animated to true
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin export PATH; cd " & theFolder & "; git clone https://github.com/mikedm139/UnSupportedAppstore.bundle.git; git clone https://github.com/wahlmanj/unsupported.git"
        end try
        do shell script "chmod +x /applications/unsupported/unsupported.bash" with administrator privileges
        do shell script "/applications/unsupported/unsupported.bash" with administrator privileges
        do shell script "unsupported2.bash"
        do shell script "chmod +x /applications/unsupported/copy.bash" with administrator privileges
        do shell script "/applications/unsupported/copy.bash" with administrator privileges
        display notification "Unsupported AppStore installed..." with title "UAS Status"
        tell advancedProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandleruas_
    
    on buttonhandlerupdatecode_(sender)
        tell codeProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                do shell script "updatewcbash.bash"
                else if not (exists folder "Applications:PlexConnect" of the startup disk) then
                display notification "Theme Required to update..." with title "Code Status"
            end if
        end tell
        do shell script "checkerbash.bash"
        tell codeProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerupdatecode_
    
    on buttonhandlerupdatewccode_(sender)
        tell WCProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "updatewcbash.bash"
        tell WCProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerupdatewccode_
    
    on buttonhandlerforum_(sender)
        set theURL to "https://forums.plex.tv/index.php/forum/136-appletv-plexconnect/"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerforum_
    
    on buttonhandlerwiki_(sender)
        set theURL to "https://github.com/iBaa/PlexConnect/wiki"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerwiki_
    
    on buttonhandlerroadmap_(sender)
        set theURL to "https://github.com/iBaa/PlexConnect/wiki/Roadmap"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerroadmap_
    
    on buttonhandlerdelcerts_(sender)
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.pem"
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.key"
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.cer"
    end buttonhandlerdelcerts_
    
    on buttonhandlerdellog_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "modbash.bash"
                do shell script "rm /Applications/PlexConnect/plexconnect.log"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Log Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerdellog_
    
    on buttonhandlertrailers_(sender)
        tell trailersProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "modbash.bash"
                do shell script "createcertbash.bash"
                delay 4
                do shell script "createplistbash.bash"
                delay 6
                do shell script "stopbash.bash"
                delay 4
                do shell script "createcertbash.bash"
                delay 4
                do shell script "startbash.bash"
                delay 4
                do shell script "createcertbash.bash"
                delay 4
                do shell script "restartbash.bash"
                do shell script "checkerbash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "Theme Required to hijack..." with title "Hijack Status"
            end if
        end tell
        tell trailersProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlertrailers_
    
    on buttonhandlerimovie_(sender)
        tell imovieProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "modbash.bash"
                do shell script "createimoviebash.bash"
                delay 4
                do shell script "createplistbash.bash"
                delay 6
                do shell script "stopbash.bash"
                delay 4
                do shell script "createimoviebash.bash"
                delay 4
                do shell script "startbash.bash"
                delay 4
                do shell script "createimoviebash.bash"
                delay 4
                do shell script "restartbash.bash"
                do shell script "checkerbash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "Theme Required to hijack..." with title "Hijack Status"
            end if
        end tell
        tell imovieProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerimovie_
    
    on buttonhandlerwsj_(sender)
        tell wsjProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "modbash.bash"
                do shell script "createwsjbash.bash"
                delay 4
                do shell script "createplistbash.bash"
                delay 6
                do shell script "stopbash.bash"
                delay 4
                do shell script "createwsjbash.bash"
                delay 4
                do shell script "startbash.bash"
                delay 4
                do shell script "createwsjbash.bash"
                delay 4
                do shell script "restartbash.bash"
                do shell script "checkerbash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "Theme Required to hijack..." with title "Hijack Status"
            end if
        end tell
        tell wsjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwsj_
    
    on buttonhandlerupdate_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "updatebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerupdate_
    
    on buttonhandlerrestart_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "restartbash.bash"
                delay 2
                do shell script "checkerbash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerrestart_
    
    on buttonhandlerautoupdate_(sender)
        do shell script "createautobash.bash"
    end buttonhandlerautoupdate_
    
    on buttonhandlerstop_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "stopbash.bash"
                delay 4
                do shell script "checkerbash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerstop_
    
    on buttonhandlerstart_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "startbash.bash"
                delay 4
                do shell script "checkerbash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerstart_
    
    on buttonhandlerchecker_(sender)
        do shell script "checkerbash.bash"
    end buttonhandlerchecker_
    
    on buttonhandlerquitconsole_(sender)
        do shell script "quit Console"
    end buttonhandlerquitconsole_
    
    on buttonhandleruninstall_(sender)
        do shell script "uninstallbash.bash"
    end buttonhandleruninstall_
    
    on buttonhandlerinstallwc_(sender)
        do shell script "webconnectbash.bash"
        do shell script "websharingbash.bash"
    end buttonhandlerinstallwc_
    
    on buttonhandlerupdateoc_(sender)
        tell codeProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "10.6bash.bash"
        do shell script "quit.bash"
    end buttonhandlerupdateoc_
    
    on buttonhandlerclt_(sender)
        set theURL to "https://www.dropbox.com/sh/4ebx2bmx7ca6c0h/AAA2diPOo3wsdWJK6OM74wida"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerclt_
    
    on buttonhandlerdefaultwc_(sender)
        set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
        set tURL to "http://" & tIP & ":1234/cgi-bin/bash.cgi"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerdefaultwc_
    
    on buttonhandlerlaunchwcios_(sender)
        set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
        set tURL to "http://" & tIP & ":1234/cgi-bin/ios.cgi"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerlaunchwcios_
    
    on buttonhandlerlaunchwclist_(sender)
        set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
        set tURL to "http://" & tIP & ":1234/cgi-bin/list.cgi"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerlaunchwclist_
    
    on buttonhandlerlaunchwcinstaller_(sender)
        set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
        set tURL to "http://" & tIP & ":1234/cgi-bin/installer.cgi"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerlaunchwcinstaller_
    
    on buttonhandlerlog_(sender)
        do shell script "open /Applications/PlexConnect/PlexConnect.log"
    end buttonhandlerlog_
    
    on buttonhandleropenbase_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
        do shell script "open /Applications/PlexConnect"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandleropenbase_
    
    on buttonhandlerguide_(sender)
        set theURL to "https://github.com/iBaa/PlexConnect/wiki/Install-Guide-Certificate-via-Ethernet"
        tell application "Safari" to make new document with properties {URL:theURL}
        set theURL to "https://github.com/iBaa/PlexConnect/wiki/Install-Guide-AppleTV-Ethernet#wiki-install-the-certificate-to-your-appletv"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerguide_
    
    on buttonhandlertrash_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                do shell script "stopbash.bash"
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlertrash_
    
    on buttonhandlerfixplists_(sender)
        do shell script "auto.bash" with administrator privileges
    end buttonhandlerfixplists_
    
    on buttonhandlercertfolder_(sender)
        do shell script "folder.bash"
    end buttonhandlercertfolder_
    
    on buttonhandlerplexicon_(sender)
        tell advancedProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        tell advancedProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerplexicon_
    
    on buttonhandlerpillowinstaller_(sender)
        do shell script "quit Terminal"
        delay 2
        tell application "Terminal"
            activate
            activate
            activate
            tell application "System Events" to keystroke "pillow.bash"
            tell application "System Events" to keystroke return
        end tell
    end buttonhandlerpillowinstaller_
    
    on buttonhandlerstorefront_(sender)
        do shell script "/Applications/PlexConnect/update/OSX/storefront.bash"
        do shell script "open /Applications/PlexConnect/update/OSX/storeFront"
    end buttonhandlerstorefront_
    
    on buttonhandlersettingscfg_(sender)
        do shell script "open /Applications/PlexConnect/settings.cfg"
    end buttonhandlersettingscfg_
    
    on buttonhandlerloadcerts_(sender)
        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
    end buttonhandlerloadcerts_
    
    on buttonhandlerbackupsettings_(sender)
        do shell script "cp /Applications/PlexConnect/settings.cfg /Applications/plexconnect_BACKUP"
    end buttonhandlerbackupsettings_
    
    on buttonhandlerloadsettings_(sender)
        do shell script "cp /Applications/plexconnect_BACKUP/settings.cfg /Applications/PlexConnect"
    end buttonhandlerloadsettings_
    
    on buttonhandlerbackupfanart_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect_BACKUP:fanartcache" of the startup disk) then
                do shell script "rm -R /Applications/plexconnect_BACKUP/fanartcache"
                do shell script "mkdir /Applications/plexconnect_BACKUP/fanartcache"
                do shell script "cp -R /Applications/PlexConnect/assets/fanartcache/* /Applications/plexconnect_BACKUP/fanartcache"
                else if not (exists folder "Applications:PlexConnect_BACKUP:fanartcache" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP/fanartcache"
                    do shell script "cp -R /Applications/PlexConnect/assets/fanartcache/* /Applications/plexconnect_BACKUP/fanartcache"
                    onerror
                end try
            end if
        end tell
    end buttonhandlerbackupfanart_
    
    on buttonhandlerloadbackupfanart_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
                do shell script "cp -R /Applications/plexconnect_BACKUP/fanartcache/* /Applications/PlexConnect/assets/fanartcache"
                else if not (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
                do shell script "echo not present"
            end if
        end tell
    end buttonhandlerloadbackupfanart_
    
    
    on buttonhandlerbackupicons_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect_BACKUP:flow" of the startup disk) then
                do shell script "cp -R /Applications/PlexConnect/assets/templates/plex/images/custom/flow/* /Applications/plexconnect_BACKUP/flow"
                do shell script "cp -R /Applications/PlexConnect/assets/templates/plex/images/custom/top/* /Applications/plexconnect_BACKUP/top"
                else if not (exists folder "Applications:PlexConnect_BACKUP:flow" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP/top"
                    do shell script "mkdir /Applications/plexconnect_BACKUP/flow"
                    do shell script "cp -R /Applications/PlexConnect/assets/templates/plex/images/custom/flow/* /Applications/plexconnect_BACKUP/flow"
                    do shell script "cp -R /Applications/PlexConnect/assets/templates/plex/images/custom/top/* /Applications/plexconnect_BACKUP/top"
                    onerror
                end try
            end if
        end tell
    end buttonhandlerbackupicons_
    
    on buttonhandlerloadicons_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:assets:templates:plex:images:custom:flow" of the startup disk) then
                do shell script "cp -R /Applications/plexconnect_BACKUP/flow/* /Applications/PlexConnect/assets/templates/plex/images/custom/flow"
                do shell script "cp -R /Applications/plexconnect_BACKUP/top/* /Applications/PlexConnect/assets/templates/plex/images/custom/top"
                else if not (exists folder "Applications:PlexConnect:assets:templates:plex:images:custom:flow" of the startup disk) then
                do shell script "echo not present"
            end if
        end tell
    end buttonhandlerloadicons_
    
    on buttonhandlercustomplist_(sender)
        try
            do shell script "mkdir /Applications/onlytemp"
            set myFolder to "/Applications/onlytemp"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/start.bash" with administrator privileges
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/stop.bash" with administrator privileges
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/startbash.bash" with administrator privileges
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/stopbash.bash" with administrator privileges
            do shell script "chmod 4755 /Applications/onlytemp/PlexConnect/update/OSX/start.bash" with administrator privileges
            do shell script "chmod 4755 /Applications/onlytemp/PlexConnect/update/OSX/stop.bash" with administrator privileges
            do shell script "chmod 4755 /Applications/onlytemp/PlexConnect/update/OSX/startbash.bash" with administrator privileges
            do shell script "chmod 4755 /Applications/onlytemp/PlexConnect/update/OSX/stopbash.bash" with administrator privileges
            do shell script "cp /Applications/onlytemp/PlexConnect/update/OSX/start.bash /usr/bin" with administrator privileges
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/stop.bash /usr/bin" with administrator privileges
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/startbash.bash /usr/bin" with administrator privileges
            do shell script "chmod +x /Applications/onlytemp/PlexConnect/update/OSX/stopbash.bash /usr/bin" with administrator privileges
            delay 2
            do shell script "rm -R /Applications/onlytemp"
            onerror
        end try
    end buttonhandlercustomplist_
    
    on buttonhandlerbackupall_(sender)
        tell advancedProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "backupbash.bash"
        do shell script "modbash.bash"
        tell advancedProgressBar to stopAnimation:me -- another way
        set animated to false
        do shell script "checkerbash.bash"
    end buttonhandlerbackupall_
    
    on buttonhandlerrestoreall_(sender)
        tell advancedProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "modbash.bash"
        do shell script "restorebash.bash"
        tell advancedProgressBar to stopAnimation:me -- another way
        set animated to false
        do shell script "checkerbash.bash"
    end buttonhandlerrestoreall_
    
    on buttonhandlerbackupcerts_(sender)
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.cer /Applications/plexconnect_BACKUP"
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.pem /Applications/plexconnect_BACKUP"
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.key /Applications/plexconnect_BACKUP"
    end buttonhandlerbackupcerts_
    
    on buttonhandlerbrew_(sender)
        set msgDate to "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
        set quotedmsgDate to "\"" & msgDate & "\"" as string
        do shell script "echo ruby -e " & quoted form of quotedmsgDate & " >> /" & "brew.bash" with administrator privileges
        do shell script "cp /brew.bash /usr/bin" with administrator privileges
        do shell script "chmod +x /usr/bin/brew.bash" with administrator privileges
        tell application "Terminal"
            activate
            activate
            tell application "System Events" to keystroke "brew.bash"
            tell application "System Events" to keystroke return
            tell application "System Events" to keystroke return
        end tell
        delay 5
        do shell script "rm /usr/bin/brew.bash" with administrator privileges
        do shell script "rm /brew.bash" with administrator privileges
    end buttonhandlerbrew_
    
    on buttonhandlerclone_(sender)
        tell baaProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists folder "Applications:onlytemp" of the startup disk) then
                do shell script "rm -R /Applications/onlytemp"
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/iBaa/PlexConnect.git"
        end try
        do shell script "mkdir /Applications/onlytemp"
        set myFolder to "/Applications/onlytemp"
        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/PlexConnect/update/OSX"
        do shell script "mkdir /Applications/PlexConnect/update/OSX"
        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/onlytemp"
        do shell script "installbash.bash"
        do shell script "checkerbash.bash"
        tell baaProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerclone_
    
    on buttonhandlerfalco_(sender)
        tell falcoProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists folder "Applications:onlytemp" of the startup disk) then
                do shell script "rm -R /Applications/onlytemp"
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/falco953/PlexConnect.git"
        end try
        do shell script "mkdir /Applications/onlytemp"
        set myFolder to "/Applications/onlytemp"
        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/PlexConnect/update/OSX"
        do shell script "mkdir /Applications/PlexConnect/update/OSX"
        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/onlytemp"
        do shell script "installbash.bash"
        do shell script "checkerbash.bash"
        tell falcoProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerfalco_
    
    on buttonhandlerstoffez_(sender)
        tell stoffezProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists folder "Applications:onlytemp" of the startup disk) then
                do shell script "rm -R /Applications/onlytemp"
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/stoffez/PlexConnect.git"
        end try
        do shell script "mkdir /Applications/onlytemp"
        set myFolder to "/Applications/onlytemp"
        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/PlexConnect/update/OSX"
        do shell script "mkdir /Applications/PlexConnect/update/OSX"
        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/onlytemp"
        do shell script "installbash.bash"
        do shell script "checkerbash.bash"
        tell stoffezProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerstoffez_
    
    on buttonhandlerghost_(sender)
        tell ghostProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists folder "Applications:onlytemp" of the startup disk) then
                do shell script "rm -R /Applications/onlytemp"
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/CyberGhost84/PlexConnect.git"
        end try
        do shell script "mkdir /Applications/onlytemp"
        set myFolder to "/Applications/onlytemp"
        do shell script "mkdir -p /Applications/Plexconnect/update/OSX"
        do shell script "rm -R /Applications/PlexConnect/update/OSX"
        do shell script "mkdir /Applications/PlexConnect/update/OSX"
        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/onlytemp"
        do shell script "installbash.bash"
        do shell script "checkerbash.bash"
        tell ghostProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerghost_
    
    on buttonhandlerbrotuser_(sender)
        tell brotuserProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        tell application "Finder"
            if (exists folder "Applications:onlytemp" of the startup disk) then
                do shell script "rm -R /Applications/onlytemp"
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/brotuser/PlexConnect.git"
        end try
        do shell script "mkdir /Applications/onlytemp"
        set myFolder to "/Applications/onlytemp"
        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/PlexConnect/update/OSX"
        do shell script "mkdir /Applications/PlexConnect/update/OSX"
        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
        do shell script "rm -R /Applications/onlytemp"
        do shell script "installbash.bash"
        do shell script "checkerbash.bash"
        tell brotuserProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerbrotuser_
    
    on buttonhandlerwahlmanj_(sender)
        tell wahlmanjProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                    do shell script "rm -R /Applications/PlexConnect"
                    onerror
                end try
            end if
        end tell
        try
            set theFolder to "/Applications"
            do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & theFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
        end try
        do shell script "installphpbash.bash"
        do shell script "websharing.bash"
        do shell script "checkerbash.bash"
        tell wahlmanjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwahlmanj_
    
    on buttonhandlerdonate_(sender)
        set theURL to "http://alturl.com/5js9g"
        tell application "Safari" to make new document with properties {URL:theURL}
        set theURL to "http://alturl.com/j8xdb"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerdonate_
    
    --scripts
    
    on applicationWillFinishLaunching_(aNotification)
        -- Insert code here to initialize your application before any files are opened
    end applicationWillFinishLaunching_
    
    on applicationShouldTerminate_(sender)
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate_
    
end script
