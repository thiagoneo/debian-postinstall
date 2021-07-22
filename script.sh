#!/usr/bin/env bash

SCR_DIRECTORY=`pwd`

PACOTES_COM_RECOMMENDS="intel-microcode build-essential xfce4 default-jdk gufw \
	exo-utils dbus-x11 thunar-media-tags-plugin thunar-font-manager thunar-gtkhash \
	thunar-vcs-plugin xfce4-clipman-plugin xfce4-datetime-plugin \
	xfce4-genmon-plugin xfce4-netload-plugin xfce4-notifyd xfce4-power-manager \
	xfce4-screenshooter xfce4-taskmanager xfce4-terminal xfce4-verve-plugin \
	xfce4-whiskermenu-plugin xfce4-xkb-plugin xfce4-indicator-plugin \
	xserver-xorg-video-intel flatpak gnome-software gnome-software-plugin-flatpak \
	software-properties-gtk package-update-indicator adwaita-icon-theme \
	gnome-themes-extra gtk2-engines-murrine htop gvfs-backends gnome-clocks baobab \
	beignet-opencl-icd catfish gparted dosfstools e2fsprogs gpart mtools ntfs-3g \
	os-prober xfsprogs xdg-user-dirs-gtk xdg-utils slick-greeter gnome-calculator \
	gdebi synaptic idle3 evince supertux gnome-mines gnome-nibbles gnome-2048 vlc \
	rhythmbox aspell aspell-pt-br hunspell hunspell-pt-br hyphen-pt-br \
	myspell-pt-br mythes-pt-pt mugshot plymouth plymouth-themes wmctrl wget git \
	curl apt-config-icons-hidpi libreoffice-gtk3 libreoffice-help-pt-br \
	libreoffice-l10n-pt-br libreoffice-lightproof-pt-br openclipart-libreoffice \
	brave-browser epiphany-browser libnumbertext-1.0-0 libnumbertext-tools \
	libreoffice-nlpsolver libreoffice-numbertext numlockx cabextract \
	gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
	gstreamer1.0-vaapi libavcodec-extra unrar unshield mousepad ristretto clang"

PACOTES_SEM_RECOMMENDS="gnome-characters thunar-archive-plugin neofetch \
	fonts-cantarell fonts-hack ttf-mscorefonts-installer fonts-liberation \
	fonts-firacode fonts-noto-core fonts-noto-cjk fonts-jetbrains-mono \
	fonts-open-sans fonts-opensymbol fonts-mathjax kolourpaint libreoffice \
	libreoffice-common network-manager-gnome gnome-calendar geary lightdm"

PACOTES_COM_SUGGESTS="file-roller qt5ct"

PACOTES_PARA_REMOVER="jlha-utils rpm2cpio"

PACOTES_PARA_MARCAR="fonts-crosextra-caladea fonts-crosextra-carlito fonts-liberation2 \
	fonts-linuxlibertine fonts-noto-mono fonts-sil-gentium-basic fonts-dejavu"



#----------------------CONFIGURAR REPOSITÓRIOS ------------------------#
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
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update


#----------------------- INSTALAR PACOTES--------------------------------#
echo ""
echo "INSTALANDO PACOTES..."
echo ""
sudo apt install $PACOTES_COM_RECOMMENDS -y

echo ""
echo "INSTALANDO PACOTES SEM RECOMENDAÇÕES..."
echo ""
sudo apt install $PACOTES_SEM_RECOMMENDS --no-install-recommends -y

echo ""
echo "INSTALANDO PACOTES COM SUGESTÕES..."
echo ""
sudo apt install $PACOTES_COM_SUGGESTS --install-suggests -y

echo ""
echo "REMOVENDO PACOTES DESNECESSÁRIOS..."
echo ""
sudo apt purge $PACOTES_PARA_REMOVER -y

echo ""
echo "MARCANDO PACOTES COMO INSTALADOS AUTOMATICAMENTE..."
echo ""
sudo apt-mark auto $PACOTES_PARA_MARCAR

echo ""
echo "EXECUTANDO APT AUTOREMOVE..."
echo ""
sudo apt autoremove --purge -y

### Instalação de pacotes locais ###
sudo dpkg -i $SCR_DIRECTORY/local-packages/*.deb
sudo apt install -f


#------------------- CONFIGURAR ARQUIVOS DO SISTEMA -----------------------#
cd $HOME
sudo chown -R root:root $SCR_DIRECTORY/system-files/
sudo cp -rp $SCR_DIRECTORY/system-files/etc/skel/ /etc/
cd $SCR_DIRECTORY/
sudo \cp -rf $SCR_DIRECTORY/system-files/etc/lightdm/ /etc/
sudo \cp -r $SCR_DIRECTORY/system-files/etc/drirc /etc/
sudo \cp -r $SCR_DIRECTORY/system-files/usr/share/applications/gdebi.desktop /usr/share/applications/
echo "vm.swappiness=25" | sudo tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_background_ratio=5" | sudo tee -a /etc/sysctl.conf
echo "vm.dirty_ratio=10" | sudo tee -a /etc/sysctl.conf
echo lz4hc | sudo tee -a /etc/initramfs-tools/modules
echo lz4hc_compress | sudo tee -a /etc/initramfs-tools/modules
echo z3fold | sudo tee -a /etc/initramfs-tools/modules
update-initramfs -u
\cp -r $SCR_DIRECTORY/system-files/etc/default/grub /etc/default/grub
update-grub
echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf
sudo systemctl set-default graphical.target
sudo systemctl enable ufw
sudo ufw enable
sudo plymouth-set-default-theme -R homeworld


############### Configuração do Flatpak #############
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

################# Instalação de temas ################
cd $SCR_DIRECTORY
git clone https://github.com/vinceliuice/Fluent-gtk-theme.git
git clone https://github.com/vinceliuice/Fluent-icon-theme.git
cd $SCR_DIRECTORY/Fluent-gtk-theme
sudo bash install.sh
cd $SCR_DIRECTORY/Fluent-icon-theme
sudo bash install.sh -a
cd $SCR_DIRECTORY/Fluent-icon-theme/cursors
sudo bash install.sh
cd $SCR_DIRECTORY
git clone https://github.com/Xseba360/DockBarX-Windows10.git
cd $SCR_DIRECTORY/DockBarX-Windows10
sudo bash install.sh

############### Configuração do usuário #############
sudo cp -rp /mnt/etc/skel/.config/ /mnt/etc/skel/.local/ $HOME/
sudo chown -R $USER:$USER $HOME/.config $HOME/.local

#################### Reiniciar ######################
clear
echo "Reiniciando..."
sudo reboot
