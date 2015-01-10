## Save PlexConnect base path
cd /Applications/PlexConnect/update/OSX
DefaultPath=${PWD}

## This command removes the beginning / in users home dir //\//\\/}/**
## Replace __HOME__in default WebConnect scripts
## Save directly to the /usr/bin folder
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/appweb.bash" > /usr/bin/appweb.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/cyberghost.bash" > /usr/bin/cyberghost.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/ibaa.bash" > /usr/bin/ibaa.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/stoffez.bash" > /usr/bin/stoffez.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/falco.bash" > /usr/bin/falco.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/wahlmanj.bash" > /usr/bin/wahlmanj.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/uninstall.bash" > /usr/bin/uninstall.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/updatewc.bash" > /usr/bin/updatewc.bash

## Modify script permissions so they can be ran from WebConnect
chmod 4755 /usr/bin/appweb.bash
chmod 4755 /usr/bin/cyberghost.bash
chmod 4755 /usr/bin/ibaa.bash
chmod 4755 /usr/bin/stoffez.bash
chmod 4755 /usr/bin/falco.bash
chmod 4755 /usr/bin/wahlmanj.bash
chmod 4755 /usr/bin/updatewc.bash