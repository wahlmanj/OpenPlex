## save directly to the /usr/bin folder
cd /Applications/PlexConnect/update/OSX
DefaultPath=${PWD}

sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/cyberghost.bash" > /usr/bin/cyberghost.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/ibaa.bash" > /usr/bin/ibaa.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/stoffez.bash" > /usr/bin/stoffez.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/falco.bash" > /usr/bin/falco.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/wahlmanj.bash" > /usr/bin/wahlmanj.bash
sed -e "s/__HOME__/${HOME//\//\\/}/" "${DefaultPath}/updatewc.bash" > /usr/bin/updatewc.bash

chmod 4755 /usr/bin/cyberghost.bash
chmod 4755 /usr/bin/ibaa.bash
chmod 4755 /usr/bin/stoffez.bash
chmod 4755 /usr/bin/falco.bash
chmod 4755 /usr/bin/wahlmanj.bash
chmod 4755 /usr/bin/updatewc.bash