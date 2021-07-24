#!/usr/bin/env bash

SCR_DIRECTORY=`pwd`

PACOTES="slick-greeter lightdm lightdm-settings xserver-xorg-core xserver-xorg-video-intel \
xfce4 xfce4-notifyd xfce4-indicator-plugin pavucontrol pulseaudio gvfs-backends \
xdg-utils xdg-user-dirs-gtk network-manager-gnome gnome-system-tools gufw \
adwaita-icon-theme gnome-themes-extra wmctrl numlockx mousepad ristretto \
thunar-archive-plugin thunar-media-tags-plugin thunar-volman \
xfce4-clipman-plugin xfce4-datetime-plugin xfce4-genmon-plugin \
xfce4-screenshooter xfce4-taskmanager xfce4-terminal xfce4-verve-plugin \
xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin \
xfce4-power-manager gigolo parole intel-microcode mesa-opencl-icd mesa-utils \
mesa-va-drivers mesa-vdpau-drivers fonts-cantarell fonts-open-sans \
fonts-liberation2 fonts-hack fonts-jetbrains-mono fonts-firacode fwupd \
apt-config-icons-hidpi gnome-software gnome-software-plugin-flatpak aspell-pt-br \
hunspell-pt-br hyphen-pt-br myspell-pt-br gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav \
gparted file-roller package-update-indicator gnome-packagekit squashfs-tools \
gstreamer1.0-vaapi libavcodec-extra zstd zip unzip rar unrar unar brave-browser \
qt5ct qt5-style-plugins flatpak"

PACOTES_SEM_RECOMMENDS="evince gnome-calendar gnome-calculator geary gnome-2048 \
gnome-mines gnome-nibbles supertux kolourpaint baobab"

#----------------------CONFIGURAR REPOSITÓRIOS ------------------------#
sudo apt update
while :; do sudo -v; sleep 59; done &
infiloop=$!

echo 'deb http://deb.debian.org/debian bullseye main contrib non-free' | sudo tee /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bullseye main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo '' | sudo tee -a /etc/apt/sources.list
echo 'deb http://security.debian.org/debian-security bullseye-security main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo '' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bullseye-updates main contrib non-free' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free' | sudo tee -a /etc/apt/sources.list

sudo apt update

### Repositório do navegador Brave ###
cd $SCR_DIRECTORY/
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update


#----------------------- INSTALAR PACOTES--------------------------------#

echo ""
echo "INICIANDO ATUALIZAÇÃO COMPLETA DO SISTEMA..."
echo ""
sudo apt upgrade -y

echo ""
echo "INSTALANDO PACOTES..."
echo ""
sudo apt install $PACOTES -y
sudo apt install $PACOTES_SEM_RECOMMENDS -y

### Instalação de pacotes locais ###
sudo dpkg -i $SCR_DIRECTORY/local-packages/*.deb
sudo apt install -f


#------------------- CONFIGURAR ARQUIVOS DO SISTEMA -----------------------#
cd $HOME
sudo chown -R root:root $SCR_DIRECTORY/system-files/
cd $SCR_DIRECTORY/
sudo cp -rp $SCR_DIRECTORY/system-files/etc/skel/ /etc/
sudo \cp -rf $SCR_DIRECTORY/system-files/etc/lightdm/ /etc/
sudo \cp -r $SCR_DIRECTORY/system-files/etc/drirc /etc/
sudo \cp -r $SCR_DIRECTORY/system-files/etc/default/grub /etc/default/grub
sudo \cp -r $SCR_DIRECTORY/system-files/usr/share/applications/gdebi.desktop /usr/share/applications/
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


############### Configuração do Flatpak #############
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

############### Configuração do usuário #############
sudo cp -rp /etc/skel/.config/ /etc/skel/.local/ $HOME/
sudo chown -R $USER:$USER $HOME/.config $HOME/.local

kill "$infiloop"

#################### Reiniciar ######################
clear
echo "Reiniciando..."
sudo reboot
