#!/bin/bash

cd /Applications/PlexConnect/update/OSX
yes | ./pillow

echo 'If you encounter errors with pillow not working try these commands in a terminal'
echo 'sudo /usr/bin/easy_install-2.7 pip'
echo 'sudo /usr/bin/easy-install-2.7 pillow'
echo 'Ignore this fix if the above says pillow was successfully installed'
echo 'Close the terminal window to continue installing...'
