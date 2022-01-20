#!/usr/bin/env bash

wget https://github.com/thiagoneo/debian-postinstall/archive/refs/tags/2022-01-20-1.tar.gz
tar -xzvf 2022-01-20-1.tar.gz
cd debian-postinstall-2022-01-20-1/
chmod +x *.sh

bash script.sh
