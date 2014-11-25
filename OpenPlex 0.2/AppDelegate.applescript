--
--  AppDelegate.applescript
--  OpenPlex 0.3.5
--
--  Originally designed by iCyberGhost on 5/02/14.
--  Originally coded by Wahlman.j on 5/02/14.
--  Copyright (c) 2014 CyberGhost & Wahlman.j. All rights reserved.
--  myProgressBar's incrementBy_(20)

script AppDelegate
    property parent : class "NSObject"
    
    property aNotifcation:missing value
    
    property advancedProgressBar : missing value
    
    property extraProgressBar : missing value
    
    property appupdateProgressBar : missing value
    
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
    
    property iconProgressBar : missing value

    property theNext : ""
    
    property theNetwork : ""
    
    property theRouter : ""
    
    property theLocalNode : ""
    
    --Menubar
    
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
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        do shell script "echo install present"
                        else
                        display notification "No Theme Installed..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        else
                        do shell script ""
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        else
                        display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
                    end if
                end tell

                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerrestart_
    
    on buttonhandlerstop_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "stopbash.bash"
                delay 4
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        do shell script "echo install present"
                        else
                        display notification "No Theme Installed..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        else
                        do shell script ""
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        else
                        display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
                    end if
                end tell

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
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        do shell script "echo install present"
                        else
                        display notification "No Theme Installed..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        else
                        do shell script ""
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        else
                        display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
                    end if
                end tell

                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerstart_
    
    on buttonhandlerchecker_(sender)
do shell script "checkerbash.bash"
            end buttonhandlerchecker_
    
    on buttonhandlernewchecker_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                do shell script "echo install present"
                else
                display notification "No Theme Installed..." with title "PlexConnect Status"
            end if
        end tell
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                else
                do shell script ""
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try

        tell application "Finder"
            if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                else
                display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
            end if
        end tell
    end buttonhandlernewchecker_
    
    on buttonhandleruninstall_(sender)
        do shell script "uninstallbash.bash"
    end buttonhandleruninstall_
    
    on buttonhandlernewupdateoc_(sender)
        tell appupdateProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
        if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
            tell application "Finder"
                if (exists folder "Applications:OpenPlex" of the startup disk) then
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd /Applications/OpenPlex; git fetch; git merge origin"
                    try
                        if (exists file "Applications:OpenPlex.app" of the startup disk) then
                            do shell script "cd /Applications; rm -R OpenPlex.app"
                            else
                            do shell script ""
                        end if
                        do shell script "cd /Applications/OpenPlex/10.6; ditto -xk OpenPlex.zip /Applications/OpenPlex/10.6"
                        do shell script "cd /Applications/OpenPlex/10.6; cp -R OpenPlex.app /Applications; rm -R OpenPlex.app"
                    end try
                    do shell script "quit.bash"
                    else if not (exists folder "Applications:OpenPlex" of the startup disk) then
                    try
                        if (exists file "Applications:OpenPlex.app" of the startup disk) then
                            do shell script "cd /Applications; rm -R OpenPlex.app"
                            else
                            do shell script ""
                        end if
                        set myFolder to "/Applications"
                        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/OpenPlex.git; cd /Applications/OpenPlex/10.6; ditto -xk OpenPlex.zip /Applications/OpenPlex/10.6"
                        do shell script "cd /Applications/OpenPlex/10.6; cp -R OpenPlex.app /Applications; rm -R OpenPlex.app"
                        tell appupdateProgressBar to stopAnimation:me -- another way
                        set animated to false
                    end try
                end if
            end tell
            else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
            display notification "No Theme Installed..." with title "PlexConnect Status"
        end if
        end tell
        
     end buttonhandlernewupdateoc_
    
    on buttonhandlerupdateoc_(sender)
        tell appupdateProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "10.6bash.bash"
        do shell script "quit.bash"
    end buttonhandlerupdateoc_
    
    on buttonhandlerloginon_(sender)
        tell application "System Events" to make login item at end with properties {path:"/Applications/OpenPlex.app", hidden:false}
    end buttonhandlerloginon_
    
    on buttonhandlerloginoff_(sender)
        tell application "System Events" to delete login item "OpenPlex"
    end buttonhandlerloginoff_
    
    on buttonhandlerlog_(sender)
        do shell script "open /Applications/PlexConnect/PlexConnect.log"
    end buttonhandlerlog_

  --Settings Tab

    on buttonhandlernewuserinstaller_(sender)
        tell codeProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "usr:local:git" of the startup disk) then
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
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "echo install not present"
                        end if
                    end tell
                    set myFolder to "/Applications"
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                end try
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
                do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
                delay 7
                do shell script "rm -R /Applications/PlexConnect"
                display notification "No Theme Installed..." with title "PlexConnect Status"
                else if not (exists folder "usr:local:git" of the startup disk) then
                do shell script "cd /Applications; curl -O http://193.1.193.64/disk1/download.sourceforge.net/pub/sourceforge/g/gi/git-osx-installer/git-2.0.1-intel-universal-snow-leopard.dmg; hdiutil attach /Applications/git-2.0.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.0.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.0.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal" with administrator privileges
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
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "echo install not present"
                        end if
                    end tell
                    set myFolder to "/Applications"
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                end try
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
                do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
                delay 7
                do shell script "rm -R /Applications/PlexConnect"
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                display notification "No Theme Installed..." with title "PlexConnect Status"
            end if
        end tell
        tell codeProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlernewuserinstaller_
    
    --Theme Tab
    
    on buttonhandlerclt_(sender)
        set theURL to "https://www.dropbox.com/sh/4ebx2bmx7ca6c0h/AAA2diPOo3wsdWJK6OM74wida"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerclt_
    
    on buttonhandlerclone_(sender)
        tell baaProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        tell application "Finder"
                            try
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    onerror
                                end if
                            end try
                        end tell
                        delay 4
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
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                        
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
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
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                tell application "Finder"
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.dmg"
                        else
                        do shell script ""
                    end if
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.pkg"
                        else
                        do shell script ""
                    end if
                end tell
                do shell script "cd /Applications; curl -O http://193.1.193.64/disk1/download.sourceforge.net/pub/sourceforge/g/gi/git-osx-installer/git-2.0.1-intel-universal-snow-leopard.dmg; hdiutil attach /Applications/git-2.0.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.0.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.0.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal" with administrator privileges
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
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "echo install not present"
                        end if
                    end tell
                    set myFolder to "/Applications"
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                end try
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
                do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
                delay 7
                do shell script "rm -R /Applications/PlexConnect"
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                display notification "Installing theme..." with title "PlexConnect Status"
                tell application "Finder"
                    try
                        if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            do shell script "stopbash.bash"
                            else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            onerror
                        end if
                    end try
                end tell
                delay 4
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
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell baaProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerclone_
    
    on buttonhandlerfalco_(sender)
        tell falcoProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        tell application "Finder"
                            try
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    onerror
                                end if
                            end try
                        end tell
                        delay 4
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
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                        
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
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
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                tell application "Finder"
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.dmg"
                        else
                        do shell script ""
                    end if
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.pkg"
                        else
                        do shell script ""
                    end if
                end tell
                do shell script "cd /Applications; curl -O http://193.1.193.64/disk1/download.sourceforge.net/pub/sourceforge/g/gi/git-osx-installer/git-2.0.1-intel-universal-snow-leopard.dmg; hdiutil attach /Applications/git-2.0.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.0.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.0.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal" with administrator privileges
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
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "echo install not present"
                        end if
                    end tell
                    set myFolder to "/Applications"
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                end try
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
                do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
                delay 7
                do shell script "rm -R /Applications/PlexConnect"
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                display notification "Installing theme..." with title "PlexConnect Status"
                tell application "Finder"
                    try
                        if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            do shell script "stopbash.bash"
                            else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            onerror
                        end if
                    end try
                end tell
                delay 4
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
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell falcoProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerfalco_
    
    on buttonhandlerstoffez_(sender)
        tell stoffezProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        tell application "Finder"
                            try
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    onerror
                                end if
                            end try
                        end tell
                        delay 4
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
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                        
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
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
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                tell application "Finder"
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.dmg"
                        else
                        do shell script ""
                    end if
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.pkg"
                        else
                        do shell script ""
                    end if
                end tell
                do shell script "cd /Applications; curl -O http://193.1.193.64/disk1/download.sourceforge.net/pub/sourceforge/g/gi/git-osx-installer/git-2.0.1-intel-universal-snow-leopard.dmg; hdiutil attach /Applications/git-2.0.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.0.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.0.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal" with administrator privileges
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
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "echo install not present"
                        end if
                    end tell
                    set myFolder to "/Applications"
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                end try
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
                do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
                delay 7
                do shell script "rm -R /Applications/PlexConnect"
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                display notification "Installing theme..." with title "PlexConnect Status"
                tell application "Finder"
                    try
                        if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            do shell script "stopbash.bash"
                            else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            onerror
                        end if
                    end try
                end tell
                delay 4
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
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell stoffezProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerstoffez_
    
    on buttonhandlerghost_(sender)
        tell ghostProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        tell application "Finder"
                            try
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    onerror
                                end if
                            end try
                        end tell
                        delay 4
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
                        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/PlexConnect/update/OSX"
                        do shell script "mkdir /Applications/PlexConnect/update/OSX"
                        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/onlytemp"
                        do shell script "installbash.bash"
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                        
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
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
                        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/PlexConnect/update/OSX"
                        do shell script "mkdir /Applications/PlexConnect/update/OSX"
                        do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/onlytemp"
                        do shell script "installbash.bash"
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                tell application "Finder"
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.dmg"
                        else
                        do shell script ""
                    end if
                    if (exists file "Applications:git-2.0.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.0.1-intel-universal-snow-leopard.pkg"
                        else
                        do shell script ""
                    end if
                end tell
                do shell script "cd /Applications; curl -O http://193.1.193.64/disk1/download.sourceforge.net/pub/sourceforge/g/gi/git-osx-installer/git-2.0.1-intel-universal-snow-leopard.dmg; hdiutil attach /Applications/git-2.0.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.0.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.0.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.0.1\\ Snow\\ Leopard\\ Intel\\ Universal" with administrator privileges
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
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "echo install not present"
                        end if
                    end tell
                    set myFolder to "/Applications"
                    do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                end try
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "cp /Applications/Plexconnect/update/OSX/fixuser.bash /usr/bin" with administrator privileges
                do shell script "chmod +x /usr/bin/fixuser.bash" with administrator privileges
                delay 7
                do shell script "rm -R /Applications/PlexConnect"
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.0.1-intel-universal-snow-leopard.dmg" with administrator privileges
                display notification "Installing theme..." with title "PlexConnect Status"
                tell application "Finder"
                    try
                        if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            do shell script "stopbash.bash"
                            else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            onerror
                        end if
                    end try
                end tell
                delay 4
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
                do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/PlexConnect/update/OSX"
                do shell script "mkdir /Applications/PlexConnect/update/OSX"
                do shell script "PATH=/usr/local/git/bin:/usr/bin:/opt/local/bin:/usr/local/bin/git export PATH; cd " & myFolder & "; git clone https://github.com/wahlmanj/PlexConnect.git"
                do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/onlytemp"
                do shell script "installbash.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell ghostProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerghost_
    
    on buttonhandlerbrotuser_(sender)
        tell brotuserProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            try
                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    do shell script "stopbash.bash"
                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    onerror
                end if
            end try
        end tell
        delay 4
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
        tell application "Finder"
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                do shell script "echo install present"
                else
                display notification "No Theme Installed..." with title "PlexConnect Status"
            end if
        end tell
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                else
                do shell script ""
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try
        
        tell application "Finder"
            if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                else
                display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
            end if
        end tell

        tell brotuserProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerbrotuser_
    
    on buttonhandlerwahlmanj_(sender)
        tell wahlmanjProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            try
                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    do shell script "stopbash.bash"
                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    onerror
                end if
            end try
        end tell
        delay 4
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
        delay 2
        do shell script "installbash.bash"
        tell application "Finder"
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                do shell script "echo install present"
                else
                display notification "No Theme Installed..." with title "PlexConnect Status"
            end if
        end tell
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                else
                do shell script ""
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try
        
        tell application "Finder"
            if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                else
                display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
            end if
        end tell

        tell wahlmanjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwahlmanj_
    
    --Hijack Tab
    
    on buttonhandlerip_(sender)
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        display notification  theLocalNode with title "Mac IP Address"
    end buttonhandlerip_
    
    on buttonhandlerSSL_(sender)
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        
        display notification  theLocalNode & "/trailers.cer" with title "Cert URL"
    end buttonhandlerSSL_
    
    on buttonhandlertrailers_(sender)
        tell trailersProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
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
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        do shell script "echo install present"
                        else
                        display notification "No Theme Installed..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        else
                        do shell script ""
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        else
                        display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
                    end if
                end tell

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
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        do shell script "echo install present"
                        else
                        display notification "No Theme Installed..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        else
                        do shell script ""
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        else
                        display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
                    end if
                end tell

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
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        do shell script "echo install present"
                        else
                        display notification "No Theme Installed..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        else
                        do shell script ""
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        else
                        display notification "No Certs present, Choose hijack..." with title "PlexConnect Status"
                    end if
                end tell

                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "Theme Required to hijack..." with title "Hijack Status"
            end if
        end tell
        tell wsjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwsj_
    
    --Advanced Tab
    
    on buttonhandlerdelcerts_(sender)
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.pem"
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.key"
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.cer"
    end buttonhandlerdelcerts_
    
    on buttonhandlerdellog_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "rm /Applications/PlexConnect/plexconnect.log"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Log Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerdellog_
    
    on buttonhandleropenbase_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
        do shell script "open /Applications/PlexConnect"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandleropenbase_
    
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
    
    on buttonhandlercertfolder_(sender)
        do shell script "folder.bash"
    end buttonhandlercertfolder_
    
    on buttonhandlerstorefront_(sender)
        do shell script "/Applications/PlexConnect/update/OSX/storefront.bash"
        do shell script "open /Applications/PlexConnect/update/OSX/storeFront"
    end buttonhandlerstorefront_
    
    on buttonhandlersettingscfg_(sender)
        do shell script "open /Applications/PlexConnect/settings.cfg"
    end buttonhandlersettingscfg_
    
    on buttonhandlerloadcerts_(sender)
        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates" with administrator privileges
        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates" with administrator privileges
        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates" with administrator privileges
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
    
    on buttonhandlerbackupall_(sender)
        do shell script "backupbash.bash"
        display notification "All available settings Backed up..." with title "PlexConnect Status"
    end buttonhandlerbackupall_
    
    on buttonhandlerrestoreall_(sender)
        do shell script "restorebash.bash"
        display notification "All available settings restored..." with title "PlexConnect Status"
    end buttonhandlerrestoreall_
    
    on buttonhandlerbackupcerts_(sender)
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.cer /Applications/plexconnect_BACKUP" with administrator privileges
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.pem /Applications/plexconnect_BACKUP" with administrator privileges
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.key /Applications/plexconnect_BACKUP" with administrator privileges
    end buttonhandlerbackupcerts_
    
    --Extras Tab
    
    on buttonhandlerautoupdate_(sender)
        do shell script "createautobash.bash"
        display notification "Automatic GitHub Updates Enabled..." with title "PlexConnect Status"
    end buttonhandlerautoupdate_
    
    on buttonhandlerloghigh_(sender)
        do shell script "cd /Applications/PlexConnect; sed -i '' 's/Normal/High/g' settings.cfg"
    end buttonhandlerloghigh_
    
    on buttonhandlerlognormal_(sender)
        do shell script "cd /Applications/PlexConnect; sed -i '' 's/High/Normal/g' settings.cfg"
    end buttonhandlerlognormal_
    
    on buttonhandlerplexweb_(sender)
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        
        set tURL to "http://" & theLocalNode & ":32400/web/index.html#!/dashboard"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerplexweb_
    
    on buttonhandlerios7greyplexicon_(sender)
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/grey/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/grey/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
    end buttonhandlerios7greyplexicon_
    
    on buttonhandlerios7blackplexicon_(sender)
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/black/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/black/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
    end buttonhandlerios7blackplexicon_
    
    on buttonhandlerios7gradientplexicon_(sender)
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/gradient/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/gradient/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
    end buttonhandlerios7gradientplexicon_
    
    on buttonhandlerios8greyplexicon_(sender)
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/grey/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/grey/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
    end buttonhandlerios8greyplexicon_
    
    on buttonhandlerios8blackplexicon_(sender)
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/black/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/black/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
    end buttonhandlerios8blackplexicon_
    
    on buttonhandlerios8gradientplexicon_(sender)
        do shell script "stopbash.bash"
        do shell script "cp /Applications/PlexConnect/update/OSX/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/DNSServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/gradient/icon@1080.png /Applications/PlexConnect/assets/thumbnails"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/gradient/icon@720.png /Applications/PlexConnect/assets/thumbnails"
        delay 8
        do shell script "startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
    end buttonhandlerios8gradientplexicon_
    
    on buttonhandlermuteboot_(sender)
        do shell script "sudo defaults write com.apple.loginwindow LoginHook /usr/bin/unmuteboot.bash" with administrator privileges
        do shell script "sudo defaults write com.apple.loginwindow LogoutHook /usr/bin/muteboot.bash" with administrator privileges
        display notification "Boot startup sound muted..." with title "OS X Status"
    end buttonhandlermuteboot_
    
    on buttonhandlerpillowinstaller_(sender)
        do shell script "quit Terminal"
        delay 2
        do shell script "open /Applications/Utilities/Terminal.app"
        tell application "Terminal"
            activate
            activate
            activate
            tell application "System Events" to keystroke "pillow.bash"
            tell application "System Events" to keystroke return
        end tell
    end buttonhandlerpillowinstaller_
    
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
    
    on buttonhandlerxcode_(sender)
        do shell script "show Safari"
        set theURL to "https://itunes.apple.com/app/xcode/id497799835?mt=12"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
        display notification "Install Xcode..." with title "Airplay status"
    end buttonhandlerxcode_
    
    on buttonhandlerairplayinstaller_(sender)
        do shell script "quit Terminal"
        delay 2
        do shell script "open /Applications/Utilities/Terminal.app"
        tell application "Terminal"
            activate
            activate
            activate
            tell application "System Events" to keystroke "/Applications/PlexConnect/update/OSX/shairport.bash"
            tell application "System Events" to keystroke return
        end tell
        display notification "Follow instructions to enable Airplay" with title "Airplay status"
    end buttonhandlerairplayinstaller_
    
    on buttonhandleruas_(sender)
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
    end buttonhandleruas_
    
    on buttonhandlerwol_(sender)
        do shell script "wol.bash" with administrator privileges
        display notification "aTV WOL Plists installed..." with title "WOL Status"
    end buttonhandlerwol_
    
    --WebConnect Tab
    
    on buttonhandlerinstallwc_(sender)
        do shell script "cp /Applications/PlexConnect/update/OSX/httpd.conf /etc/apache2" with administrator privileges
        do shell script "websharingbash.bash"
    end buttonhandlerinstallwc_
    
    on buttonhandlerinstallwc10_(sender)
        tell WCProgressBar to startAnimation:me -- another way
        set animated to true
        do shell script "cp /Applications/PlexConnect/update/OSX/10.10/httpd.conf /etc/apache2" with administrator privileges
        try
            do shell script "sudo apachectl start" with administrator privileges
            onerror
        end try
        try
            do shell script "sudo apachectl restart" with administrator privileges
            onerror
        end try
        tell WCProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerinstallwc10_
    
    on buttonhandlerwview_(sender)
    set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
    set tURL to "http://" & tIP & ":1234/cgi-bin/webconnect.cgi"
    tell application "Safari" to make new document with properties {URL:tURL}
    do shell script "show Safari"
    end buttonhandlerwcview_
    
    on buttonhandlerupdatecode_(sender)
        do shell script "updatewcbash.bash"
        display notification "WebConnect Views Updated..." with title "OpenPlex Status"
    end buttonhandlerupdatecode_
    
    --About Tab
    
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
    end buttonhandlerOProadmap_
    
    on buttonhandlerOPforum_(sender)
        set theURL to "https://forums.plex.tv/index.php/topic/108332-openplex-osx-app/"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPforum_
    
    on buttonhandlerOPwiki_(sender)
        set theURL to "https://github.com/wahlmanj/OpenPlex/wiki"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerwiki_
    
    on buttonhandlerOProadmap_(sender)
        set theURL to "https://github.com/wahlmanj/OpenPlex/wiki/Roadmap"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOProadmap_
    
    on buttonhandlerdonate_(sender)
        set theURL to "http://alturl.com/5js9g"
        tell application "Safari" to make new document with properties {URL:theURL}
        set theURL to "http://alturl.com/j8xdb"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerdonate_
    
    --Other Scripts
    
    on buttonhandlerquitconsole_(sender)
        do shell script "quit Console"
    end buttonhandlerquitconsole_
    
    on buttonhandlerguide_(sender)
        set theURL to "https://github.com/iBaa/PlexConnect/wiki/Install-Guide-Certificate-via-Ethernet"
        tell application "Safari" to make new document with properties {URL:theURL}
        set theURL to "https://github.com/iBaa/PlexConnect/wiki/Install-Guide-AppleTV-Ethernet#wiki-install-the-certificate-to-your-appletv"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerguide_
    
    on buttonhandlerfixplists_(sender)
        do shell script "auto.bash" with administrator privileges
    end buttonhandlerfixplists_
    
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
    
    on buttonhandlermacports_(sender)
        do shell script "show Safari"
        set theURL to "http://www.macports.org/install.php"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
        display notification "Install Macports.pkg..." with title "Airplay status"
    end buttonhandlermacports_
    
    on applicationWillFinishLaunching_(aNotification)
        -- Insert code here to initialize your application before any files are opened
    end applicationWillFinishLaunching_
    
    on applicationShouldTerminate_(sender)
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate_
    
end script
