#!/usr/bin/env bash

wget https://github.com/thiagoneo/debian-postinstall/archive/refs/tags/2021-12-30.tar.gz
tar -xzvf 2021-12-30.tar.gz
cd debian-postinstall-2021-12-30/
chmod +x *.sh

bash script.sh
