#!/usr/bin/env bash

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Bqj4Hgukj3MSzMJOXMlh78KUxhBViPXP' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1Bqj4Hgukj3MSzMJOXMlh78KUxhBViPXP" -O debian-post-install.tar && rm -rf /tmp/cookies.txt

tar -xvf debian-post-install.tar

cd debian-post-install/

wget -c https://raw.githubusercontent.com/thiagoneo/debian-postinstall/main/script.sh
wget -c https://raw.githubusercontent.com/thiagoneo/debian-postinstall/main/pos-reboot.sh

chmod +x script.sh
chmod +x pos-reboot.sh

bash script.sh
