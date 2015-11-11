--
--  AppDelegate.applescript
--  OpenPlex 0.6
--
--  Originally Designed by CyberGhost84 on 5/02/14.
--  Originally Coded by Wahlman.j on 5/02/14.
--  Copyright (©) 2015 Wahlman.j, CyberGhost84 & Flipman6 All rights reserved.
--  myProgressBar's incrementBy_(20)

script AppDelegate
    property parent : class "NSObject"
    
    property appupdateProgressBar : missing value
    
    property trailersProgressBar : missing value
    
    property imovieProgressBar : missing value
    
    property wsjProgressBar : missing value
    
    property baaProgressBar : missing value
    
    property ghostProgressBar : missing value
    
    property wahlmanjProgressBar : missing value
    
    property stoffezProgressBar : missing value
    
    property falcoProgressBar : missing value
    
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
    
    --Settings Tab
    
    on buttonhandlerversion_(sender)
    set x to do shell script "cd ~/Library/Application\\ Support/OpenPlex; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git reset --hard"
    display notification "Current Version " & x
    end buttonhandlerversion_
    
    on buttonhandlerfirewall_(sender)
    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; firewallbash.bash"
    display notification "Python codesigned for OS X Firewall, accept python via firewall again..." with title "OpenPlex Status"
    delay 0
    end buttonhandlerfirewall_
    
    on buttonhandlerupdate_(sender)
        tell application "Finder"
            try
                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    set x to do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; cd /Applications/PlexConnect; git fetch; git merge origin"
                    set y to do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; cd /Applications/PlexConnect;  git reset --hard"
                    if x is equal to "Already up-to-date." then
                        try
                            do shell script "afplay /System/Library/Sounds/Ping.aiff"
                        end try
                        display notification "No PlexConnect updates avaliable..." & y with title "OpenPlex Status"
                        delay 0
                        else if x is not equal to "Already up-to-date." then
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
                        try
                            do shell script "afplay /System/Library/Sounds/Glass.aiff"
                        end try
                        display notification "PlexConnect updated, Exit hijacked app on aTV..." & y with title "OpenPlex Status"
                        delay 0
                    end if
                end if
                on error
                display notification "PlexConnect folder corrupted reinstall theme" with title "OpenPlex Status"
                delay 0
            end try
        end tell
    end buttonhandlerupdate_

    on buttonhandlerrestart_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
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
                try
                    do shell script "afplay /System/Library/Sounds/Basso.aiff"
                end try
            end if
        end try
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                try
                    do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                end try
            end if
        end try
    end buttonhandlerrestart_
    
    on buttonhandlerstop_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Theme installed..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
            end if
        end tell
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                delay 0
                try
                    do shell script "afplay /System/Library/Sounds/Basso.aiff"
                end try
            end if
        end try
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                delay 0
                try
                    do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                end try
            end if
        end try
    end buttonhandlerstop_
    
    on buttonhandlerstart_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Theme installed..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
            end if
        end tell
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "Shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is not "0" then
                delay 0
                try
                    do shell script "afplay /System/Library/Sounds/Basso.aiff"
                end try
            end if
        end try
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                delay 0
                try
                    do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                end try
            end if
        end try
    end buttonhandlerstart_
    
    on buttonhandlernewchecker_(sender)
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Theme installed..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
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
                try
                    do shell script "afplay /System/Library/Sounds/Basso.aiff"
                end try
            end if
        end try
        try
            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
            set theString to quoted form of "serving\\|shutting"
            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
            if searchResult is equal to "3" then
                display notification "PlexConnect is Running..." with title "PlexConnect Status"
                delay 0
                try
                    do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                end try
            end if
        end try
    end buttonhandlernewchecker_
    
    on buttonhandlerlog_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                if (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                    try
                        do shell script "open /Applications/PlexConnect/PlexConnect.log"
                        on error
                        display notification "No program set to open .log files..." with title "OpenPlex Status"
                        delay 0
                    end try
                    else if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                    display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                    delay 0
                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    display notification "No theme detected..." with title "OpenPlex Status"
                    delay 0
                end if
            end if
        end tell
    end buttonhandlerlog_
    
    on buttonhandlervideotut_(sender)
        set theURL to "https://www.youtube.com/watch?v=djKFtmeDu8U"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlervideotut_
    
    on buttonhandleruninstall_(sender)
        tell uninstallProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Uninstalling OpenPlex..." with title "OpenPlex Status"
        delay 0
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; uninstallbash.bash"
    end buttonhandleruninstall_
    
    on buttonhandlernewupdateoc_(sender)
        tell appupdateProgressBar to startAnimation:me -- another way
        set animated to true
        try
                do shell script "rm -R ~/Library/Application\\ Support/OpenPlex/10.6/OpenPlex.app"
        end try
        try
                do shell script "rm -R ~/Library/Application\\ Support/OpenPlex/10.7/OpenPlex.app"
        end try
        try
                do shell script "rm -R ~/Library/Application\\ Support/OpenPlex/updater/updater.app"
        end try
            set x to do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; appwebbash.bash"
            if x is equal to "no updates available" then
                try
                    do shell script "afplay /System/Library/Sounds/Ping.aiff"
                end try
                display notification "No OpenPlex updates avaliable..." with title "OpenPlex Status"
                delay 0
                else if x is not equal to "no updates available" then
                do shell script "cd ~/Library/Application\\ Support/OpenPlex/updater; unzip updater.zip; open updater.app"
                delay 0
            end if
        tell appupdateProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlernewupdateoc_
    
    on buttonhandlerloginitemOP_(sender)
        tell application "System Events"
            if (exists login item "OpenPlex") then
                display notification "OpenPlex removed from login items..." with title "OpenPlex Status"
                delay 0
                tell application "System Events" to delete login item "OpenPlex"
                try
                    do shell script "cd /Applications/plexconnect_BACKUP; rm login.auto"
                end try
                else
                display notification "OpenPlex added to login items..." with title "OpenPlex Status"
                delay 0
                tell application "System Events" to make login item at end with properties {path:"/Applications/OpenPlex.app", hidden:false}
                try
                    do shell script "cd /Applications/plexconnect_BACKUP; touch login.auto"
                end try
            end if
        end tell
    end buttonhandlerloginitemOP_
    
    on buttonhandlerOPforum_(sender)
        set theURL to "https://forums.plex.tv/discussion/108332/openplex-osx-app"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPforum_
    
    on buttonhandlerOPwiki_(sender)
        set theURL to "https://github.com/wahlmanj/OpenPlex/wiki"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPwiki_
    
    on buttonhandlerdonate_(sender)
        set theURL to "http://alturl.com/j8xdb"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "sleep 1"
        set theURL to "http://alturl.com/5js9g"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlerdonate_
    
    on buttonhandlerOPchangelog_(sender)
        set theURL to "https://github.com/wahlmanj/OpenPlex/wiki/Changelog"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerOPchangelog_
    
    --Theme Tab
    
    on buttonhandlerbaapreview_(sender)
        set theURL to "https://www.youtube.com/watch?v=7gPoDyVPD_E"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerbaapreview_
    
    on buttonhandlerghostpreview_(sender)
        set theURL to "https://www.youtube.com/watch?v=l0QahH1zlUQ"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerghostpreview_
    
    on buttonhandlerfalcopreview_(sender)
        set theURL to "https://www.youtube.com/watch?v=s2JCKZq-O1U"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerfalcopreview_
    
    on buttonhandlerstoffezpreview_(sender)
        set theURL to "https://www.youtube.com/watch?v=7pwaYtEj4sQ"
        tell application "Safari" to make new document with properties {URL:theURL}
    end buttonhandlerstoffezpreview_
    
    on buttonhandlerclt_(sender)
        tell application "Finder"
            if (exists folder "Library:Developer:CommandLineTools" of the startup disk) then
        display notification "Command line tools already installed..." with title "OpenPlex Status"
        else
        display notification "Download and/or install command line tools..." with title "OpenPlex Status"
        delay 0
        set theURL to "https://www.dropbox.com/sh/ipepio1fkvnits0/AAADjjwPDQvyTEhwT7Ez0GwYa?dl=0"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
        end if
            end tell
    end buttonhandlerclt_
    
    on buttonhandlerclone_(sender)
        tell baaProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing iBaa Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; rm -R /Applications/PlexConnect; stopbash.bash; trashbasebash.bash; exit"
                end try
                if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                end if
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/iBaa/PlexConnect.git"
                display notification "iBaa's Theme has been installed..." with title "OpenPlex Status"
                delay 0
                do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; sudoersfixbash.bash; installbash.bash; purgesettingsbash.bash"
                if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end try
                end if
                if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "icloud"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "trailers"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "wsj"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                        end if
                    end try
                    if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                        try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; atvsettingsautobash.bash"
                        display notification "Myplex loaded..." with title "OpenPlex Status"
                        delay 0
                        end try
                    end if
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "Shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is not "0" then
                            try
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "serving\\|shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "3" then
                            try
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end try
                        end if
                    end try
                    try
                        -- load custom certs if in use
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
                    end try
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                end if
                if (exists file "Applications:plexconnect_BACKUP:icon.auto" of the startup disk) then
                    try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
                    end try
                end if
            end if
        end tell
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
                        end try
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
                    end if
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        try
                        do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                        do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                        end try
                    end if
                end tell
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/iBaa/PlexConnect.git"
                display notification "No OpenPlex folder detected, this will take AWHILE to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; purgesettingsbash.bash; restart.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "wsj"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                            end if
                        end try
                        if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                            do shell script "sleep 1"
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    try
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end try
                                end if
                            end try
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    try
                                        try
                                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                        end try
                                    end try
                                end if
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    if not (exists folder "usr:local:git:OpenPlex" of the startup disk) then
                                        do shell script "mkdir -p /usr/local/git/OpenPlex" with administrator privileges
                                    end if
                                end if
                            end try
                        end if
                    end if
                end tell
                else
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
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
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; rm -R /Applications/PlexConnect; stopbash.bash; trashbasebash.bash; exit"
                end try
                if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                end if
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/falco953/PlexConnect.git"
                display notification "Falco953's Theme has been installed..." with title "OpenPlex Status"
                delay 0
                do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; sudoersfixbash.bash; installbash.bash; purgesettingsbash.bash"
                if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end try
                end if
                if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "icloud"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "trailers"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "wsj"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                        end if
                    end try
                    if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                        try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; atvsettingsautobash.bash"
                        display notification "Myplex loaded..." with title "OpenPlex Status"
                        delay 0
                        end try
                    end if
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "Shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is not "0" then
                            try
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "serving\\|shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "3" then
                            try
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end try
                        end if
                    end try
                    try
                        -- load custom certs if in use
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
                    end try
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                end if
                if (exists file "Applications:plexconnect_BACKUP:icon.auto" of the startup disk) then
                    try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
                    end try
                end if
            end if
        end tell
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
                        end try
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
                    end if
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        try
                        do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                        do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                        end try
                    end if
                end tell
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/falco953/PlexConnect.git"
                display notification "No OpenPlex folder detected, this will take AWHILE to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; purgesettingsbash.bash; restart.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "wsj"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                            end if
                        end try
                        if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                            do shell script "sleep 1"
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    try
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end try
                                end if
                            end try
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    try
                                        try
                                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                        end try
                                    end try
                                end if
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    if not (exists folder "usr:local:git:OpenPlex" of the startup disk) then
                                        do shell script "mkdir -p /usr/local/git/OpenPlex" with administrator privileges
                                    end if
                                end if
                            end try
                        end if
                    end if
                end tell
                else
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
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
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; rm -R /Applications/PlexConnect; stopbash.bash; trashbasebash.bash; exit"
                end try
                if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                end if
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/Stoffez/PlexConnect.git"
                display notification "Stoffez's Theme has been installed..." with title "OpenPlex Status"
                delay 0
                do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; sudoersfixbash.bash; installbash.bash; purgesettingsbash.bash"
                if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end try
                end if
                if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "icloud"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "trailers"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "wsj"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                        end if
                    end try
                    if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                        try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; atvsettingsautobash.bash"
                        display notification "Myplex loaded..." with title "OpenPlex Status"
                        delay 0
                        end try
                    end if
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "Shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is not "0" then
                            try
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "serving\\|shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "3" then
                            try
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end try
                        end if
                    end try
                    try
                        -- load custom certs if in use
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
                    end try
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                end if
                if (exists file "Applications:plexconnect_BACKUP:icon.auto" of the startup disk) then
                    try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
                    end try
                end if
            end if
        end tell
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
                        end try
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
                    end if
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        try
                        do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                        do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                        end try
                    end if
                end tell
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/stoffez/PlexConnect.git"
                display notification "No OpenPlex folder detected, this will take AWHILE to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; purgesettingsbash.bash; restart.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "wsj"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                            end if
                        end try
                        if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                            do shell script "sleep 1"
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    try
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end try
                                end if
                            end try
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    try
                                        try
                                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                        end try
                                    end try
                                end if
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    if not (exists folder "usr:local:git:OpenPlex" of the startup disk) then
                                        do shell script "mkdir -p /usr/local/git/OpenPlex" with administrator privileges
                                    end if
                                end if
                            end try
                        end if
                    end if
                end tell
                else
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
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
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; rm -R /Applications/PlexConnect; stopbash.bash; trashbasebash.bash; exit"
                end try
                if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                end if
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/CyberGhost84/PlexConnect.git"
                display notification "CyberGhost84's Theme has been installed..." with title "OpenPlex Status"
                delay 0
                do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; sudoersfixbash.bash; installbash.bash; purgesettingsbash.bash"
                if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end try
                end if
                if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "icloud"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "trailers"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "wsj"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                        end if
                    end try
                    if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                        try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; atvsettingsautobash.bash"
                        display notification "Myplex loaded..." with title "OpenPlex Status"
                        delay 0
                        end try
                    end if
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "Shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is not "0" then
                            try
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "serving\\|shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "3" then
                            try
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end try
                        end if
                    end try
                    try
                        -- load custom certs if in use
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
                    end try
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                end if
                if (exists file "Applications:plexconnect_BACKUP:icon.auto" of the startup disk) then
                    try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
                    end try
                end if
            end if
        end tell
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
                        end try
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
                    end if
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        try
                        do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                        do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                        end try
                    end if
                end tell
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/CyberGhost84/PlexConnect.git"
                display notification "No OpenPlex folder detected, this will take AWHILE to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; purgesettingsbash.bash; restart.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "wsj"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                            end if
                        end try
                        if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                            do shell script "sleep 1"
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    try
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end try
                                end if
                            end try
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    try
                                        try
                                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                        end try
                                    end try
                                end if
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    if not (exists folder "usr:local:git:OpenPlex" of the startup disk) then
                                        do shell script "mkdir -p /usr/local/git/OpenPlex" with administrator privileges
                                    end if
                                end if
                            end try
                        end if
                    end if
                end tell
                else
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
            end if
        end tell
        tell ghostProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerghost_
    
    on buttonhandlerwahlmanjdev_(sender)
        tell wahlmanjProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing Wahlman.J Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; rm -R /Applications/PlexConnect; stopbash.bash; trashbasebash.bash; exit"
                end try
                if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                end if
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj3/PlexConnect.git"
                display notification "Wahlman.J's Theme has been installed..." with title "OpenPlex Status"
                delay 0
                do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; sudoersfixbash.bash; installbash.bash; purgesettingsbash.bash"
                if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end try
                end if
                if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "icloud"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "trailers"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                        set theString to quoted form of "wsj"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                            delay 0
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                        end if
                    end try
                    if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                        try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; atvsettingsautobash.bash"
                        display notification "Myplex loaded..." with title "OpenPlex Status"
                        delay 0
                        end try
                    end if
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "Shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is not "0" then
                            try
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "serving\\|shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "3" then
                            try
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/usr/local/bin/ibaa.bash")
                        set theString to quoted form of "HOME"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "Optimizing new app features..." with title "OpenPlex Status"
                            delay 0
                        end if
                    end try
                    try
                        -- load custom certs if in use
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
                    end try
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                end if
                if (exists file "Applications:plexconnect_BACKUP:icon.auto" of the startup disk) then
                    try
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
                    end try
                end if
            end if
        end tell
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; trashbasebash.bash"
                        end try
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
                    end if
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        try
                        do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                        do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                        end try
                    end if
                end tell
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj3/PlexConnect.git"
                display notification "No OpenPlex folder detected, this will take AWHILE to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; purgesettingsbash.bash; restart.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "icloud"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "iMovie certs loaded, Hijacking iMovie..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "trailers"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                            end if
                        end try
                        try
                            set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                            set theString to quoted form of "wsj"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                            end if
                        end try
                        if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                            do shell script "sleep 1"
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    try
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end try
                                end if
                            end try
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    try
                                        try
                                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                        end try
                                    end try
                                end if
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    if not (exists folder "usr:local:git:OpenPlex" of the startup disk) then
                                        do shell script "mkdir -p /usr/local/git/OpenPlex" with administrator privileges
                                    end if
                                end if
                            end try
                        end if
                    end if
                end tell
                else
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
            end if
        end tell
        tell wahlmanjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwahlmanjdev_
    
    on buttonhandlerwahlmanj_(sender)
        tell wahlmanjProgressBar to startAnimation:me -- another way
        set animated to true
        display notification "Installing Wahlman.J Theme..." with title "OpenPlex Status"
        delay 0
        tell application "Finder"
            if (exists folder "usr:local:git:OP" of the startup disk) then
                try
                    do shell script "rm -R /Applications/PlexConnect; stopbash.bash; trashbasebash.bash; exit"
                end try
                if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                    do shell script "mkdir /Applications/plexconnect_BACKUP"
                end if
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj2/PlexConnect.git"
                display notification "Wahlman.J's Theme has been installed..." with title "OpenPlex Status"
                delay 0
                do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "sudoersfixbash.bash; installbash.bash; purgesettingsbash.bash"
                if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end try
                end if
                if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                    try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                    end try
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
                        set theString to quoted form of "wsj"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is "2" then
                            display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                            delay 0
                            do shell script "createwsjbash.bash"
                        end if
                    end try
                    if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                        try
                        do shell script "atvsettingsautobash.bash"
                        display notification "Myplex loaded..." with title "OpenPlex Status"
                        delay 0
                        end try
                    end if
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "Shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is not "0" then
                            try
                                do shell script "afplay /System/Library/Sounds/Basso.aiff"
                            end try
                        end if
                    end try
                    try
                        set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                        set theString to quoted form of "serving\\|shutting"
                        set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                        if searchResult is equal to "3" then
                            try
                                do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                            end try
                        end if
                    end try
                    try
                        -- load custom certs if in use
                        do shell script "restartbash.bash"
                    end try
                    else if not (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                end if
                if (exists file "Applications:plexconnect_BACKUP:icon.auto" of the startup disk) then
                    try
                        do shell script "icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
                        do shell script "icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
                    end try
                end if
            end if
        end tell
        tell application "Finder"
            if not (exists folder "usr:local:git:OP" of the startup disk) then
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "stopbash.bash"
                            do shell script "trashbasebash.bash"
                        end try
                        else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        try
                            do shell script "mkdir /Applications/plexconnect_BACKUP"
                            do shell script "cp -R /Applications/PlexConnect/* /Applications/plexconnect_BACKUP"
                            do shell script "rm -R /Applications/PlexConnect"
                            onerror
                        end try
                    end if
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        try
                        do shell script "chmod -R 777 /Applications/PlexConnect" with administrator privileges
                        do shell script "rm -R /Applications/PlexConnect" with administrator privileges
                        end try
                    end if
                end tell
                do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj2/PlexConnect.git"
                display notification "No OpenPlex folder detected, this will take AWHILE to install..." with title "OpenPlex Status"
                delay 0
                try
                    do shell script "rm -R ~/Library/Application\\ Support/OpenPlex" with administrator privileges
                end try
                do shell script "cd ~/Library/Application\\ Support; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/wahlmanj/OpenPlex.git"
                try
                    do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
                end try
                do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
                do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
                do shell script "/Applications/PlexConnect/update/OSX/createplist.bash" with administrator privileges
                do shell script "purgesettingsbash.bash; restart.bash"
                do shell script "mkdir -p /usr/local/git/OP" with administrator privileges
                tell application "Finder"
                    if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect"
                    end if
                    if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                        try
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.cer /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.pem /Applications/PlexConnect/assets/certificates"
                        do shell script "cp /Applications/plexconnect_BACKUP/trailers.key /Applications/PlexConnect/assets/certificates"
                        end try
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
                            set theString to quoted form of "wsj"
                            set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                            if searchResult is "2" then
                                display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                                delay 0
                                do shell script "createwsjbash.bash"
                            end if
                        end try
                        if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                            do shell script "sleep 1"
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "Shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is not "0" then
                                    try
                                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                                    end try
                                end if
                            end try
                            try
                                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                                set theString to quoted form of "serving\\|shutting"
                                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                                if searchResult is equal to "3" then
                                    try
                                        try
                                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                                        end try
                                    end try
                                end if
                                if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                                    if not (exists folder "usr:local:git:OpenPlex" of the startup disk) then
                                        do shell script "mkdir -p /usr/local/git/OpenPlex" with administrator privileges
                                    end if
                                end if
                            end try
                        end if
                    end if
                end tell
                else
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
            end if
        end tell
        tell wahlmanjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwahlmanj_
    
    --Hijack Tab
    
    on buttonhandlercertstut_(sender)
        set theURL to "https://www.youtube.com/watch?v=PvyQhwYfECE"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlercertstut_
    
    on buttonhandlerip_(sender)
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        display notification  theLocalNode with title "Mac IP Address"
        delay 0
    end buttonhandlerip_
    
    on buttonhandlerSSL_(sender)
        try
            set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            set theLocalNode to the last word of theIP
            on error
            set theLocalNode to "Can't get Local IP"
        end try
        display notification  theLocalNode & "/trailers.cer" with title "Cert URL"
        delay 0
    end buttonhandlerSSL_
    
    on buttonhandlertrailers_(sender)
        tell trailersProgressBar to startAnimation:me -- another way
        set animated to true
        try
            display notification "Creating Trailers certs if needed and setting hijack to Trailers..." with title "OpenPlex Status"
            delay 0
            try
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
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
                    try
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end try
                end if
            end try
            
            try
                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                set theString to quoted form of "serving\\|shutting"
                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                if searchResult is equal to "3" then
                    try
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end try
                end if
            end try
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
        end try
        tell trailersProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlertrailers_
    
    on buttonhandlerimovie_(sender)
        tell imovieProgressBar to startAnimation:me -- another way
        set animated to true
        try
            display notification "Creating iMovie certs if needed and setting hijack to iMovie..." with title "OpenPlex Status"
            delay 0
            try
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
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
                    try
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end try
                end if
            end try
            
            try
                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                set theString to quoted form of "serving\\|shutting"
                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                if searchResult is equal to "3" then
                    try
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end try
                end if
            end try
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
        end try
        tell imovieProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerimovie_
    
    on buttonhandlerwsj_(sender)
        tell wsjProgressBar to startAnimation:me -- another way
        set animated to true
        try
            display notification "Creating WSJ certs if needed and setting hijack to WSJ..." with title "OpenPlex Status"
            delay 0
            try
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
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
                    try
                        do shell script "afplay /System/Library/Sounds/Basso.aiff"
                    end try
                end if
            end try
            
            try
                set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                set theString to quoted form of "serving\\|shutting"
                set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                if searchResult is equal to "3" then
                    try
                        do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                    end try
                end if
            end try
            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                delay 0
            end if
        end try
        tell wsjProgressBar to stopAnimation:me -- another way
        set animated to false
    end buttonhandlerwsj_
    
    --Plex Icon Tab
    
    on buttonhandlericontut_(sender)
        set theURL to "https://www.youtube.com/watch?v=Sq9I16TnjUc"
        tell application "Safari" to make new document with properties {URL:theURL}
        do shell script "show Safari"
    end buttonhandlericontut_
    
    on buttonhandlerios7greyplexicon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
            do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/grey/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/grey/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios7greyplexicon_
    
    on buttonhandlerios7blackplexicon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/black/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/black/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios7blackplexicon_
    
    on buttonhandlerios7gradientplexicon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/gradient/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/gradient/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios7gradientplexicon_
    
    on buttonhandlerios7plexconnecticon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/plex/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios7/plex/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios7plexconnecticon_
    
    on buttonhandlerios8greyplexicon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/grey/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/grey/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios8greyplexicon_
    
    on buttonhandlerios8blackplexicon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/black/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/black/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios8blackplexicon_
    
    on buttonhandlerios8gradientplexicon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/gradient/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/gradient/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios8gradientplexicon_
    
    on buttonhandlerios8plexconnecticon_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash"
        tell application "Finder"
            if not (exists folder "Applications:PlexConnect:assets:icons" of the startup disk) then
                do shell script "mkdir /Applications/PlexConnect/assets/icons"
            end if
        end tell
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/plex/icon@1080.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/ios8/plex/icon@720.png /Applications/PlexConnect/assets/icons"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/WebServer.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/Settings.py /Applications/PlexConnect"
        do shell script "cp /Applications/PlexConnect/update/OSX/icon/icon/DNSServer.py /Applications/PlexConnect"
        delay 4
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
        display notification "Custom icon ready for upload..." with title "PlexConnect Status"
        delay 0
    end buttonhandlerios8plexconnecticon_
    
    --Advanced Tab
    
    on buttonhandlerdelcerts_(sender)
        display notification "Certs deleted from PlexConnect folder..." with title "OpenPlex Status"
        delay 0
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.pem"
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.key"
        do shell script "rm /Applications/PlexConnect/assets/certificates/trailers.cer"
    end buttonhandlerdelcerts_
    
    on buttonhandlerdellog_(sender)
        tell application "Finder"
            if (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "PlexConnect.log deleted..." with title "OpenPlex Status"
                delay 0
                do shell script "rm /Applications/PlexConnect/PlexConnect.log"
                else if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                display notification "No Log Detected..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerdellog_
    
    on buttonhandlerbackupfolder_(sender)
        tell application "Finder"
            if (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                do shell script "open /Applications/plexconnect_BACKUP"
                else if not (exists folder "Applications:plexconnect_BACKUP" of the startup disk) then
                display notification "No backup folder detected..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerbackupfolder_
    
    on buttonhandleropenbase_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                do shell script "open /Applications/PlexConnect"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "No Theme Detected..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandleropenbase_
    
    on buttonhandlertrash_(sender)
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "PlexConnect deleted..." with title "OpenPlex Status"
                delay 0
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; trashbasebash.bash; stopbash.bash; trashbasebash.bash"
                else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                display notification "Cannot delete, no folder detected..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlertrash_
    
    on buttonhandlercertfolder_(sender)
        try
            do shell script "open /Applications/PlexConnect/assets/certificates"
            on error
            display notification "No Theme Detected..." with title "OpenPlex Status"
            delay 0
        end try
    end buttonhandlercertfolder_
    
    on buttonhandlersettingscfg_(sender)
        tell application "Finder"
            if (exists file "Applications:PlexConnect:Settings.cfg" of the startup disk) then
                try
                    do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; settingsbash.bash; open /Applications/PlexConnect/Settings.cfg"
                    on error
                    display notification "No program set to open .cfg files..." with title "OpenPlex Status"
                    delay 0
                end try
                else if not (exists file "Applications:PlexConnect:Settings.cfg" of the startup disk) then
                display notification "No Theme Detected..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlersettingscfg_
    
    on buttonhandlerloadcerts_(sender)
        tell application "Finder"
            if (exists file "Applications:plexconnect_BACKUP:trailers.cer" of the startup disk) then
                display notification "Restoring certs..." with title "OpenPlex Status"
                delay 0
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
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createimoviebash.bash"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                    set theString to quoted form of "trailers"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is "2" then
                        display notification "Trailers certs loaded, Hijacking Trailers..." with title "OpenPlex Status"
                        delay 0
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createcertbash.bash"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/assets/certificates/trailers.cer")
                    set theString to quoted form of "wsj"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is "2" then
                        display notification "WSJ certs loaded, Hijacking WSJ..." with title "OpenPlex Status"
                        delay 0
                        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createwsjbash.bash"
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        try
                            do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        end try
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        try
                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                        end try
                    end if
                end try
                else if not (exists file "Applications:plexconnect_BACKUP:trailers.cer" of the startup disk) then
                display notification "Backup certs first..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerloadcerts_
    
    on buttonhandlerbackupsettings_(sender)
        display notification "Backing up Settings.cfg..." with title "OpenPlex Status"
        delay 0
        do shell script "cp /Applications/PlexConnect/Settings.cfg /Applications/plexconnect_BACKUP"
    end buttonhandlerbackupsettings_
    
    on buttonhandlerloadsettings_(sender)
        --Needs work to remove password only
        display notification "Restoring Settings.cfg..." with title "OpenPlex Status"
        delay 0
        do shell script "cp /Applications/plexconnect_BACKUP/Settings.cfg /Applications/PlexConnect" with administrator privileges
    end buttonhandlerloadsettings_
    
    on buttonhandlerbackupfanart_(sender)
        --may remove button eventually
        tell application "Finder"
            if (exists folder "Applications:PlexConnect_BACKUP:fanartcache" of the startup disk) then
                display notification "Fanart backed up..." with title "OpenPlex Status"
                delay 0
                do shell script "rm -R /Applications/plexconnect_BACKUP/fanartcache"
                do shell script "mkdir /Applications/plexconnect_BACKUP/fanartcache"
                do shell script "cp -R /Applications/PlexConnect/assets/fanartcache/* /Applications/plexconnect_BACKUP/fanartcache"
                else if not (exists folder "Applications:PlexConnect_BACKUP:fanartcache" of the startup disk) then
                try
                    display notification "Fanart backed up..." with title "OpenPlex Status"
                    delay 0
                    do shell script "mkdir /Applications/plexconnect_BACKUP/fanartcache"
                    do shell script "cp -R /Applications/PlexConnect/assets/fanartcache/* /Applications/plexconnect_BACKUP/fanartcache"
                    onerror
                end try
            end if
        end tell
    end buttonhandlerbackupfanart_
    
    on buttonhandlerfanartfolder_(sender)
        --may remove button eventually
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                if (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
                    do shell script "open /Applications/PlexConnect/assets/fanartcache"
                    else if not (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
                    display notification "No fanart folder Detected..." with title "OpenPlex Status"
                    delay 0
                    else if not (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                    display notification "No theme detected..." with title "OpenPlex Status"
                    delay 0
                end if
            end if
        end tell
    end buttonhandlerfanartfolder_
    
    on buttonhandlerloadbackupfanart_(sender)
        --Needs work to remove password only --may remove button eventually
        tell application "Finder"
            if (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
                do shell script "cp -R /Applications/plexconnect_BACKUP/fanartcache/* /Applications/PlexConnect/assets/fanartcache" with administrator privileges
                else if not (exists folder "Applications:PlexConnect:assets:fanartcache" of the startup disk) then
            end if
        end tell
        display notification "Fanart Loaded..." with title "OpenPlex Status"
        delay 0
    end buttonhandlerloadbackupfanart_
    
    on buttonhandlerbackupATVSettings_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; sleep 4"
        tell application "Finder"
            if (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                display notification "ATVSettings.cfg backed up..." with title "OpenPlex Status"
                delay 0
                do shell script "cp /Applications/PlexConnect/ATVSettings.cfg /Applications/plexconnect_BACKUP"
                else if not (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                try
                    if (exists folder "Applications:PlexConnect:update:OSX" of the startup disk) then
                        do shell script "cp /Applications/PlexConnect/ATVSettings.cfg /Applications/plexconnect_BACKUP"
                        display notification "Exit and/or Open aTV hijack to load PlexConnect Settings..." with title "OpenPlex Status"
                        delay 0
                    end if
                end try
            end if
            if (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                display notification "ATVSettings.cfg backed up..." with title "OpenPlex Status"
                delay 0
                do shell script "cp /Applications/PlexConnect/ATVSettings.cfg /Applications/plexconnect_BACKUP"
                else if not (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                display notification "No ATVSettings.cfg present..." with title "OpenPlex Status"
                delay 0
            end if
            if (exists file "Applications:plexconnect_BACKUP:ATVSettings.cfg" of the startup disk) then
                display notification "Exit and/or Open aTV hijack to load PlexConnect Settings..." with title "OpenPlex Status"
                delay 0
            end if
            if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                display notification "No Certs present, Choose Hijack..." with title "PlexConnect Status"
                delay 0
            end if
        end tell
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; startbash.bash"
    end buttonhandlerbackupATVSettings_
    
    on buttonhandlerloadATVSettings_(sender)
        tell application "Finder"
            if (exists file "Applications:plexconnect_BACKUP:ATVSettings.cfg" of the startup disk) then
                display notification "Exit and/or Open aTV hijack to restore PlexConnect Settings..." with title "OpenPlex Status"
                delay 0
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restoreatvsettingsbash.bash"
                -- allow PlexConnect.log to save and repopulate (sleep 4)
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        else
                        display notification "No Theme Installed..." with title "OpenPlex Status"
                        delay 0
                    end if
                end tell
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        tell application "Finder"
                            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                                delay 0
                            end if
                        end tell
                        else if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "OpenPlex Status"
                        delay 0
                    end if
                end tell
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        try
                            do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        end try
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        try
                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                        end try
                    end if
                end try
                else if not (exists file "Applications:plexconnect_BACKUP:ATVSettings.cfg" of the startup disk) then
                display notification "Backup ATVSettings.cfg first..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerloadATVSettings_
    
    on buttonhandlerdeleteATVSettings_(sender)
        tell application "Finder"
            if (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                display notification "Exit and/or Open aTV hijack to restore default PlexConnect Settings..." with title "OpenPlex Status"
                delay 0
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; stopbash.bash; sleep 5; purgesettingsbash.bash; startbash.bash; sleep 4"
                -- allow PlexConnect.log to save and repopulate (sleep 4)
                tell application "Finder"
                    if (exists folder "Applications:PlexConnect" of the startup disk) then
                        else
                        display notification "No Theme Installed..." with title "OpenPlex Status"
                        delay 0
                    end if
                end tell
                tell application "Finder"
                    if (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        tell application "Finder"
                            if not (exists file "Applications:PlexConnect:PlexConnect.log" of the startup disk) then
                                display notification "PIL is not installed or theme is experiencing issues..." with title "OpenPlex Status"
                                delay 0
                            end if
                        end tell
                        else if not (exists file "Applications:PlexConnect:assets:certificates:trailers.cer" of the startup disk) then
                        display notification "No Certs present, Choose Hijack..." with title "OpenPlex Status"
                        delay 0
                    end if
                end tell
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "Shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is not "0" then
                        try
                            do shell script "afplay /System/Library/Sounds/Basso.aiff"
                        end try
                    end if
                end try
                
                try
                    set fileAsPOSIX to (POSIX path of "/Applications/PlexConnect/PlexConnect.log")
                    set theString to quoted form of "serving\\|shutting"
                    set searchResult to do shell script "/usr/bin/grep -ic " & theString & space & quoted form of fileAsPOSIX
                    if searchResult is equal to "3" then
                        try
                            do shell script "afplay /System/Library/Sounds/Submarine.aiff"
                        end try
                    end if
                end try
                else if not (exists file "Applications:PlexConnect:ATVSettings.cfg" of the startup disk) then
                display notification "No ATVSettings.cfg present..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerdeleteATVSettings_
    
    on buttonhandlerbackupall_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; backupbash.bash"
        display notification "All available settings Backed up..." with title "OpenPlex Status"
        delay 0
    end buttonhandlerbackupall_
    
    on buttonhandlerrestoreall_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restorebash.bash"
        display notification "All available settings restored..." with title "OpenPlex Status"
        delay 0
    end buttonhandlerrestoreall_
    
    on buttonhandlerbackupcerts_(sender)
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.cer /Applications/plexconnect_BACKUP"
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.pem /Applications/plexconnect_BACKUP"
        do shell script "cp /Applications/PlexConnect/assets/certificates/trailers.key /Applications/plexconnect_BACKUP"
        display notification "Certs Backed up..." with title "OpenPlex Status"
        delay 0
    end buttonhandlerbackupcerts_
    
    --Extras Tab
    
    on buttonhandlertrashcan_(sender)
        do shell script "defaults write com.apple.finder WarnOnEmptyTrash -bool false"
    end buttonhandlertrashcan_

    on buttonhandlerbootlock_(sender)
        tell application "Finder"
            if not (exists file "Library:LaunchAgents:com.lock.plist" of the startup disk) then
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; bootlockbash.bash"
                display notification "Automatic app loading & lock screen enabled..." with title "OpenPlex Status"
                else
                display notification "Automatic app loading & lock screen already enabled..." with title "OpenPlex Status"
            end if
        end tell
    end buttonhandlerbootlock_
    
    on buttonhandlercustomicons_(sender)
        try
            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon/backup.png /Applications/plexconnect_BACKUP"
            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; icon.bash /Applications/PlexConnect/update/OSX/icon@720.png /Applications/PlexConnect"
            do shell script "cd /Applications/plexconnect_BACKUP; touch icon.auto"
        end try
    end buttonhandlercustomicons_
    
    on buttonhandlerfixplists_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; auto.bash" with administrator privileges
    end buttonhandlerfixplists_
    
    on buttonhandlergitreset_(sender)
        try
            set y to do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; cd /Applications/PlexConnect; git reset --soft HEAD^; git reset --hard"
            display notification "PlexConnect downgraded 1 version (commit), Exit hijacked app on aTV..." & y with title "PlexConnect Status"
            delay 0
            do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; restartbash.bash"
            on error
            display notification "PlexConnect folder corrupted reinstall theme" with title "OpenPlex Status"
            delay 0
        end try
    end buttonhandlergitreset_
    
    on buttonhandlerstorefront_(sender)
        display notification "Downloading current aTV storeFront (aTV homescreen apps config)..." with title "OpenPlex Status"
        delay 0
        try
            do shell script "/Applications/PlexConnect/update/OSX/storefront.bash"
            do shell script "open /Applications/PlexConnect/update/OSX/storeFront"
            on error
            display notification "No Theme Detected..." with title "OpenPlex Status"
            delay 0
        end try
    end buttonhandlerstorefront_
    
    on buttonhandlerautocerts_(sender)
        tell application "Finder"
        if not (exists file "Applications:plexconnect_BACKUP:trailers.cer" of the startup disk) then
            display notification "Backup certs first..." with title "OpenPlex Status"
            else
            if (exists file "Applications:plexconnect_BACKUP:trailers.auto" of the startup disk) then
                do shell script "cd /Applications/plexconnect_BACKUP; rm trailers.auto"
                display notification "Automatic Cert loading Disabled..." with title "OpenPlex Status"
                delay 0
                else
                do shell script "cd /Applications/plexconnect_BACKUP; touch trailers.auto"
                display notification "Automatic Cert loading Enabled..." with title "OpenPlex Status"
                delay 0
            end if
            end if
        end tell
    end buttonhandlerautocerts_
    
    on buttonhandlerautoupdate_(sender)
        tell application "Finder"
            if (exists file "Library:LaunchDaemons:com.plex.plexconnect.auto.plist" of the startup disk) then
                do shell script "cd /Library/LaunchDaemons; launchctl unload com.plex.plexconnect.auto.plist; rm com.plex.plexconnect.auto.plist; cd /Applications/plexconnect_BACKUP; rm update.auto" with administrator privileges
                display notification "Automatic GitHub Updates Disabled..." with title "OpenPlex Status"
                delay 0
                else
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; createautobash.bash; cd /Applications/plexconnect_BACKUP; touch update.auto"
                display notification "Automatic GitHub Updates Enabled..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerautoupdate_
    
    on buttonhandlerautomyplex_(sender)
        tell application "Finder"
            if (exists file "Applications:plexconnect_BACKUP:myplex.auto" of the startup disk) then
                do shell script "cd /Applications/plexconnect_BACKUP; rm myplex.auto"
                display notification "Automatic MyPlex loading Disabled..." with title "OpenPlex Status"
                delay 0
                else
                do shell script "cd /Applications/plexconnect_BACKUP; touch myplex.auto"
                display notification "Automatic MyPlex loading Enabled..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerautomyplex_
    
    on buttonhandlerautosettings_(sender)
        tell application "Finder"
            if (exists file "Applications:plexconnect_BACKUP:settings.auto" of the startup disk) then
                do shell script "cd /Applications/plexconnect_BACKUP; rm settings.auto"
                display notification "Automatic Settings.cfg loading Disabled..." with title "OpenPlex Status"
                delay 0
                else
                do shell script "cd /Applications/plexconnect_BACKUP; touch settings.auto"
                display notification "Automatic Settings.cfg loading Enabled..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerautosettings_
    
    on buttonhandlerloghigh_(sender)
        do shell script "cd /Applications/PlexConnect; sed -i '' 's/Normal/High/g' Settings.cfg"
    end buttonhandlerloghigh_
    
    on buttonhandlerlognormal_(sender)
        do shell script "cd /Applications/PlexConnect; sed -i '' 's/High/Normal/g' Settings.cfg"
    end buttonhandlerlognormal_
    
    on buttonhandlerplexweb_(sender)
        try
            --set theIP to (do shell script "ifconfig | grep inet | grep -v inet6 | cut -d\" \" -f2")
            --set theLocalNode to the last word of theIP
            --set tURL to "http://" & theLocalNode & ":32400/web/index.html#!/dashboard"
            set theURL to "http://127.0.0.1:32400/web"
            tell application "Safari" to make new document with properties {URL:theURL}
            do shell script "show Safari"
            on error
            display notification "Can't get Local IP..." with title "OpenPlex Status"
            delay 0
        end try
    end buttonhandlerplexweb_
    
    on buttonhandlermuteboot_(sender)
        do shell script "sudo defaults write com.apple.loginwindow LoginHook /usr/local/bin/unmuteboot.bash" with administrator privileges
        do shell script "sudo defaults write com.apple.loginwindow LogoutHook /usr/local/bin/muteboot.bash" with administrator privileges
        display notification "Boot startup sound muted..." with title "OS X Status"
        delay 0
    end buttonhandlermuteboot_
    
    on buttonhandlerpillowinstaller_(sender)
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:pillow.bash" of the startup disk) then
                do shell script "quit Terminal; sleep 2"
                do shell script "open /Applications/Utilities/Terminal.app"
                tell application "Terminal"
                    activate
                    activate
                    activate
                    tell application "System Events" to keystroke "pillow.bash"
                    tell application "System Events" to keystroke return
                end tell
                display notification "Enter password to install pillow if command line tools have beeen installed..." with title "OpenPlex Status"
                delay 0
                else
                display notification "Install a theme before installing pillow..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerpillowinstaller_
    
    on buttonhandlerairplayinstaller_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; quit Terminal; sleep 2"
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; open /Applications/Utilities/Terminal.app"
        tell application "Terminal"
            activate
            activate
            activate
            tell application "System Events" to keystroke "/Applications/PlexConnect/update/OSX/shairport.bash"
            tell application "System Events" to keystroke return
        end tell
        display notification "Follow instructions to enable Airplay" with title "Airplay status"
        delay 0
    end buttonhandlerairplayinstaller_
    
    on buttonhandleruas_(sender)
        do shell script "cd /Applications; export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; git clone https://github.com/mikedm139/UnSupportedAppstore.bundle.git; git clone https://github.com/wahlmanj/unsupported.git"
        do shell script "chmod +x /applications/unsupported/unsupported.bash" with administrator privileges
        do shell script "/applications/unsupported/unsupported.bash" with administrator privileges
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; unsupported2.bash"
        do shell script "chmod +x /applications/unsupported/copy.bash" with administrator privileges
        do shell script "/applications/unsupported/copy.bash" with administrator privileges
        display notification "Unsupported AppStore installed..." with title "OpenPlex Status"
        delay 0
    end buttonhandleruas_
    
    on buttonhandlerwol_(sender)
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; wol.bash" with administrator privileges
        display notification "aTV WOL Plists installed..." with title "OpenPlex Status"
        delay 0
    end buttonhandlerwol_
    
    --WebConnect Tab
    
    on buttonhandlerinstallwc6_(sender)
        try
            do shell script "cp /Applications/PlexConnect/update/OSX/httpd/10.6/httpd.conf /etc/apache2" with administrator privileges
            on error
            display notification "Install theme then try again" with title "OpenPlex Status"
            delay 0
        end try
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:httpd:10.6:httpd.conf" of the startup disk) then
        try
            do shell script "sudo apache start" with administrator privileges
        end try
        do shell script "sudo apachectl restart" with administrator privileges
        display notification "WebConnect Enabled on 10.6.x..." with title "OpenPlex Status"
        delay 0
        end if
        end tell
    end buttonhandlerinstallwc6_
    
    on buttonhandlerinstallwc7_(sender)
        try
            do shell script "cp /Applications/PlexConnect/update/OSX/httpd/10.7/httpd.conf /etc/apache2" with administrator privileges
            on error
            display notification "Install theme then try again" with title "OpenPlex Status"
            delay 0
        end try
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:httpd:10.7:httpd.conf" of the startup disk) then
                try
                    do shell script "sudo apache start" with administrator privileges
                end try
                do shell script "sudo apachectl restart" with administrator privileges
                display notification "WebConnect Enabled on 10.7.x..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerinstallwc7_
    
    on buttonhandlerinstallwc8or9_(sender)
        try
            do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
        end try
        do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
        do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; installbash.bash" with administrator privileges
        try
            do shell script "cp /Applications/PlexConnect/update/OSX/httpd.conf /etc/apache2" with administrator privileges
            on error
            display notification "Install theme then try again" with title "OpenPlex Status"
            delay 0
        end try
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:httpd.conf" of the startup disk) then
                do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; websharingbash.bash"
                display notification "Install pref pane and turn on WebSharing to enable WebConnect on 10.8.x or 10.9.x..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerinstallwc8or9_
    
    on buttonhandlerinstallwc10_(sender)
        try
            do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
        end try
        do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
        do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; installbash.bash" with administrator privileges
        try
            do shell script "cp /Applications/PlexConnect/update/OSX/10.10/httpd.conf /etc/apache2" with administrator privileges
            on error
            display notification "Install theme then try again" with title "OpenPlex Status"
            delay 0
        end try
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:10.10:httpd.conf" of the startup disk) then
                try
                    do shell script "sudo apachectl start" with administrator privileges
                end try
                do shell script "sudo apachectl restart" with administrator privileges
                display notification "WebConnect Enabled..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerinstallwc10_
    
    on buttonhandlerinstallwc10beta_(sender)
        try
            do shell script "cp -R ~/Library/Application\\ Support/OpenPlex/update /Applications/PlexConnect"
        end try
        do shell script "/Applications/PlexConnect/update/OSX/sudoers.bash"
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "chmod +x /Applications/PlexConnect/update/OSX/sudoers.bash" with administrator privileges
        do shell script "/Applications/PlexConnect/update/OSX/install.bash" with administrator privileges
        do shell script "cp /Applications/PlexConnect/update/OSX/sudoers2 /etc/sudoers; chmod 440 /etc/sudoers" with administrator privileges
        do shell script "export PATH=/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH; installbash.bash" with administrator privileges
        try
            do shell script "cp /Applications/PlexConnect/update/OSX/10.10.5/httpd.conf /etc/apache2" with administrator privileges
            on error
            display notification "Install theme then try again" with title "OpenPlex Status"
            delay 0
        end try
        tell application "Finder"
            if (exists file "Applications:PlexConnect:update:OSX:10.10.5:httpd.conf" of the startup disk) then
                try
                    do shell script "sudo apachectl start" with administrator privileges
                end try
                do shell script "sudo apachectl restart" with administrator privileges
                display notification "WebConnect Enabled..." with title "OpenPlex Status"
                delay 0
            end if
        end tell
    end buttonhandlerinstallwc10beta_
    
    on buttonhandlerwcview_(sender)
        set tIP to do shell script "ifconfig en0|grep 'inet '|cut -d ' ' -f 2"
        set tURL to "http://" & tIP & ":1234/cgi-bin/webconnect.cgi"
        tell application "Safari" to make new document with properties {URL:tURL}
        do shell script "show Safari"
    end buttonhandlerwcview_
    
    
end script