#!/bin/sh
OSX_VERS=$(sw_vers -productVersion | awk -F "." '{print $2}')
 
if [ "$OSX_VERS" -eq 6 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 7 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 8 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.7/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 9 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 10 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 11 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
elif [ "$OSX_VERS" -eq 12 ]; then
killall OpenPlex
cd /Applications
rm -Rf OpenPlex.app
cp ~/Library/Application\ Support/OpenPlex/10.6/OpenPlex.zip /Applications
unzip OpenPlex.zip
rm OpenPlex.zip
open OpenPlex.app
killall updater
echo $OSX_VERS
fi