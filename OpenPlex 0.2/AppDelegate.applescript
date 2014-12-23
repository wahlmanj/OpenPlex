--
--  AppDelegate.applescript
--  OpenPlex 0.4
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
    
    property uninstallProgressBar : missing value
    
    property theNext : ""
    
    property theNetwork : ""
    
    property theRouter : ""
    
    property theLocalNode : ""
    
    set sysinfo to system info
    
    on applicationWillFinishLaunching_(aNotification)
        -- Insert code here to initialize your application before any files are opened
    end applicationWillFinishLaunching_
    
    on applicationShouldTerminate_(sender)
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate_
    
    --Menubar
    
    on buttonhandlerupdate_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                set x to do shell script "updategitbash.bash"
                if x is equal to "Already up-to-date." then
                    display notification "No updates avaliable" with title "PlexConnect Status"
                    else if x is not equal to "Already up-to-date." then
                    display notification "PlexConnect updated, Exit hijacked app on aTV..." with title "PlexConnect Status"
                end if
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                try
                    display notification "No Theme Detected..." with title "OpenPlex Status"
                    onerror
                end try
            end if
        end tell
    end buttonhandlerupdate_
    
    on buttonhandlerrestart_(sender)
                do shell script "restartbash.bash"
                tell application "Finder"
                    if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        display notification "No Theme installed..." with title "OpenPlex Status"
                    end if
                    if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                        display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                    end if
                    if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
            end buttonhandlerrestart_
    
    on buttonhandlerstop_(sender)
                do shell script "stopbash.bash"
                tell application "Finder"
                    if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        display notification "No Theme installed..." with title "OpenPlex Status"
                    end if
                    if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                        display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                    end if
                    if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
    end buttonhandlerstop_
    
    on buttonhandlerstart_(sender)
                do shell script "startbash.bash"
                tell application "Finder"
                    if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        display notification "No Theme installed..." with title "OpenPlex Status"
                    end if
                    if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                        display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                    end if
                    if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
                end tell
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
    end buttonhandlerstart_
    
    on buttonhandlernewchecker_(sender)
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
            display notification "No Theme installed..." with title "OpenPlex Status"
            end if
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
            display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
            display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell

        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try
    end buttonhandlernewchecker_
    
    on buttonhandlerlog_(sender)
        try
        do shell script "open /Applications/PlexConnect/PlexConnect.log"
        on error
        display notification "No Theme Detected..." with title "OpenPlex Status"
        end try
    end buttonhandlerlog_
    
    --Settings Tab
    
    on buttonhandlervideotut_(sender)
        set theURL to "https://www.youtube.com/watch?v=p8bM5it6z_I"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlervideotut_
    
    on buttonhandlerinstalldark_(sender)
    do shell script "defaults write /Library/Preferences/.GlobalPreferences.plist _HIEnableThemeSwitchHotKey -bool true" with administrator privileges
    tell application "System Events" to log out
    display notification "Log out to enable Dark Mode..." with title "OpenPlex Status"
    delay 0
    end buttonhandlerinstalldark_
    
    on buttonhandlerdarkmode_(sender)
    tell application "System Events"
        keystroke "t" using {command down, option down, control down}
    end tell
    end buttonhandlerdarkmode_
        
    on buttonhandleruninstall_(sender)
        tell uninstallProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Uninstalling OpenPlex..." with title "OpenPlex Status"
        delay 0
        do shell script "uninstallbash.bash"
    end buttonhandleruninstall_
    
    on buttonhandlernewupdateoc_(sender)
        tell appupdateProgressBar to startAnimation:me -- another way
        set animated to true
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                tell application "Finder"
                           if (exists folder "Applications:OpenPlex" of the startup disk) then
                               set x to do shell script "updateappbash.bash"
                               if x is not equal to "Already up-to-date." then
                               display notification "OpenPlex update available, Installing..." with title "OpenPlex Status"
                               delay 0
                            try
                                tell application "Finder"
                                    if (exists file "Applications:OpenPlex:10.6:OpenPlex.app" of the startup disk) then
                                        try
                                            do shell script "cd /Applications/OpenPlex/10.6; rm -R OpenPlex.app"
                                            onerror
                                        end try
                                        else
                                    end if
                                end tell
                                tell application "Finder"
                                    if (exists file "Applications:OpenPlex:10.7:OpenPlex.app" of the startup disk) then
                                        try
                                            do shell script "cd /Applications/OpenPlex/10.7; rm -R OpenPlex.app"
                                            onerror
                                        end try
                                        else
                                    end if
                                end tell
                                tell application "Finder"
                                    if (exists file "Applications:OpenPlex:updater:updater.app" of the startup disk) then
                                        try
                                            do shell script "cd /Applications/OpenPlex/updater; rm -R updater.app"
                                            onerror
                                        end try
                                        else
                                    end if
                                end tell
                                do shell script "updatewcbash.bash; cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
                                do shell script "cd /Applications/OpenPlex/updater; ditto -xk updater.zip /Applications/OpenPlex/updater; cd /Applications/OpenPlex/updater; open updater.app"
                                onerror
                                do shell script "rm -R /Applications/OpenPlex" with administrator privileges
                                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git;cd /Applications/OpenPlex/updater; ditto -xk updater.zip /Applications/OpenPlex/updater; cd /Applications/OpenPlex/updater; open updater.app"
                            end try
                           else if x is equal to "Already up-to-date." then
                           display notification "No app updates avaliable" with title "OpenPlex Status"
                        end if
                        else if not (exists folder "Applications:OpenPlex" of the startup disk) then
                        display notification "OpenPlex update available, Installing..." with title "OpenPlex Status"
                        delay 0
                        do shell script "updatewcbash.bash; cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
                        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git;cd /Applications/OpenPlex/updater; ditto -xk updater.zip /Applications/OpenPlex/updater; cd /Applications/OpenPlex/updater; open updater.app"
                    end if
                end tell
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Theme Installed..." with title "OpenPlex Status"
            end if
        end tell
        tell appupdateProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlernewupdateoc_
    
    on buttonhandlerloginon_(sender)
        display notification "OpenPlex added to login items..." with title "OpenPlex Status"
        tell application "System Events" to make login item at end with properties {path:"/Applications/OpenPlex.app", hidden:false}
    end buttonhandlerloginon_
    
    on buttonhandlerloginoff_(sender)
        display notification "OpenPlex removed from login items..." with title "OpenPlex Status"
        tell application "System Events" to delete login item "OpenPlex"
    end buttonhandlerloginoff_
    
    --Theme Tab
    
    on buttonhandlerclt_(sender)
        set theURL to "https://www.dropbox.com/sh/4ebx2bmx7ca6c0h/AAA2diPOo3wsdWJK6OM74wida"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerclt_
    
    on buttonhandlerclone_(sender)
        tell baaProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing iBaa Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                do shell script "trashbasebash.bash"
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                                    do shell script "rm -R /Applications/PlexConnect"
                                end try
                            end if
                        end tell
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if not(exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                do shell script "trashbasebash.bash"
                                end try
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            end if
                        end tell
                    end if
                    tell application "Finder"
                    if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                    end if
                    end tell
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "rm -R /Applications/onlytemp"
                        end if
                    end tell
                        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/iBaa/PlexConnect.git"
                        do shell script "mkdir /Applications/onlytemp"
                        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/PlexConnect/update/OSX"
                        do shell script "mkdir /Applications/PlexConnect/update/OSX"
                        do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/onlytemp"
                        do shell script "installbash.bash"
                        do shell script "cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
                        do shell script "purgesettingsbash.bash"
                        tell application "Finder"
                            if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "icloud"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createimoviebash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "trailers"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createcertbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "marketwatch"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createwsjbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "Shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is not "0" then
                                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "serving\\|shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is equal to "3" then
                                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                    end if
                                end try
                                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                            end if
                            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                            end if
                        end tell
                        
                end tell
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
            end if
            end tell
        
            tell application "Finder"
                if not (exists folder "usr:local:git:OP" of the startup disk) then
                    display notification "Installing git..." with title "OpenPlex Status"
                    delay 0
                    tell application "Finder"
                        if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                            do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.dmg"
                        end if
                        if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                            do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.pkg"
                        end if
                    end tell
                    do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/git.zip > git.zip; ditto -xk git.zip /Applications; hdiutil attach /Applications/git-2.2.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.2.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal; chmod 777 /Applications/git.zip; cd /Applications; rm git.zip" with administrator privileges
                    set fileAsPOSIX to (POSIX path of "/etc/paths")
                    set theString to quoted form of "/usr/local/git/bin"
                    try
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "1" then
                        end if
                    end try
                    try
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        on error
                    do shell script "cd /etc; echo '/usr/local/git/bin' | cat - paths > temp && mv temp paths" with administrator privileges
                    end try
                    tell application "Finder"
                        if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
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
                        end if
                    end tell
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                            do shell script "rm -R /Applications/onlytemp" with administrator privileges
                            else if not (exists folder "Applications:onlytemp" of the startup disk) then
                        end if
                    end tell
                    do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                    do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
                    do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                    do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
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
                    do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/iBaa/PlexConnect.git"
                    do shell script "mkdir /Applications/onlytemp"
                    do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                    do shell script "rm -R /Applications/PlexConnect/update/OSX"
                    do shell script "mkdir /Applications/PlexConnect/update/OSX"
                    do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                    do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                    do shell script "rm -R /Applications/onlytemp"
                    do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                    do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                    do shell script "sudoers.bash"
                    do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                    do shell script "purgesettingsbash.bash"
                    do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                    tell application "Finder"
                        if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                            do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                            do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                            do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                            
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                set theString to quoted form of "icloud"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is "2" then
                                    display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                    delay 0
                                    do shell script "createimoviebash.bash"
                                end if
                            end try
                            
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                set theString to quoted form of "trailers"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is "2" then
                                    display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                    delay 0
                                    do shell script "createcertbash.bash"
                                end if
                            end try
                            
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                set theString to quoted form of "marketwatch"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is "2" then
                                    display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                    delay 0
                                    do shell script "createwsjbash.bash"
                                end if
                            end try
                            
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                    delay 0
                                    do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                end if
                            end try
                            
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                    delay 0
                                    do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                end if
                            end try
                        end if
                    end tell
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    end if
                    if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                    end if
            end tell
        tell baaProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerclone_

    on buttonhandlerfalco_(sender)
        tell falcoProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing Falco953 Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                do shell script "trashbasebash.bash"
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                                    do shell script "rm -R /Applications/PlexConnect"
                                end try
                            end if
                        end tell
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if not(exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "trashbasebash.bash"
                                end try
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            end if
                        end tell
                    end if
                    tell application "Finder"
                        if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                        end if
                    end tell
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "rm -R /Applications/onlytemp"
                        end if
                    end tell
                        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/falco953/PlexConnect.git"
                        do shell script "mkdir /Applications/onlytemp"
                        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/PlexConnect/update/OSX"
                        do shell script "mkdir /Applications/PlexConnect/update/OSX"
                        do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/onlytemp"
                        do shell script "installbash.bash"
                        do shell script "cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
                        do shell script "purgesettingsbash.bash"
                        tell application "Finder"
                            if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "icloud"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createimoviebash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "trailers"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createcertbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "marketwatch"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createwsjbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "Shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is not "0" then
                                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "serving\\|shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is equal to "3" then
                                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                    end if
                                end try
                                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                            end if
                            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                            end if
                        end tell
                end tell
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
            end if
        end tell
        
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                delay 0
                tell application "Finder"
                    if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.dmg"
                    end if
                    if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.pkg"
                    end if
                end tell
                do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/git.zip > git.zip; ditto -xk git.zip /Applications; hdiutil attach /Applications/git-2.2.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.2.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal; chmod 777 /Applications/git.zip; cd /Applications; rm git.zip" with administrator privileges
                set fileAsPOSIX to (POSIX path of "/etc/paths")
                set theString to quoted form of "/usr/local/git/bin"
                try
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "1" then
                    end if
                end try
                try
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    on error
                    do shell script "cd /etc; echo '/usr/local/git/bin' | cat - paths > temp && mv temp paths" with administrator privileges
                end try
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
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
                    end if
                end tell
                tell application "Finder"
                    if (exists folder "Applications:onlytemp" of the startup disk) then
                        do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                        do shell script "rm -R /Applications/onlytemp" with administrator privileges
                        else if not (exists folder "Applications:onlytemp" of the startup disk) then
                    end if
                end tell
                do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
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
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/falco953/PlexConnect.git"
                do shell script "mkdir /Applications/onlytemp"
                do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/PlexConnect/update/OSX"
                do shell script "mkdir /Applications/PlexConnect/update/OSX"
                do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/onlytemp"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "purgesettingsbash.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createimoviebash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createcertbash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "marketwatch"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createwsjbash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                            set theString to quoted form of "Shutting"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is not "0" then
                                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                delay 0
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                            set theString to quoted form of "serving\\|shutting"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is equal to "3" then
                                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                delay 0
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end if
                        end try
                    end if
                end tell
                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell falcoProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerfalco_
    
    on buttonhandlerstoffez_(sender)
        tell stoffezProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing Stoffez Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                do shell script "trashbasebash.bash"
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                                    do shell script "rm -R /Applications/PlexConnect"
                                end try
                            end if
                        end tell
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if not(exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "trashbasebash.bash"
                                end try
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            end if
                        end tell
                    end if
                    tell application "Finder"
                        if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                        end if
                    end tell
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "rm -R /Applications/onlytemp"
                        end if
                    end tell
                    do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/stoffez/PlexConnect.git"
                        do shell script "mkdir /Applications/onlytemp"
                        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/PlexConnect/update/OSX"
                        do shell script "mkdir /Applications/PlexConnect/update/OSX"
                        do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/onlytemp"
                        do shell script "installbash.bash"
                        do shell script "cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
                        do shell script "purgesettingsbash.bash"
                        tell application "Finder"
                            if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "icloud"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createimoviebash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "trailers"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createcertbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "marketwatch"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createwsjbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "Shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is not "0" then
                                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "serving\\|shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is equal to "3" then
                                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                    end if
                                end try
                                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                            end if
                            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                            end if
                        end tell
                end tell
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
            end if
        end tell
        
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                delay 0
                tell application "Finder"
                    if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.dmg"
                    end if
                    if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.pkg"
                    end if
                end tell
                do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/git.zip > git.zip; ditto -xk git.zip /Applications; hdiutil attach /Applications/git-2.2.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.2.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal; chmod 777 /Applications/git.zip; cd /Applications; rm git.zip" with administrator privileges
                set fileAsPOSIX to (POSIX path of "/etc/paths")
                set theString to quoted form of "/usr/local/git/bin"
                try
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "1" then
                    end if
                end try
                try
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    on error
                    do shell script "cd /etc; echo '/usr/local/git/bin' | cat - paths > temp && mv temp paths" with administrator privileges
                end try
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
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
                    end if
                end tell
                tell application "Finder"
                    if (exists folder "Applications:onlytemp" of the startup disk) then
                        do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                        do shell script "rm -R /Applications/onlytemp" with administrator privileges
                        else if not (exists folder "Applications:onlytemp" of the startup disk) then
                    end if
                end tell
                do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
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
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/stoffez/PlexConnect.git"
                do shell script "mkdir /Applications/onlytemp"
                do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/PlexConnect/update/OSX"
                do shell script "mkdir /Applications/PlexConnect/update/OSX"
                do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/onlytemp"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "purgesettingsbash.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createimoviebash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createcertbash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "marketwatch"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createwsjbash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                            set theString to quoted form of "Shutting"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is not "0" then
                                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                delay 0
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                            set theString to quoted form of "serving\\|shutting"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is equal to "3" then
                                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                delay 0
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end if
                        end try
                    end if
                end tell
                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell stoffezProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerstoffez_
    
    on buttonhandlerghost_(sender)
        tell ghostProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing CyberGhost84 Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                do shell script "trashbasebash.bash"
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                                    do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                                    do shell script "rm -R /Applications/PlexConnect"
                                end try
                            end if
                        end tell
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            tell application "Finder"
                                if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    do shell script "stopbash.bash"
                                end if
                            end tell
                        end try
                        tell application "Finder"
                            if not(exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                try
                                    do shell script "trashbasebash.bash"
                                end try
                                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                            end if
                        end tell
                    end if
                    tell application "Finder"
                        if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                        end if
                    end tell
                    tell application "Finder"
                        if (exists folder "Applications:onlytemp" of the startup disk) then
                            do shell script "rm -R /Applications/onlytemp"
                        end if
                    end tell
                        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/CyberGhost84/PlexConnect.git"
                        do shell script "mkdir /Applications/onlytemp"
                        do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/PlexConnect/update/OSX"
                        do shell script "mkdir /Applications/PlexConnect/update/OSX"
                        do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                        do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                        do shell script "rm -R /Applications/onlytemp"
                        do shell script "installbash.bash"
                        do shell script "cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
                        do shell script "purgesettingsbash.bash"
                        tell application "Finder"
                            if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                                do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "icloud"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createimoviebash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "trailers"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                        delay 0
                                        do shell script "createcertbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                                    set theString to quoted form of "marketwatch"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is "2" then
                                        display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                        do shell script "createwsjbash.bash"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "Shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is not "0" then
                                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end if
                                end try
                                
                                try
                                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                    set theString to quoted form of "serving\\|shutting"
                                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                    if searchResult is equal to "3" then
                                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                        delay 0
                                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                    end if
                                end try
                                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                            end if
                            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                            end if
                        end tell
                end tell
                else if not (exists folder "usr:local:git:OP" of the startup disk) then
            end if
        end tell
        
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                display notification "Installing git..." with title "OpenPlex Status"
                delay 0
                tell application "Finder"
                    if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.dmg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.dmg"
                    end if
                    if (exists file "Applications:git-2.2.1-intel-universal-snow-leopard.pkg" of the startup disk) then
                        do shell script "cd /Applications; rm -R git-2.2.1-intel-universal-snow-leopard.pkg"
                    end if
                end tell
                do shell script "cd /Applications; curl -L https://github.com/wahlmanj/git/raw/master/git.zip > git.zip; ditto -xk git.zip /Applications; hdiutil attach /Applications/git-2.2.1-intel-universal-snow-leopard.dmg; cp /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal/git-2.2.1-intel-universal-snow-leopard.pkg /Applications; sudo installer -pkg /Applications/git-2.2.1-intel-universal-snow-leopard.pkg -target /; hdiutil unmount /Volumes/Git\\ 2.2.1\\ Snow\\ Leopard\\ Intel\\ Universal; chmod 777 /Applications/git.zip; cd /Applications; rm git.zip" with administrator privileges
                set fileAsPOSIX to (POSIX path of "/etc/paths")
                set theString to quoted form of "/usr/local/git/bin"
                try
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "1" then
                    end if
                end try
                try
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    on error
                    do shell script "cd /etc; echo '/usr/local/git/bin' | cat - paths > temp && mv temp paths" with administrator privileges
                end try
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
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
                    end if
                end tell
                tell application "Finder"
                    if (exists folder "Applications:onlytemp" of the startup disk) then
                        do shell script "chmod -R 777 /Applications/onlytemp" with administrator privileges
                        do shell script "rm -R /Applications/onlytemp" with administrator privileges
                        else if not (exists folder "Applications:onlytemp" of the startup disk) then
                    end if
                end tell
                do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "chmod 777 /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
                do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.pkg" with administrator privileges
                do shell script "rm /Applications/git-2.2.1-intel-universal-snow-leopard.dmg" with administrator privileges
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
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/CyberGhost84/PlexConnect.git"
                do shell script "mkdir /Applications/onlytemp"
                do shell script "mkdir -p /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/PlexConnect/update/OSX"
                do shell script "mkdir /Applications/PlexConnect/update/OSX"
                do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
                do shell script "cp -R /Applications/onlytemp/PlexConnect/update/OSX/* /Applications/PlexConnect/update/OSX"
                do shell script "rm -R /Applications/onlytemp"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "sudoers.bash"
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "purgesettingsbash.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createimoviebash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createcertbash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "marketwatch"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createwsjbash.bash"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                            set theString to quoted form of "Shutting"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is not "0" then
                                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                                delay 0
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end if
                        end try
                        
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                            set theString to quoted form of "serving\\|shutting"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is equal to "3" then
                                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                                delay 0
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end if
                        end try
                    end if
                end tell
                else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
            end if
        end tell
        tell ghostProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerghost_
    
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
                try
                do shell script "createcertbash.bash"
                on error
                tell application "Finder"
                    if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        display notification "No Theme installed..." with title "OpenPlex Status"
                        delay 0
                    end if
                    end tell
                    end try
                tell application "Finder"
                    if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                        display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                        delay 0
                    end if
                end tell
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                tell trailersProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlertrailers_
    
    on buttonhandlerimovie_(sender)
        tell imovieProgressBar to startAnimation:me -- another way
        set animated to true
        try
            do shell script "createimoviebash.bash"
            on error
            tell application "Finder"
                if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    display notification "No Theme installed..." with title "OpenPlex Status"
                    delay 0
                end if
            end tell
        end try
        tell application "Finder"
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try
        tell imovieProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerimovie_
    
    on buttonhandlerwsj_(sender)
        tell wsjProgressBar to startAnimation:me -- another way
        set animated to true
        try
            do shell script "createwsjbash.bash"
            on error
            tell application "Finder"
                if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    display notification "No Theme installed..." with title "OpenPlex Status"
                    delay 0
                end if
            end tell
        end try
        tell application "Finder"
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try
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
                    display notification "No Theme Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandleropenbase_
    
    on buttonhandlertrash_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "PlexConnect deleted..." with title "OpenPlex Status"
                delay 0
                do shell script "trashbasebash.bash"
                do shell script "stopbash.bash"
                do shell script "trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Folder Detected..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlertrash_
    
    on buttonhandlercertfolder_(sender)
        try
        do shell script "folder.bash"
        on error
        display notification "No Theme Detected..." with title "OpenPlex Status"
        end try
    end buttonhandlercertfolder_
    
    on buttonhandlerstorefront_(sender)
        try
        do shell script "/Applications/PlexConnect/update/OSX/storefront.bash"
        do shell script "open /Applications/PlexConnect/update/OSX/storeFront"
        on error
        display notification "No Theme Detected..." with title "OpenPlex Status"
        end try
    end buttonhandlerstorefront_
    
    on buttonhandlersettingscfg_(sender)
        try
        do shell script "open /Applications/PlexConnect/settings.cfg"
        on error
        display notification "No Theme Detected..." with title "OpenPlex Status"
        end try
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
        --Needs work to remove password only
        do shell script "cp /Applications/plexconnect_BACKUP/settings.cfg /Applications/PlexConnect" with administrator privileges
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
        --Needs work to remove password only
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
                do shell script "cp -R /Applications/plexconnect_BACKUP/fanartcache/* /Applications/PlexConnect/assets/fanartcache" with administrator privileges
                else if not (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
            end if
        end tell
    end buttonhandlerloadbackupfanart_
    
    on buttonhandlerbackupATVSettings_(sender)
        tell application "Finder"
            if (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                do shell script "cp /Applications/PlexConnect/ATVSettings.cfg /Applications/plexconnect_BACKUP"
                else if not (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                display notification "No ATVSettings.cfg present..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerbackupATVSettings_
    
    on buttonhandlerloadATVSettings_(sender)
        tell application "Finder"
            if (exists file "Applications:plexconnect_BACKUP:ATVSettings.cfg" of the startup disk) then
                display notification "Exit and/or Open aTV hijack to load PlexConnect Settings..." with title "OpenPlex Status"
                delay 0
                do shell script "stopbash.bash; sleep 5; purgesettingsbash.bash; cp /Applications/plexconnect_BACKUP/ATVSettings.cfg /Applications/PlexConnect; startbash.bash"
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        else
                        display notification "No Theme Installed..." with title "OpenPlex Status"
                    end if
                end tell
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        tell application "Finder"
                            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                            end if
                        end tell
                        else if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "OpenPlex Status"
                    end if
                end tell
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        display notification "PlexConnect is Running..." with title "PlexConnect Status"
                        delay 0
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end if
                end try
                else if not (exists file "Applications:plexconnect_BACKUP:ATVSettings.cfg" of the startup disk) then
                display notification "Backup ATVSettings.cfg first..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerloadATVSettings_
    
    on buttonhandlerdeleteATVSettings_(sender)
        tell application "Finder"
            if (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
        display notification "Exit and/or Open aTV hijack to load default PlexConnect Settings..." with title "OpenPlex Status"
        delay 0
        do shell script "stopbash.bash; sleep 5; purgesettingsbash.bash; startbash.bash"
        tell application "Finder"
            if (exists folder "Applications:PlexConnect" of the startup disk) then
                else
                display notification "No Theme Installed..." with title "OpenPlex Status"
            end if
        end tell
        tell application "Finder"
            if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                tell application "Finder"
                    if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                        display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                    end if
                end tell
                else if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "OpenPlex Status"
            end if
        end tell
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                display notification "PlexConnect is Not Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Basso.aiff"
            end if
        end try
        
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                delay 0
                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
            end if
        end try
        else if not (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
        display notification "No ATVSettings.cfg present..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerdeleteATVSettings_
    
    on buttonhandlerbackupall_(sender)
        do shell script "backupbash.bash"
        display notification "All available settings Backed up..." with title "OpenPlex Status"
    end buttonhandlerbackupall_
    
    on buttonhandlerrestoreall_(sender)
        do shell script "restorebash.bash"
            display notification "All available settings restored..." with title "OpenPlex Status"
    end buttonhandlerrestoreall_
    
    on buttonhandlerbackupcerts_(sender)
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.cer /Applications/plexconnect_BACKUP"
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.pem /Applications/plexconnect_BACKUP"
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.key /Applications/plexconnect_BACKUP"
    end buttonhandlerbackupcerts_
    
    --Extras Tab
    
    on buttonhandlerautocerts_(sender)
        tell application "Finder"
        if (exists file "Applications:plexconnect_BACKUP:trailers.cer" of the startup disk) then
        do shell script "cd /Applications/plexconnect_BACKUP; touch trailers.auto"
        display notification "Automatic Cert loading Enabled..." with title "OpenPlex Status"
        else if not (exists file "Applications:plexconnect_BACKUP:trailers.cer" of the startup disk) then
        display notification "Backup certs first, then enable auto certs loader..." with title "OpenPlex Status"
        end if
        end tell
    end buttonhandlerautocerts_
    
    on buttonhandlerautocertsremove_(sender)
        try
            do shell script "cd /Applications/plexconnect_BACKUP; rm trailers.auto"
            display notification "Automatic Cert loading Disabled..." with title "OpenPlex Status"
            on error
                display notification "Automatic Cert loading Disabled..." with title "OpenPlex Status"
        end try
    end buttonhandlerautocertsremove_
    
    on buttonhandlerautoupdate_(sender)
        do shell script "createautobash.bash"
            display notification "Automatic GitHub Updates Enabled..." with title "OpenPlex Status"
    end buttonhandlerautoupdate_
    
    on buttonhandlerdefaultupdate_(sender)
        do shell script "cd /Library/LaunchDaemons; launchctl unload com.plex.plexconnect.auto.plist; rm com.plex.plexconnect.auto.plist" with administrator privileges
            display notification "Automatic GitHub Updates Disabled..." with title "OpenPlex Status"
    end buttonhandlerdefaultupdate_
    
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
            set tURL to "http://" & theLocalNode & ":32400/web/index.html#!/dashboard"
            tell application "Safari" to make new document with properties {URL:tURL}
            do shell script "show Safari"
            on error
            display notification "Can't get Local IP..." with title "OpenPlex Status"
        end try
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
    
    on buttonhandlerxcode_(sender)
        display notification "Install Xcode..." with title "Airplay status"
        delay 0
        do shell script "show Safari"
        set theURL to "https://itunes.apple.com/app/xcode/id497799835?mt=12"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
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
        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/mikedm139/UnSupportedAppstore.bundle.git; git clone https://github.com/wahlmanj/unsupported.git"
            do shell script "chmod +x /applications/unsupported/unsupported.bash" with administrator privileges
        do shell script "/applications/unsupported/unsupported.bash" with administrator privileges
        do shell script "unsupported2.bash"
        do shell script "chmod +x /applications/unsupported/copy.bash" with administrator privileges
        do shell script "/applications/unsupported/copy.bash" with administrator privileges
        display notification "Unsupported AppStore installed..." with title "OpenPlex Status"
    end buttonhandleruas_
    
    on buttonhandlerwol_(sender)
        do shell script "wol.bash" with administrator privileges
        display notification "aTV WOL Plists installed..." with title "OpenPlex Status"
    end buttonhandlerwol_
    
    --WebConnect Tab
    
    on buttonhandlerinstallwc_(sender)
        try
        do shell script "cp /Applications/PlexConnect/update/OSX/httpd.conf /etc/apache2" with administrator privileges
        on error
            display notification "Install theme then try again" with title "OpenPlex Status"
        end try
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:httpd.conf" of the startup disk) then
        do shell script "websharingbash.bash"
        display notification "Install pref pane and turn on WebSharing to enable WebConnect..." with title "OpenPlex Status"
    end if
end tell
    end buttonhandlerinstallwc_
    
    on buttonhandlerinstallwc10_(sender)
        try
        do shell script "cp /Applications/PlexConnect/update/OSX/10.10/httpd.conf /etc/apache2" with administrator privileges
        on error
        display notification "Install theme then try again" with title "OpenPlex Status"
        end try
        tell application "Finder"
        if (exists file "Applications:PlexConnect:update:OSX:10.10:httpd.conf" of the startup disk) then
            do shell script "sudo apachectl start" with administrator privileges
            do shell script "sudo apachectl restart" with administrator privileges
            display notification "WebConnect Enabled..." with title "OpenPlex Status"
            end if
        end tell
            
    end buttonhandlerinstallwc10_
    
    on buttonhandlerwview_(sender)
        set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
        set tURL to "http://" & tIP & ":1234/cgi-bin/webconnect.cgi"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerwcview_
    
    on buttonhandlerupdatecode_(sender)
        tell WCProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "WebConnect Views Updating..." with title "OpenPlex Status"
        delay 0
        do shell script "updatewcbash.bash"
        do shell script "cd /Applications/PlexConnect/update/OSX; sudoers.bash; sudoersfixbash.bash"
        
        tell WCProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerupdatecode_
    
    --About Tab
    
    on buttonhandlerOPforum_(sender)
        set theURL to "https://forums.plex.tv/index.php/topic/108332-openplex-osx-app/"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPforum_
    
    on buttonhandlerOPwiki_(sender)
        set theURL to "https://github.com/wahlmanj/OpenPlex/wiki"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPwiki_
    
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
    
    on buttonhandlerOPchangelog_(sender)
        set theURL to "https://github.com/wahlmanj/OpenPlex/wiki/Changelog"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPchangelog_
    
    --Other Scripts
    
    on buttonhandlercustomplist_(sender)
        try
            do shell script "mkdir /Applications/onlytemp"
            do shell script "cd /Applications/onlytemp; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/PlexConnect.git"
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
    
    on buttonhandlerquitconsole_(sender)
        do shell script "quit Console"
    end buttonhandlerquitconsole_
    
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
        try
            display notification "Install Macports.pkg..." with title "Airplay status"
            onerror
        end try
    end buttonhandlermacports_
    
end script