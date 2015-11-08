## Save PlexConnect base path
cd /Applications/PlexConnect/update/OSX
DefaultPath=${PWD}

## This command removes the beginning / in users home dir //\//\\/}/**
## Replace __HOME__in default WebConnect scripts
## Save directly to the /usr/local/bin folder
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/appweb.bash" > /usr/local/bin/appweb.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/cyberghost.bash" > /usr/local/bin/cyberghost.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/ibaa.bash" > /usr/local/bin/ibaa.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/stoffez.bash" > /usr/local/bin/stoffez.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/falco.bash" > /usr/local/bin/falco.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/wahlmanj.bash" > /usr/local/bin/wahlmanj.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/uninstall.bash" > /usr/local/bin/uninstall.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/updatewc.bash" > /usr/local/bin/updatewc.bash

## Modify script permissions so they can be ran from WebConnect
chmod 4755 /usr/local/bin/appweb.bash
chmod 4755 /usr/local/bin/cyberghost.bash
chmod 4755 /usr/local/bin/ibaa.bash
chmod 4755 /usr/local/bin/stoffez.bash
chmod 4755 /usr/local/bin/falco.bash
chmod 4755 /usr/local/bin/wahlmanj.bash
chmod 4755 /usr/local/bin/updatewc.bash

## Modify script permissions so everything can be removed if desired
chmod +x /usr/local/bin/uninstall.bash