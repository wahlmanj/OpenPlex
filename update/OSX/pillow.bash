#!/bin/bash

cd /Applications/PlexConnect/update/OSX
yes | ./pillow

echo 'IF YOU ENCOUNTER ERRORS WITH PILLOW NOT INSTALLING DOWNGRADE YOUR PYTHON TO 2.7.2 FROM THE PYTHON WEBSITE THEN TRY THESE COMMANDS IN A TERMINAL SESSION'
echo ' '
echo 'sudo /Library/Frameworks/Python.framework/Versions/2.7/bin/easy_install-2.7 pip'
echo 'sudo /Library/Frameworks/Python.framework/Versions/2.7/bin/easy_install-2.7 pillow'
echo 'sudo /usr/bin/easy_install-2.7 pip'
echo 'sudo /usr/bin/easy-install-2.7 pillow'
echo ' '
echo 'IF THIS FIXES IT YOU CAN RUN THE OPENPLEX INSTALLER AGAIN OR UPDATE TO 2.7.9 DIRECTLY FROM THE PYTHON WEBSITE'
echo ' '
echo ' '
echo 'Ignore this fix if the above says Successfully installed pillow'
echo 'Close the terminal window to continue installing PlexConnect...'
