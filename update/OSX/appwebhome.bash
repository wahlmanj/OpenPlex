## replace __USERNAME__in default appweb.bash **this command removes the beginning / in users home dir //\//\\/}/**
## save directly to the /usr/bin folder
cd /Applications/PlexConnect/update/OSX
DefaultPath=${PWD}
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/appweb.bash" > /usr/bin/appweb.bash
chmod 4755 /usr/bin/appweb.bash