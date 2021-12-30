#!/usr/bin/env bash

set -e

# ------------------------------- VARIÁVEIS -----------------------------------#
SCR_DIRECTORY=`pwd`

#------------------------- CONFIGURAR REPOSITÓRIOS ----------------------------#
sudo apt update
while :; do sudo -v; sleep 59; done &
infiloop=$!

sudo cp /etc/apt/sources.list /etc/apt/sources.list.bkp

echo 'deb http://deb.debian.org/debian bullseye main contrib non-free' | sudo tee /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bullseye main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo '' | sudo tee -a /etc/apt/sources.list
echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo '' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bullseye-updates main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo '' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bullseye-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bullseye-backports main contrib non-free' | sudo tee -a /etc/apt/sources.list

sudo apt update

#------------------------- APLICAR ATUALIZAÇÕES -------------------------------#

echo ""
echo "INICIANDO ATUALIZAÇÃO COMPLETA DO SISTEMA..."
echo ""
sudo apt upgrade -y

#------------------------ INSTALAR SLICK GREETER ------------------------------#

echo "INSTALANDO SLICK GREETER..."
sudo apt install slick-greeter lightdm-settings numlockx -y

#--------------- DESINSTALAR PACOTES DESNECESSÁRIOS - PARTE 1 -----------------#
sudo apt purge $(cat $SCR_DIRECTORY/lista-remocao.txt) -y
sudo apt autoremove --purge -y
sudo dpkg-reconfigure lightdm lightdm-settings slick-greeter numlockx 

#--------------------- INSTALAR PACOTES DO REPOSITÓRIO ------------------------#

echo ""
echo "INSTALANDO PACOTES DO REPOSITÓRIO..."
echo ""
sudo apt install $(cat $SCR_DIRECTORY/pacotes-sem-recommends.txt) --no-install-recommends -y
sudo apt install $(cat $SCR_DIRECTORY/pacotes.txt) -y
sudo apt-mark hold dunst

#---------------------- INSTALAR PACOTES DO LOCAIS ----------------------------#

echo ""
echo "INSTALANDO PACOTES DO LOCAIS..."
cd /tmp
wget -c https://github.com/Foundry376/Mailspring/releases/download/1.9.2/mailspring-1.9.2-amd64.deb
if [[ $? == 0 ]]; then
    mv mailspring-1.9.2-amd64.deb $SCR_DIRECTORY/packages/
fi
wget -c http://packages.linuxmint.com/pool/main/m/mint-backgrounds-ulyssa/mint-backgrounds-ulyssa_1.1_all.deb
if [[ $? == 0 ]]; then
    mv mint-backgrounds-ulyssa_1.1_all.deb $SCR_DIRECTORY/packages/
fi
cd $SCR_DIRECTORY
ls $SCR_DIRECTORY/packages/*.deb > pacotes-locais.txt
sudo apt install $(cat $SCR_DIRECTORY/pacotes-locais.txt) --no-install-recommends -y

#--------------- DESINSTALAR PACOTES DESNECESSÁRIOS - PARTE 2 -----------------#
sudo apt purge $(cat $SCR_DIRECTORY/lista-remocao.txt) -y
sudo apt autoremove --purge -y


#--------------------- CONFIGURAR ARQUIVOS DO SISTEMA -------------------------#
cd $HOME
sudo chown -R root:root $SCR_DIRECTORY/system-files/
cd $SCR_DIRECTORY/
sudo \cp -rf $SCR_DIRECTORY/system-files/etc/lightdm/ /etc/
sudo \cp $SCR_DIRECTORY/system-files/etc/drirc /etc/
sudo \cp $SCR_DIRECTORY/system-files/etc/default/grub /etc/default/grub
sudo \cp $SCR_DIRECTORY/system-files/etc/grub.d/10_linux /etc/grub.d/10_linux
sudo mv /usr/share/dbus-1/services/org.knopwob.dunst.service /usr/share/dbus-1/services/org.knopwob.dunst.service.disabled
echo "vm.swappiness=25" | sudo tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_ratio=10" | sudo tee -a /etc/sysctl.conf
echo lz4hc | sudo tee -a /etc/initramfs-tools/modules
echo lz4hc_compress | sudo tee -a /etc/initramfs-tools/modules
echo z3fold | sudo tee -a /etc/initramfs-tools/modules
sudo update-initramfs -u
sudo update-grub
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf
sudo systemctl mask hybrid-sleep.target
sudo systemctl enable ufw
sudo ufw enable
sudo plymouth-set-default-theme -R homeworld


#-------------------------- CONFIGURAÇÃO DO FLATPAK ---------------------------#
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


#-------------------------- CONFIGURAÇÃO DO USUÁRIO ---------------------------#
sudo cp -rp /etc/skel/.config/ /etc/skel/.local/ $HOME/
sudo chown -R $USER:$USER $HOME/.config $HOME/.local


#------------------------------------ FIM -------------------------------------#
kill "$infiloop"
clear
echo "Chegamos ao fim."
echo "Você pode reiniciar agora com o comando '/sbin/reboot'."
