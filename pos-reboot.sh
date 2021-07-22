#!/bin/bash
########### Instalação de pacotes flatpak #############
flatpak install flathub com.github.tchx84.Flatseal com.snes9x.Snes9x com.sublimetext.three org.geogebra.GeoGebra org.stellarium.Stellarium

########## Instalação de temas para apps flatpak ######
sudo apt install ostree appstream-util -y
cd $HOME
git clone https://github.com/refi64/pakitheme.git
cd pakitheme
sudo bash pakitheme install-system Fluent
sudo bash pakitheme install-system Fluent-light
sudo bash pakitheme install-system Fluent-dark

echo "Pronto."
