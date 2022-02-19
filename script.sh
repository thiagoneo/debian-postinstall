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
wget -c http://packages.linuxmint.com/pool/main/m/mint-backgrounds-uma/mint-backgrounds-uma_1.2_all.deb
if [[ $? == 0 ]]; then
    mv mint-backgrounds-uma_1.2_all.deb $SCR_DIRECTORY/packages/
fi
wget -c http://packages.linuxmint.com/pool/main/m/mint-backgrounds-una/mint-backgrounds-una_1.1_all.deb
if [[ $? == 0 ]]; then
    mv mint-backgrounds-una_1.1_all.deb $SCR_DIRECTORY/packages/
fi
cd $SCR_DIRECTORY
ls $SCR_DIRECTORY/packages/*.deb > pacotes-locais.txt
sudo apt install $(cat $SCR_DIRECTORY/pacotes-locais.txt) --no-install-recommends -y

#-------------------------- INSTALAÇÃO VIRTUALBOX -----------------------------#
echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bullseye contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt update
sudo apt install virtualbox-6.1 -y

#------------------------- INSTALAÇÃO BRAVE BROWSER ---------------------------#
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

#--------------- DESINSTALAR PACOTES DESNECESSÁRIOS - PARTE 2 -----------------#
sudo apt purge $(cat $SCR_DIRECTORY/lista-remocao.txt) -y
sudo apt autoremove --purge -y

#--------------------- CONFIGURAR ARQUIVOS DO SISTEMA -------------------------#
cd $HOME
sudo chown -R root:root $SCR_DIRECTORY/system-files/
cd $SCR_DIRECTORY/
sudo \cp -rf $SCR_DIRECTORY/system-files/etc/lightdm/ /etc/
sudo \cp $SCR_DIRECTORY/system-files/etc/default/grub /etc/default/grub
sudo \cp $SCR_DIRECTORY/system-files/etc/grub.d/10_linux /etc/grub.d/10_linux
sudo mv /usr/share/dbus-1/services/org.knopwob.dunst.service /usr/share/dbus-1/services/org.knopwob.dunst.service.disabled
sudo rm /usr/share/icons/default/index.theme
sudo cp $SCR_DIRECTORY/system-files/usr/share/icons/default/index.theme /usr/share/icons/default/
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
cp /usr/share/desktop-base/debian-logos/logo-text-version-64.png /usr/share/plymouth/themes/spinner/watermark.png
sudo plymouth-set-default-theme -R spinner
sudo ufw allow 59010/udp
sudo ufw allow 59011/udp


#-------------------------- CONFIGURAÇÃO DO FLATPAK ---------------------------#
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


#-------------------------- CONFIGURAÇÃO DO USUÁRIO ---------------------------#
sudo cp -rp /etc/skel/.config/ /etc/skel/.local/ /etc/skel/.var/ $HOME/ 
sudo chown -R $USER:$USER $HOME/.config $HOME/.local $HOME/.var

#---------------------------- INSTALAÇÃO DE TEMAS -----------------------------#
#### Fluent GTK Theme ###
cd $SCR_DIRECTORY/
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git
cd Fluent-gtk-theme/
sudo ./install.sh --icon debian
sudo ./install.sh --icon debian --tweaks round
cd /usr/share/themes/
sudo tar -xzvf $SCR_DIRECTORY/fluent-theme-patch.tar.gz

### Fluent icon theme ###
cd $SCR_DIRECTORY/
git clone https://github.com/vinceliuice/Fluent-icon-theme.git
cd Fluent-icon-theme/
sudo ./install.sh
cd cursors/
sudo ./install.sh

#----------------------- INSTALAÇÃO DE PACOTES FLATPAK ------------------------#
cd $SCR_DIRECTORY/
sudo echo "Iniciando instalação de Flatpaks"
sudo flatpak install flathub $(cat $SCR_DIRECTORY/lista-flatpaks.txt) -y

########## Instalação de temas para apps flatpak ######
sudo apt install ostree appstream-util -y
cd $SCR_DIRECTORY/
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

#### Definir Firefox (flatpak) como navegador padrão do sistema
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /var/lib/flatpak/exports/bin/org.mozilla.firefox 200 && sudo update-alternatives --set x-www-browser /var/lib/flatpak/exports/bin/org.mozilla.firefox

#------------------------------------ FIM -------------------------------------#
kill "$infiloop"
clear
echo "Chegamos ao fim."
echo "Você pode reiniciar agora com o comando '/sbin/reboot'."
