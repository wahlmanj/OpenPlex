#!/bin/sh
OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')

if [ "$OSX_VERS" -eq 6 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 7 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 8 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 9 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 10 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
installbash.bash
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 11 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 12 ]; then
if grep -q '/usr/local/bin' '/etc/paths'; then echo exists; else echo '/usr/local/bin' >> /etc/paths; fi
killall OpenPlex
killall opener
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
installbash.bash
cd /usr/local/bin; curl -LOk https://github.com/wahlmanj/opener/raw/master/opener.zip; ditto -xk opener.zip /usr/local/bin; open /usr/local/bin/opener.app; sleep 2; killall opener; rm /usr/local/bin/opener.zip; rm -R /usr/local/bin/opener.app
killall updater
echo $OSX_VERS
fi