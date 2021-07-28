#!/usr/bin/env bash


# ------------------------------- VARIÁVEIS -----------------------------------#
SCR_DIRECTORY=`pwd`

PACOTES="adwaita-icon-theme apt-config-icons-hidpi arj aspell-pt-br \
brave-browser build-essential clang default-jre file-roller flatpak \
fonts-cantarell fonts-firacode fonts-hack fonts-jetbrains-mono \
fonts-liberation2 fonts-noto-cjk fonts-noto-core fonts-open-sans gdebi \
gnome-packagekit gnome-software gnome-software-plugin-flatpak \
gnome-system-tools gnome-themes-extra gpart gparted gstreamer1.0-libav \
gstreamer1.0-plugins-bad gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly \
gstreamer1.0-vaapi gufw gvfs-backends hunspell-pt-br hyphen-pt-br \
intel-microcode lhasa libavcodec-extra libreoffice-calc libreoffice-core \
libreoffice-gtk3 libreoffice-help-pt-br libreoffice-impress \
libreoffice-l10n-pt-br libreoffice-lightproof-pt-br libreoffice-writer lightdm \
lightdm-settings lzip lzop mesa-opencl-icd mesa-utils mesa-va-drivers \
mesa-vdpau-drivers mousepad mtools myspell-pt-br ncompress networkd-dispatcher \
network-manager-config-connectivity-debian network-manager-gnome ntp numlockx \
package-update-indicator pavucontrol pulseaudio qt5ct qt5-style-plugins rar \
ristretto rzip slick-greeter squashfs-tools texlive-fonts-extra \
texlive-fonts-recommended thunar-archive-plugin thunar-media-tags-plugin \
thunar-volman ttf-mscorefonts-installer unace unalz unar unrar unzip vlc \
wmctrl xdg-user-dirs-gtk xdg-utils xfce4 xfce4-clipman-plugin \
xfce4-datetime-plugin xfce4-genmon-plugin xfce4-indicator-plugin xfce4-notifyd \
xfce4-power-manager xfce4-screenshooter xfce4-taskmanager xfce4-terminal \
xfce4-verve-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin \
xfce4-xkb-plugin xfsprogs xserver-xorg-core xserver-xorg-video-intel zip zstd"

PACOTES_SEM_RECOMMENDS="baobab evince geary gnome-2048 gnome-calculator \
gnome-calendar gnome-mines gnome-nibbles kolourpaint libreoffice-nlpsolver \
openclipart-libreoffice supertux thunar-font-manager"

PACOTES_PARA_REMOVER="evolution-data-server firefox-esr at-spi2-core bolt \
fwupd kwayland-data kwayland-integration qtwayland5 sane-utils \
tango-icon-theme telnet fonts-noto-color-emoji"


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

sudo apt update

#### Repositório do navegador Brave ####
cd $SCR_DIRECTORY/
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update


#---------------------------- INSTALAR PACOTES --------------------------------#
echo ""
echo "INICIANDO ATUALIZAÇÃO COMPLETA DO SISTEMA..."
echo ""
sudo apt upgrade -y

echo ""
echo "INSTALANDO PACOTES..."
echo ""
sudo apt install $PACOTES -y
sudo apt install $PACOTES_SEM_RECOMMENDS -y

##### Instalação de pacotes locais #####
sudo dpkg -i $SCR_DIRECTORY/local-packages/*.deb
sudo apt install -f -y

#------------------- DESINSTALAR PACOTES DESNECESSÁRIOS -----------------------#
sudo apt purge $PACOTES_PARA_REMOVER -y
sudo apt autoremove --purge -y


#--------------------- CONFIGURAR ARQUIVOS DO SISTEMA -------------------------#
cd $HOME
sudo chown -R root:root $SCR_DIRECTORY/system-files/
cd $SCR_DIRECTORY/
sudo cp -rp $SCR_DIRECTORY/system-files/etc/skel/ /etc/
sudo \cp -rf $SCR_DIRECTORY/system-files/etc/lightdm/ /etc/
sudo \cp $SCR_DIRECTORY/system-files/etc/drirc /etc/
sudo \cp $SCR_DIRECTORY/system-files/etc/default/grub /etc/default/grub
sudo cp /etc/network/interfaces /etc/network/interfaces.bkp
sudo \cp $SCR_DIRECTORY/system-files/etc/network/interfaces /etc/network/interfaces
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
sudo systemctl set-default graphical.target
sudo systemctl enable ufw
sudo ufw enable
sudo plymouth-set-default-theme -R homeworld
sudo dpkg-reconfigure lightdm lightdm-settings slick-greeter numlockx 


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
