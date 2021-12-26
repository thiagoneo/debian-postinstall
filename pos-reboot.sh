#!/bin/bash
########### Instalação de pacotes flatpak #############
sudo echo "Iniciando instalação de Flatpaks"
while :; do sudo -v; sleep 59; done &
infiloop=$!

flatpak install flathub $(cat lista-flatpaks.txt)

########## Instalação de temas para apps flatpak ######
sudo apt install ostree appstream-util -y
cd $HOME
git clone https://github.com/refi64/stylepak.git
cd stylepak
bash stylepak install-system Fluent
bash stylepak install-system Fluent-compact
bash stylepak install-system Fluent-dark
bash stylepak install-system Fluent-dark-compact
bash stylepak install-system Fluent-light
bash stylepak install-system Fluent-light-compact
bash stylepak install-system Fluent-round
bash stylepak install-system Fluent-round-compact
bash stylepak install-system Fluent-round-dark
bash stylepak install-system Fluent-round-dark-compact
bash stylepak install-system Fluent-round-light
bash stylepak install-system Fluent-round-light-compact

kill "$infiloop"

echo "Pronto."
