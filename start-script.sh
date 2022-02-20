#!/usr/bin/env bash

wget https://github.com/thiagoneo/debian-postinstall/archive/refs/tags/2022-02-19-2.tar.gz
tar -xzvf 2022-02-19-2.tar.gz
cd debian-postinstall-2022-02-19-2/
chmod +x *.sh

bash script.sh
