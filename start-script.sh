#!/usr/bin/env bash

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Bqj4Hgukj3MSzMJOXMlh78KUxhBViPXP' -O debian-post-install.tar

tar -xvf debian-post-install.tar

cd debian-post-install/

wget -c https://raw.githubusercontent.com/thiagoneo/debian-postinstall/main/script.sh
wget -c https://raw.githubusercontent.com/thiagoneo/debian-postinstall/main/pos-reboot.sh

chmod +x script.sh
chmod +x pos-reboot.sh

bash script.sh
