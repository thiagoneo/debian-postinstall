#!/usr/bin/env bash
set -e

SCR_DIRECTORY=`pwd`

PACOTES_PARA_INSTALAR="accountsservice acl adduser adwaita-icon-theme alsa-topology-conf \
alsa-ucm-conf apparmor appstream appstream-util apt apt-config-icons apt-file \
apt-listchanges apt-transport-https apt-utils arj aspell aspell-pt-br \
at-spi2-core autoconf automake autopoint autotools-dev avahi-daemon \
ayatana-indicator-application ayatana-indicator-common baobab base-files \
base-passwd bash bash-completion beignet-opencl-icd bind9-dnsutils bind9-host \
bind9-libs binfmt-support binutils binutils-common binutils-x86-64-linux-gnu \
blt bolt bsdextrautils bsdutils bubblewrap build-essential busybox bzip2 \
cabextract ca-certificates ca-certificates-java catfish clang clang-11 \
coinor-libcbc3 coinor-libcgl1 coinor-libclp1 coinor-libcoinmp1v5 \
coinor-libcoinutils3v5 coinor-libosi1v5 colord colord-data console-setup \
console-setup-linux coreutils cpio cpp cpp-10 cron curl dash dbus \
dbus-user-session dbus-x11 dconf-gsettings-backend dconf-service dctrl-tools \
debconf debconf-i18n debhelper debian-archive-keyring debian-faq \
debian-goodies debianutils default-jdk default-jdk-headless default-jre \
default-jre-headless desktop-base desktop-file-utils dh-autoreconf \
dh-strip-nondeterminism dictionaries-common diffstat diffutils dirmngr \
discover discover-data distro-info-data dmidecode dmsetup dnsmasq-base \
dns-root-data docbook-xml doc-debian dosfstools dpkg dpkg-dev dwz e2fsprogs \
eject elfutils emacsen-common enchant-2 file-roller squashfs-tools equivs evince \
evince-common exfat-fuse exfat-utils exim4-base exim4-config \
exim4-daemon-light exo-utils fakeroot fdisk file findutils firefox-esr \
firefox-esr-l10n-pt-br firmware-linux-free flatpak folks-common fontconfig \
fontconfig-config fonts-cantarell fonts-crosextra-caladea \
fonts-crosextra-carlito fonts-dejavu fonts-dejavu-core fonts-dejavu-extra \
fonts-droid-fallback fonts-firacode fonts-freefont-ttf fonts-hack \
fonts-jetbrains-mono fonts-lato fonts-liberation fonts-liberation2 \
fonts-mathjax fonts-noto-cjk fonts-noto-core fonts-noto-mono fonts-open-sans \
fonts-opensymbol fonts-quicksand fonts-sil-gentium-basic fonts-urw-base35 fuse \
fwupd fwupd-amd64-signed g++ g++-10 gcc gcc-10 gcc-10-base gcc-9-base gconf2 \
gconf2-common gconf-service gcr gdal-data gdebi gdebi-core gdisk geary \
geoclue-2.0 gettext gettext-base gir1.2-atk-1.0 gir1.2-freedesktop \
gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 \
gir1.2-gnomedesktop-3.0 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 \
gir1.2-gtk-3.0 gir1.2-harfbuzz-0.0 gir1.2-javascriptcoregtk-4.0 \
gir1.2-keybinder-3.0 gir1.2-lokdocview-0.1 gir1.2-packagekitglib-1.0 \
gir1.2-pango-1.0 gir1.2-peas-1.0 gir1.2-rb-3.0 gir1.2-secret-1 gir1.2-soup-2.4 \
gir1.2-vte-2.91 gir1.2-webkit2-4.0 gir1.2-wnck-3.0 gir1.2-xapp-1.0 \
gir1.2-xfconf-0 gist git git-lfs git-man gjs glib-networking \
glib-networking-common glib-networking-services gnome-accessibility-themes \
gnome-calculator gnome-characters gnome-clocks gnome-desktop3-data \
gnome-dictionary gnome-icon-theme gnome-keyring gnome-keyring-pkcs11 \
gnome-packagekit gnome-packagekit-data gnome-software gnome-software-common \
gnome-software-plugin-flatpak gnome-system-tools \
gnome-themes-extra gnome-themes-extra-data gnupg \
gnupg-l10n gnupg-utils gnustep-base-common gnustep-base-runtime gnustep-common \
gpart gparted gparted-common gpg gpg-agent gpgconf gpgsm gpgv gpg-wks-client \
gpg-wks-server grep groff-base grub2-common grub-common grub-pc grub-pc-bin \
gsasl-common gsettings-desktop-schemas gstreamer1.0-alsa gstreamer1.0-fdkaac \
gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-libav gstreamer1.0-opencv \
gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good \
gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio gstreamer1.0-qt5 \
gstreamer1.0-vaapi gstreamer1.0-wpe gstreamer1.0-x gtk2-engines-murrine \
gtk2-engines-pixbuf gtkhash gtk-update-icon-cache gufw guile-2.2-libs gvfs \
gvfs-backends gvfs-common gvfs-daemons gvfs-libs gzip hddtemp \
hicolor-icon-theme hostname htop hunspell hunspell-en-us hunspell-pt-br \
hyphen-en-us hyphen-pt-br i965-va-driver ibrazilian idle idle3 idle-python3.9 \
ifupdown iio-sensor-proxy init initramfs-tools initramfs-tools-core \
init-system-helpers installation-report intel-media-va-driver intel-microcode \
intltool-debian inxi ipp-usb iproute2 iptables iputils-ping isc-dhcp-client \
isc-dhcp-common iso-codes ispell iucode-tool java-common javascript-common kbd \
kded5 keyboard-configuration kio klibc-utils kmod kolourpaint krb5-locales \
laptop-detect less lhasa lib32gcc-s1 lib32stdc++6 liba52-0.7.4 libaa1 libaacs0 \
libabw-0.1-1 libaccountsservice0 libacl1 libaec0 libalgorithm-diff-perl \
libalgorithm-diff-xs-perl libalgorithm-merge-perl libaliased-perl libaom0 \
libapparmor1 libappstream4 libappstream-glib8 libapt-pkg6.0 libapt-pkg-perl \
libarchive13 libarchive-cpio-perl libarchive-zip-perl libargon2-1 libaribb24-0 \
libarmadillo10 libarpack2 libasan6 libasm1 libasound2 libasound2-data \
libasound2-plugins libaspell15 libass9 libassuan0 libasyncns0 libatasmart4 \
libatk1.0-0 libatk1.0-data libatk-bridge2.0-0 libatkmm-1.6-1v5 \
libatk-wrapper-java libatk-wrapper-java-jni libatomic1 libatspi2.0-0 libattr1 \
libaudit1 libaudit-common libauthen-sasl-perl libavahi-client3 \
libavahi-common3 libavahi-common-data libavahi-core7 libavahi-glib1 \
libavc1394-0 libavcodec-extra libavcodec-extra58 libavfilter7 libavformat58 \
libavresample4 libavutil56 libayatana-appindicator3-1 libayatana-ido3-0.4-0 \
libayatana-indicator3-7 libb2-1 libbdplus0 libb-hooks-endofscope-perl \
libb-hooks-op-check-perl libbinutils libblas3 libblkid1 libblockdev2 \
libblockdev-crypto2 libblockdev-fs2 libblockdev-loop2 libblockdev-part2 \
libblockdev-part-err2 libblockdev-swap2 libblockdev-utils2 libbluetooth3 \
libbluray2 libboost-filesystem1.74.0 libboost-iostreams1.74.0 \
libboost-locale1.74.0 libboost-thread1.74.0 libbpf0 libbrotli1 libbs2b0 \
libbsd0 libbz2-1.0 libc6 libc6-dev libc6-i386 libcaca0 libcairo2 \
libcairo-gobject2 libcairo-gobject-perl libcairomm-1.0-1v5 libcairo-perl \
libcaja-extension1 libcanberra0 libcanberra-gtk3-0 libcanberra-gtk3-module \
libcap2 libcap2-bin libcap-ng0 libcapture-tiny-perl libc-bin libcbor0 libcc1-0 \
libcddb2 libc-dev-bin libc-devtools libcdio19 libcdio-cdda2 libcdio-paranoia2 \
libcdparanoia0 libcdr-0.1-1 libcfitsio9 libcharls2 libchromaprint1 libc-l10n \
libclang1-11 libclang-common-11-dev libclang-cpp11 \
libclass-data-inheritable-perl libclass-method-modifiers-perl \
libclass-xsaccessor-perl libclone-perl libclucene-contribs1v5 \
libclucene-core1v5 libcmis-0.5-5v5 libcodec2-0.9 libcolamd2 libcolord2 \
libcolorhug2 libcom-err2 libconfig-tiny-perl libcpanel-json-xs-perl libcrypt1 \
libcrypt-dev libcryptsetup12 libctf0 libctf-nobfd0 libcups2 libcurl3-gnutls \
libcurl4 libdaemon0 libdap27 libdapclient6v5 libdata-dpath-perl \
libdata-dump-perl libdata-messagepack-perl libdata-optlist-perl \
libdata-validate-domain-perl libdatrie1 libdav1d4 libdb5.3 libdbus-1-3 \
libdbus-glib-1-2 libdbusmenu-glib4 libdbusmenu-gtk3-4 libdbusmenu-qt5-2 \
libdc1394-25 libdca0 libdconf1 libde265-0 libdebconfclient0 libdebhelper-perl \
libdeflate0 libdevel-callchecker-perl libdevel-size-perl \
libdevel-stacktrace-perl libdevmapper1.02.1 libdiscover2 libdjvulibre21 \
libdjvulibre-text libdmapsharing-3.0-2 libdns-export1110 libdouble-conversion3 \
libdpkg-perl libdrm2 libdrm-amdgpu1 libdrm-common libdrm-intel1 \
libdrm-nouveau2 libdrm-radeon1 libdv4 libdvbpsi10 libdvdnav4 libdvdread8 \
libdw1 libdynaloader-functions-perl libebml5 libe-book-0.1-1 libedit2 \
libefiboot1 libefivar1 libegl1 libegl-mesa0 libelf1 libemail-address-xs-perl \
libenchant-2-2 libencode-locale-perl libeot0 libepoxy0 libepsilon1 libept1.6.0 \
libepubgen-0.1-1 liberror-perl libestr0 libetonyek-0.1-1 libevdev2 \
libevdocument3-4 libevent-2.1-7 libevview3-3 libexception-class-perl libexif12 \
libexo-2-0 libexo-common libexpat1 libexporter-tiny-perl libext2fs2 \
libexttextcat-2.0-0 libexttextcat-data libextutils-depends-perl \
libextutils-pkgconfig-perl libfaad2 libfakeroot libfam0 libfastjson4 libfdisk1 \
libfdk-aac2 libffi7 libffi-dev libfftw3-double3 libfido2-1 \
libfile-basedir-perl libfile-desktopentry-perl libfile-fcntllock-perl \
libfile-find-rule-perl libfile-listing-perl libfile-mimeinfo-perl \
libfile-slurper-perl libfile-stripnondeterminism-perl libfile-which-perl \
libflac8 libflashrom1 libflatpak0 libflite1 libfluidsynth2 libfolks25 \
libfont-afm-perl libfontconfig1 libfontenc1 libfont-ttf-perl libfreehand-0.1-1 \
libfreetype6 libfreexl1 libfribidi0 libfstrm0 libftdi1-2 libfuse2 libfwupd2 \
libfwupdplugin1 libfyba0 libgail18 libgail-common libgarcon-1-0 \
libgarcon-common libgarcon-gtk3-1-0 libgbm1 libgc1 libgcab-1.0-0 libgcc-10-dev \
libgcc-s1 libgck-1-0 libgconf-2-4 libgcr-base-3-1 libgcr-ui-3-1 libgcrypt20 \
libgd3 libgdal28 libgdata22 libgdata-common libgdbm6 libgdbm-compat4 \
libgdcm3.0 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin \
libgdk-pixbuf2.0-common libgdk-pixbuf-xlib-2.0-0 libgee-0.8-2 libgeoclue-2-0 \
libgeocode-glib0 libgeos-3.9.0 libgeos-c1v5 libgeotiff5 libgfortran5 libgif7 \
libgirepository-1.0-1 libgjs0g libgl1 libgl1-mesa-dri libglapi-mesa libgles2 \
libglew2.1 libglib2.0-0 libglib2.0-bin libglib2.0-data libglibmm-2.4-1v5 \
libglib-object-introspection-perl libglib-perl libglu1-mesa libglvnd0 libglx0 \
libglx-mesa0 libgme0 libgmime-3.0-0 libgmp10 libgnome-desktop-3-19 \
libgnomekbd8 libgnomekbd-common libgnustep-base1.27 libgnutls30 \
libgnutls-dane0 libgoa-1.0-0b libgoa-1.0-common libgomp1 libgpg-error0 \
libgpgme11 libgpgmepp6 libgphoto2-6 libgphoto2-l10n libgphoto2-port12 libgpm2 \
libgpod4 libgpod-common libgraphene-1.0-0 libgraphite2-3 libgrilo-0.3-0 libgs9 \
libgs9-common libgsasl7 libgsm1 libgsound0 libgspell-1-2 libgspell-1-common \
libgssapi-krb5-2 libgssdp-1.2-0 libgstreamer1.0-0 libgstreamer-gl1.0-0 \
libgstreamer-opencv1.0-0 libgstreamer-plugins-bad1.0-0 \
libgstreamer-plugins-base1.0-0 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common \
libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk3-perl libgtkmm-3.0-1v5 \
libgtksourceview-3.0-1 libgtksourceview-3.0-common libgtksourceview-4-0 \
libgtksourceview-4-common libgtop-2.0-11 libgtop2-common libgudev-1.0-0 \
libgupnp-1.2-0 libgupnp-igd-1.0-4 libgusb2 libgweather-3-16 libgweather-common \
libgxps2 libhandy-1-0 libharfbuzz0b libharfbuzz-icu0 libhdf4-0-alt \
libhdf5-103-1 libhdf5-hl-100 libheif1 libhogweed6 libhtml-format-perl \
libhtml-form-perl libhtml-html5-entities-perl libhtml-parser-perl \
libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl \
libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl \
libhunspell-1.7-0 libhyphen0 libice6 libice-dev libicu67 libidn11 libidn2-0 \
libiec61883-0 libieee1284-3 libigdgmm11 libijs-0.35 libilmbase25 \
libimagequant0 libimobiledevice6 libimport-into-perl libinih1 libinput10 \
libinput-bin libinstpatch-1.0-2 libio-html-perl libio-socket-ssl-perl \
libio-string-perl libio-stringy-perl libip4tc2 libip6tc2 libipc-run3-perl \
libipc-system-simple-perl libisc-export1105 libisl23 libiterator-perl \
libiterator-util-perl libitm1 libixml10 libjack-jackd2-0 libjansson4 \
libjavascriptcoregtk-4.0-18 libjbig0 libjbig2dec0 libjcat1 libjim0.79 \
libjpeg62-turbo libjs-jquery libjs-mathjax libjson-c5 libjson-glib-1.0-0 \
libjson-glib-1.0-common libjson-maybexs-perl libjuh-java libjurt-java \
libk5crypto3 libkate1 libkeybinder-3.0-0 libkeyutils1 libkf5archive5 \
libkf5attica5 libkf5authcore5 libkf5auth-data libkf5bookmarks5 \
libkf5bookmarks-data libkf5codecs5 libkf5codecs-data libkf5completion5 \
libkf5completion-data libkf5configcore5 libkf5config-data libkf5configgui5 \
libkf5configwidgets5 libkf5configwidgets-data libkf5coreaddons5 \
libkf5coreaddons-data libkf5crash5 libkf5dbusaddons5 libkf5dbusaddons-data \
libkf5doctools5 libkf5globalaccel5 libkf5globalaccel-bin \
libkf5globalaccel-data libkf5globalaccelprivate5 libkf5guiaddons5 libkf5i18n5 \
libkf5i18n-data libkf5iconthemes5 libkf5iconthemes-data libkf5itemviews5 \
libkf5itemviews-data libkf5jobwidgets5 libkf5jobwidgets-data libkf5kiocore5 \
libkf5kiofilewidgets5 libkf5kiogui5 libkf5kiontlm5 libkf5kiowidgets5 \
libkf5notifications5 libkf5notifications-data libkf5sane5 libkf5sane-data \
libkf5service5 libkf5service-bin libkf5service-data libkf5solid5 \
libkf5solid5-data libkf5sonnet5-data libkf5sonnetcore5 libkf5sonnetui5 \
libkf5textwidgets5 libkf5textwidgets-data libkf5wallet5 libkf5wallet-bin \
libkf5wallet-data libkf5widgetsaddons5 libkf5widgetsaddons-data \
libkf5windowsystem5 libkf5windowsystem-data libkf5xmlgui5 libkf5xmlgui-data \
libklibc libkmlbase1 libkmldom1 libkmlengine1 libkmod2 libkpathsea6 libkrb5-3 \
libkrb5support0 libksba8 libkwalletbackend5-5 liblangtag1 liblangtag-common \
liblapack3 liblcms2-2 libldap-2.4-2 libldap-common libldb2 liblept5 liblhasa0 \
liblibreoffice-java liblibreofficekitgtk liblightdm-gobject-1-0 liblilv-0-0 \
liblirc-client0 liblist-compare-perl liblist-moreutils-perl \
liblist-moreutils-xs-perl liblist-utilsby-perl libllvm11 liblmdb0 \
liblocale-gettext-perl liblockfile-bin liblognorm5 liblsan0 libltc11 libltdl7 \
libltdl-dev liblua5.2-0 liblwp-mediatypes-perl liblwp-protocol-https-perl \
liblz4-1 liblzma5 liblzo2-2 libmad0 libmagic1 libmagic-mgc \
libmail-sendmail-perl libmailtools-perl libmailutils7 libmalcontent-0-0 \
libmanette-0.2-0 libmariadb3 libmarkdown2 libmatroska7 libmaxminddb0 \
libmbim-glib4 libmbim-proxy libmd0 libmd4c0 libmfx1 libmhash2 libminizip1 \
libmjpegutils-2.1-0 libmm-glib0 libmms0 libmnl0 libmodplug1 \
libmodule-implementation-perl libmodule-runtime-perl libmoo-perl \
libmoox-aliases-perl libmount1 libmouse-perl libmozjs-78-0 libmp3lame0 libmpc3 \
libmpcdec6 libmpdec3 libmpeg2-4 libmpeg2encpp-2.1-0 libmpfr6 libmpg123-0 \
libmplex2-2.1-0 libmspack0 libmspub-0.1-1 libmtdev1 libmtp9 libmtp-common \
libmtp-runtime libmwaw-0.3-3 libmysofa1 libmythes-1.2-0 \
libnamespace-clean-perl libnautilus-extension1a libncurses6 libncurses-dev \
libncursesw6 libndp0 libneon27-gnutls libnetcdf18 libnet-dbus-perl \
libnet-domain-tld-perl libnetfilter-conntrack3 libnet-http-perl \
libnet-smtp-ssl-perl libnet-ssleay-perl libnettle8 libnewt0.52 libnfnetlink0 \
libnfs13 libnftables1 libnftnl11 libnghttp2-14 libnice10 libnl-3-200 \
libnl-genl-3-200 libnl-route-3-200 libnm0 libnma0 libnma-common libnorm1 \
libnotify4 libnotify-bin libnpth0 libnsl2 libnsl-dev libnspr4 libnss3 \
libnss-mdns libnss-systemd libntfs-3g883 libntlm0 libnuma1 \
libnumber-compare-perl libnumbertext-1.0-0 libnumbertext-data \
libnumbertext-tools libobjc-10-dev libobjc4 libodbc1 libodfgen-0.1-1 libofa0 \
libogdi4.1 libogg0 libomp-11-dev libomp5-11 liboobs-1-5 libopenal1 \
libopenal-data libopencore-amrnb0 libopencore-amrwb0 libopencv-calib3d4.5 \
libopencv-contrib4.5 libopencv-core4.5 libopencv-dnn4.5 \
libopencv-features2d4.5 libopencv-flann4.5 libopencv-highgui4.5 \
libopencv-imgcodecs4.5 libopencv-imgproc4.5 libopencv-ml4.5 \
libopencv-objdetect4.5 libopencv-video4.5 libopenexr25 libopenjp2-7 \
libopenmpt0 libopenmpt-modplug1 libopenni2-0 libopus0 liborc-0.4-0 \
liborcus-0.16-0 liborcus-parser-0.16-0 libostree-1-1 libp11-kit0 \
libpackagekit-glib2-18 libpackage-stash-perl libpackage-stash-xs-perl \
libpagemaker-0.0-0 libpam0g libpam-gnome-keyring libpam-modules \
libpam-modules-bin libpam-runtime libpam-systemd libpango-1.0-0 \
libpangocairo-1.0-0 libpangoft2-1.0-0 libpangomm-1.4-1v5 libpangoxft-1.0-0 \
libpaper1 libpaper-utils libparams-classify-perl libparams-util-perl \
libparted2 libparted-fs-resize0 libpath-tiny-perl libpcap0.8 libpci3 \
libpciaccess0 libpcre2-16-0 libpcre2-8-0 libpcre3 libpcsclite1 libpeas-1.0-0 \
libpeas-common libperl5.32 libperlio-gzip-perl libperlio-utf8-strict-perl \
libpfm4 libpgm-5.3-0 libphonon4qt5-4 libphonon4qt5-data libphysfs1 \
libpipeline1 libpipewire-0.3-0 libpipewire-0.3-modules libpixman-1-0 \
libplacebo72 libplist3 libplymouth5 libpng16-16 libpocketsphinx3 \
libpolkit-agent-1-0 libpolkit-gobject-1-0 libpolkit-qt5-1-1 libpoppler102 \
libpoppler-glib8 libpopt0 libpostproc55 libpq5 libproc-processtable-perl \
libprocps8 libproj19 libprotobuf23 libprotobuf-c1 libprotobuf-lite23 \
libproxy1v5 libpsl5 libpthread-stubs0-dev libpulse0 libpulsedsp \
libpulse-mainloop-glib0 libpython3.9 libpython3.9-minimal libpython3.9-stdlib \
libpython3-stdlib libqhull8.0 libqmi-glib5 libqmi-proxy libqrcodegencpp1 \
libqrencode4 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 \
libqt5printsupport5 libqt5qml5 libqt5qmlmodels5 libqt5quick5 libqt5svg5 \
libqt5texttospeech5 libqt5waylandclient5 libqt5widgets5 libqt5x11extras5 \
libqt5xml5 libquadmath0 libquvi-0.9-0.9.3 libquvi-scripts-0.9 libqxp-0.0-0 \
librabbitmq4 libraptor2-0 libraqm0 librasqal3 libraw1394-11 librdf0 \
libreadline8 libreadonly-perl libref-util-perl libref-util-xs-perl \
libregexp-assemble-perl libreoffice libreoffice-base libreoffice-base-core \
libreoffice-base-drivers libreoffice-calc libreoffice-common libreoffice-core \
libreoffice-draw libreoffice-gnome libreoffice-gtk3 libreoffice-help-common \
libreoffice-help-pt-br libreoffice-impress libreoffice-java-common \
libreofficekit-data libreoffice-l10n-pt-br libreoffice-lightproof-en \
libreoffice-lightproof-pt-br libreoffice-math libreoffice-nlpsolver \
libreoffice-numbertext libreoffice-report-builder-bin \
libreoffice-style-colibre libreoffice-style-elementary \
libreoffice-style-sukapura libreoffice-wiki-publisher libreoffice-writer \
libresid-builder0c2a librest-0.7-0 librevenge-0.0-0 librhythmbox-core10 \
libridl-java librole-tiny-perl librsvg2-2 librsvg2-common librtmp1 librttopo1 \
librubberband2 libruby2.7 libsamplerate0 libsane1 libsane-common libsasl2-2 \
libsasl2-modules libsasl2-modules-db libsbc1 libsdl1.2debian libsdl2-2.0-0 \
libsdl2-image-2.0-0 libsdl-image1.2 libseccomp2 libsecret-1-0 libsecret-common \
libselinux1 libsemanage1 libsemanage-common libsensors5 libsensors-config \
libsepol1 libserd-0-0 libsereal-decoder-perl libsereal-encoder-perl \
libsgutils2-2 libshine3 libshout3 libsidplay1v5 libsidplay2 libsigc++-2.0-0v5 \
libsigsegv2 libslang2 libsm6 libsmartcols1 libsmbclient libsmbios-c2 libsm-dev \
libsnappy1v5 libsndfile1 libsndio7.0 libsnmp40 libsnmp-base libsocket++1 \
libsodium23 libsord-0-0 libsoundtouch1 libsoup2.4-1 libsoup-gnome2.4-1 \
libsoxr0 libspa-0.2-modules libspandsp2 libspatialaudio0 libspatialite7 \
libspectre1 libspeex1 libspeexdsp1 libsphinxbase3 libsqlite3-0 libsratom-0-0 \
libsrt1.4-gnutls libsrtp2-1 libss2 libssh2-1 libssh-gcrypt-4 libssl1.1 \
libstaroffice-0.0-0 libstartup-notification0 libstdc++-10-dev libstdc++6 \
libstemmer0d libstrictures-perl libsub-exporter-perl \
libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl \
libsub-name-perl libsub-override-perl libsub-quote-perl libsuitesparseconfig5 \
libsuperlu5 libswresample3 libswscale5 libsynctex2 libsys-hostname-long-perl \
libsystemd0 libsz2 libtag1v5 libtag1v5-vanilla libtagc0 libtalloc2 libtasn1-6 \
libtbb2 libtcl8.6 libtdb1 libteamdctl0 libtesseract4 libtevent0 \
libtext-charwidth-perl libtext-glob-perl libtext-iconv-perl \
libtext-levenshteinxs-perl libtext-markdown-discount-perl \
libtext-wrapi18n-perl libtext-xslate-perl libthai0 libthai-data libtheora0 \
libthunarx-3-0 libtie-ixhash-perl libtiff5 libtimedate-perl \
libtime-duration-perl libtime-moment-perl libtinfo6 libtinfo-dev libtirpc3 \
libtirpc-common libtirpc-dev libtk8.6 libtool libtotem-plparser18 \
libtotem-plparser-common libtry-tiny-perl libtsan0 libtss2-esys-3.0.2-0 \
libtss2-mu0 libtss2-sys1 libtss2-tcti-cmd0 libtss2-tcti-device0 \
libtss2-tcti-mssim0 libtss2-tcti-swtpm0 libtumbler-1-0 libtwolame0 \
libtype-tiny-perl libtype-tiny-xs-perl libu2f-udev libubsan1 libuchardet0 \
libudev1 libudfread0 libudisks2-0 libunbound8 libunicode-utf8-perl \
libunistring2 libuno-cppu3 libuno-cppuhelpergcc3-3 libunoil-java \
libunoloader-java libuno-purpenvhelpergcc3-3 libuno-sal3 \
libuno-salhelpergcc3-3 libunshield0 libunwind8 libupnp13 libupower-glib3 \
liburing1 liburiparser1 liburi-perl libusb-0.1-4 libusb-1.0-0 libusbmuxd6 \
libutempter0 libuuid1 libuv1 libv4l-0 libv4lconvert0 libva2 libva-drm2 \
libvariable-magic-perl libva-wayland2 libva-x11-2 libvdpau1 libvdpau-va-gl1 \
libvidstab1.1 libvisio-0.1-1 libvisual-0.4-0 libvlc5 libvlc-bin libvlccore9 \
libvncclient1 libvo-aacenc0 libvo-amrwbenc0 libvolume-key1 libvorbis0a \
libvorbisenc2 libvorbisfile3 libvpx6 libvte-2.91-0 libvte-2.91-common \
libvulkan1 libwacom2 libwacom-bin libwacom-common libwavpack1 \
libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 \
libwbclient0 libwebkit2gtk-4.0-37 libwebp6 libwebpdemux2 libwebpmux3 \
libwebrtc-audio-processing1 libwildmidi2 libwnck-3-0 libwnck-3-common libwoff1 \
libwpd-0.10-10 libwpe-1.0-1 libwpebackend-fdo-1.0-1 libwpewebkit-1.0-3 \
libwpg-0.3-3 libwps-0.4-4 libwrap0 libwww-perl libwww-robotrules-perl libx11-6 \
libx11-data libx11-dev libx11-protocol-perl libx11-xcb1 libx264-160 \
libx265-192 libxapian30 libxapp1 libxau6 libxau-dev libxaw7 libxcb1 \
libxcb1-dev libxcb-composite0 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 \
libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present0 libxcb-randr0 \
libxcb-render0 libxcb-render-util0 libxcb-res0 libxcb-shape0 libxcb-shm0 \
libxcb-sync1 libxcb-util1 libxcb-xfixes0 libxcb-xinerama0 libxcb-xinput0 \
libxcb-xkb1 libxcb-xv0 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 \
libxdmcp-dev libxerces-c3.2 libxext6 libxfce4panel-2.0-4 libxfce4ui-2-0 \
libxfce4ui-common libxfce4ui-utils libxfce4util7 libxfce4util-bin \
libxfce4util-common libxfconf-0-3 libxfixes3 libxfont2 libxft2 libxi6 \
libxinerama1 libxkbcommon0 libxkbcommon-x11-0 libxkbfile1 libxkbregistry0 \
libxklavier16 libxml2 libxml2-utils libxmlb1 libxml-libxml-perl \
libxml-namespacesupport-perl libxml-parser-perl libxml-sax-base-perl \
libxml-sax-expat-perl libxml-sax-perl libxmlsec1 libxmlsec1-nss \
libxml-twig-perl libxml-xpathengine-perl libxmu6 libxmuu1 libxpm4 libxpresent1 \
libxrandr2 libxrender1 libxres1 libxshmfence1 libxslt1.1 libxss1 libxt6 \
libxtables12 libxt-dev libxtst6 libxv1 libxvidcore4 libxvmc1 libxxf86dga1 \
libxxf86vm1 libxxhash0 libyajl2 libyaml-0-2 libyaml-libyaml-perl libyelp0 \
libytnef0 libz3-4 libz3-dev libzbar0 libzmf-0.0-0 libzmq5 libzstd1 libzvbi0 \
libzvbi-common lightdm lightdm-settings light-locker lintian linux-base \
linux-image-amd64 linux-libc-dev llvm-11 llvm-11-dev llvm-11-runtime \
llvm-11-tools lm-sensors locales login logrotate logsave lp-solve lsb-base \
lsb-release lsof lua-bitop lua-expat lua-json lua-lpeg lua-socket lzip lzop m4 \
mailcap mailutils mailutils-common make man-db manpages manpages-dev \
manpages-pt-br mariadb-common mawk media-player-info media-types mesa-utils \
mesa-va-drivers mesa-vdpau-drivers mesa-vulkan-drivers mime-support \
mobile-broadband-provider-info modemmanager mount mousepad mtools mugshot \
myspell-pt-br mysql-common mythes-pt-pt nano ncompress ncurses-base \
ncurses-bin ncurses-term neofetch netbase netcat-traditional network-manager \
network-manager-gnome nftables node-normalize.css ntfs-3g numlockx \
ocl-icd-libopencl1 odbcinst odbcinst1debian2 ooohg openclipart-libreoffice \
openclipart-png opencv-data openjdk-11-jdk openjdk-11-jdk-headless \
openjdk-11-jre openjdk-11-jre-headless openssh-client openssl os-prober ostree \
p11-kit p11-kit-modules p7zip p7zip-full packagekit packagekit-tools \
package-update-indicator parted passwd patch patchutils pavucontrol pci.ids \
pciutils perl perl-base perl-modules-5.32 perl-openssl-defaults phonon4qt5 \
phonon4qt5-backend-vlc pinentry-curses pinentry-gnome3 pipewire pipewire-bin \
pkg-config plocate plymouth plymouth-label plymouth-themes pocketsphinx-en-us \
po-debconf policykit-1 policykit-1-gnome poppler-data popularity-contest ppp \
procps proj-bin proj-data psmisc publicsuffix pulseaudio pulseaudio-utils \
python3 python3.9 python3.9-minimal python3-apt python3-bs4 python3-cairo \
python3-certifi python3-chardet python3-configobj python3-dbus python3-debconf \
python3-debian python3-debianbts python3-distro python3-distro-info python3-gi \
python3-gi-cairo python3-html5lib python3-httplib2 python3-idna python3-ldb \
python3-lxml python3-mako python3-markupsafe python3-minimal python3-olefile \
python3-pexpect python3-pil python3-pkg-resources python3-psutil \
python3-ptyprocess python3-pycurl python3-pygments python3-pysimplesoap \
python3-reportbug python3-requests python3-requests-file python3-setproctitle \
python3-six python3-software-properties python3-soupsieve python3-talloc \
python3-tk python3-tldextract python3-uno python3-urllib3 python3-webencodings \
python3-xapp python3-xdg python3-xlib python3-yaml python-apt-common \
python-is-python3 qt5ct qt5-gtk2-platformtheme qt5-gtk-platformtheme \
qt5-style-plugin-cleanlooks qt5-style-plugin-motif qt5-style-plugin-plastique \
qt5-style-plugins qttranslations5-l10n rake rar readline-common reportbug \
rhythmbox rhythmbox-data rhythmbox-plugins ristretto rsyslog rtkit ruby \
ruby2.7 rubygems-integration ruby-json ruby-minitest ruby-net-telnet \
ruby-power-assert ruby-rubygems ruby-test-unit ruby-xmlrpc rzip samba-libs \
sane-utils sed sensible-utils sgml-base sgml-data shared-mime-info sharutils \
slick-greeter software-properties-common software-properties-gtk \
sound-theme-freedesktop sudo supertux supertux-data synaptic systemd \
systemd-sysv systemd-timesyncd system-tools-backends sysvinit-utils t1utils \
tango-icon-theme tar task-brazilian-portuguese tasksel tasksel-data telnet \
thunar thunar-archive-plugin thunar-data thunar-gtkhash \
thunar-media-tags-plugin thunar-volman timgm6mb-soundfont tk8.6-blt2.5 \
tpm-udev traceroute tree ttf-mscorefonts-installer tumbler tumbler-common \
tzdata ucf udev udisks2 ufw unace unalz unar unattended-upgrades \
uno-libs-private unrar unshield unzip update-inetd upower ure usb.ids \
usb-modeswitch usb-modeswitch-data usbmuxd usbutils util-linux \
util-linux-locales va-driver-all vdpau-driver-all vim-common vim-tiny vlc \
vlc-bin vlc-data vlc-l10n vlc-plugin-access-extra vlc-plugin-base \
vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-skins2 \
vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization \
wamerican wbrazilian wget whiptail wireless-regdb wmctrl wpasupplicant \
x11-apps x11-common x11proto-dev x11-session-utils x11-utils x11-xkb-utils \
x11-xserver-utils xapps-common xauth xbitmaps xdg-dbus-proxy \
xdg-desktop-portal xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk \
xdg-utils xfce4 xfce4-appfinder xfce4-clipman xfce4-clipman-plugin \
xfce4-datetime-plugin xfce4-dict xfce4-genmon-plugin xfce4-helpers \
xfce4-indicator-plugin xfce4-netload-plugin xfce4-notifyd xfce4-panel \
xfce4-places-plugin xfce4-power-manager xfce4-power-manager-data \
xfce4-power-manager-plugins xfce4-pulseaudio-plugin xfce4-screenshooter \
xfce4-session xfce4-settings xfce4-systemload-plugin xfce4-taskmanager \
xfce4-terminal xfce4-timer-plugin xfce4-verve-plugin xfce4-whiskermenu-plugin \
xfce4-xkb-plugin xfconf xfdesktop4 xfdesktop4-data xfonts-100dpi xfonts-75dpi \
xfonts-base xfonts-encodings xfonts-scalable xfonts-utils xfsprogs xfwm4 xiccd \
xinit xkb-data xml-core xorg xorg-docs-core xorg-sgml-doctools xserver-common \
xserver-xorg xserver-xorg-core xserver-xorg-input-all \
xserver-xorg-input-libinput xserver-xorg-input-wacom xserver-xorg-legacy \
xserver-xorg-video-intel xtrans-dev xxd xz-utils yelp yelp-xsl zip zlib1g \
brave-browser"

PACOTES_PARA_MARCAR="accountsservice acl alsa-topology-conf alsa-ucm-conf apparmor appstream \
apt-config-icons at-spi2-core autoconf automake autopoint autotools-dev \
avahi-daemon ayatana-indicator-application ayatana-indicator-common bind9-libs \
binfmt-support binutils-common binutils-x86-64-linux-gnu binutils blt bolt \
bsdextrautils bubblewrap ca-certificates-java clang-11 \
coinor-libcbc3 coinor-libcgl1 coinor-libclp1 coinor-libcoinmp1v5 \
coinor-libcoinutils3v5 coinor-libosi1v5 colord-data colord console-setup-linux \
cpp-10 cpp dbus-user-session dconf-gsettings-backend dconf-service dctrl-tools \
debhelper default-jdk-headless default-jre-headless default-jre desktop-base \
desktop-file-utils dh-autoreconf dh-strip-nondeterminism dictionaries-common \
diffstat dirmngr discover-data distro-info-data dns-root-data dnsmasq-base \
docbook-xml dosfstools dpkg-dev dwz eject elfutils emacsen-common enchant-2 \
engrampa-common equivs evince-common exfat-fuse exfat-utils exim4-base \
exim4-config exim4-daemon-light exo-utils fakeroot firmware-linux-free \
folks-common fontconfig-config fontconfig fonts-dejavu-extra fonts-dejavu \
fonts-droid-fallback fonts-freefont-ttf fonts-lato fonts-noto-mono \
fonts-opensymbol fonts-quicksand fonts-urw-base35 fuse fwupd-amd64-signed \
fwupd g++-10 g++ gcc-10 gcc gconf-service gconf2-common gconf2 gcr gdal-data \
gdebi-core gdisk geoclue-2.0 gettext gir1.2-atk-1.0 gir1.2-freedesktop \
gir1.2-gdesktopenums-3.0 gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0 \
gir1.2-gnomedesktop-3.0 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 \
gir1.2-gtk-3.0 gir1.2-harfbuzz-0.0 gir1.2-javascriptcoregtk-4.0 \
gir1.2-keybinder-3.0 gir1.2-lokdocview-0.1 gir1.2-packagekitglib-1.0 \
gir1.2-pango-1.0 gir1.2-peas-1.0 gir1.2-rb-3.0 gir1.2-secret-1 gir1.2-soup-2.4 \
gir1.2-vte-2.91 gir1.2-webkit2-4.0 gir1.2-wnck-3.0 gir1.2-xapp-1.0 \
gir1.2-xfconf-0 gist git-man gjs glib-networking-common \
glib-networking-services glib-networking gnome-accessibility-themes \
gnome-desktop3-data gnome-icon-theme gnome-keyring-pkcs11 gnome-keyring \
gnome-packagekit-data gnome-software-common gnome-terminal-data \
gnome-themes-extra-data gnupg-l10n gnupg-utils gnupg gnustep-base-common \
gnustep-base-runtime gnustep-common gparted-common gpg-agent gpg-wks-client \
gpg-wks-server gpg gpgconf gpgsm grub-pc-bin grub2-common gsasl-common \
gsettings-desktop-schemas gstreamer1.0-gl gstreamer1.0-plugins-base \
gstreamer1.0-plugins-good gstreamer1.0-pulseaudio gstreamer1.0-x \
gtk-update-icon-cache gtk2-engines-pixbuf gtkhash guile-2.2-libs gvfs-common \
gvfs-daemons gvfs-libs hddtemp hicolor-icon-theme i965-va-driver ibrazilian \
idle-python3.9 idle iio-sensor-proxy initramfs-tools-core \
intel-media-va-driver intltool-debian inxi ipp-usb iptables iso-codes ispell \
iucode-tool java-common javascript-common kbd kded5 kio klibc-utils \
lib32gcc-s1 lib32stdc++6 liba52-0.7.4 libaa1 libaacs0 libabw-0.1-1 \
libaccountsservice0 libaec0 libalgorithm-diff-perl libalgorithm-diff-xs-perl \
libalgorithm-merge-perl libaliased-perl libaom0 libappstream-glib8 \
libappstream4 libapt-pkg-perl libarchive-cpio-perl libarchive-zip-perl \
libarchive13 libaribb24-0 libarmadillo10 libarpack2 libasan6 libasm1 \
libasound2-data libasound2-plugins libasound2 libaspell15 libass9 libassuan0 \
libasyncns0 libatasmart4 libatk-bridge2.0-0 libatk-wrapper-java-jni \
libatk-wrapper-java libatk1.0-0 libatk1.0-data libatkmm-1.6-1v5 libatomic1 \
libatspi2.0-0 libauthen-sasl-perl libavahi-client3 libavahi-common-data \
libavahi-common3 libavahi-core7 libavahi-glib1 libavc1394-0 libavcodec-extra58 \
libavfilter7 libavformat58 libavresample4 libavutil56 \
libayatana-appindicator3-1 libayatana-ido3-0.4-0 libayatana-indicator3-7 \
libb-hooks-endofscope-perl libb-hooks-op-check-perl libb2-1 libbdplus0 \
libbinutils libblas3 libblockdev-crypto2 libblockdev-fs2 libblockdev-loop2 \
libblockdev-part-err2 libblockdev-part2 libblockdev-swap2 libblockdev-utils2 \
libblockdev2 libbluetooth3 libbluray2 libboost-filesystem1.74.0 \
libboost-iostreams1.74.0 libboost-locale1.74.0 libboost-thread1.74.0 \
libbrotli1 libbs2b0 libc-dev-bin libc-devtools libc-l10n libc6-dev libc6-i386 \
libcaca0 libcairo-gobject-perl libcairo-gobject2 libcairo-perl libcairo2 \
libcairomm-1.0-1v5 libcaja-extension1 libcanberra-gtk3-0 \
libcanberra-gtk3-module libcanberra0 libcapture-tiny-perl libcbor0 libcc1-0 \
libcddb2 libcdio-cdda2 libcdio-paranoia2 libcdio19 libcdparanoia0 libcdr-0.1-1 \
libcfitsio9 libcharls2 libchromaprint1 libclang-common-11-dev libclang-cpp11 \
libclang1-11 libclass-data-inheritable-perl libclass-method-modifiers-perl \
libclass-xsaccessor-perl libclone-perl libclucene-contribs1v5 \
libclucene-core1v5 libcmis-0.5-5v5 libcodec2-0.9 libcolamd2 libcolord2 \
libcolorhug2 libconfig-tiny-perl libcpanel-json-xs-perl libcrypt-dev \
libctf-nobfd0 libctf0 libcups2 libcurl3-gnutls libcurl4 libdaemon0 libdap27 \
libdapclient6v5 libdata-dpath-perl libdata-dump-perl libdata-messagepack-perl \
libdata-optlist-perl libdata-validate-domain-perl libdatrie1 libdav1d4 \
libdbus-1-3 libdbus-glib-1-2 libdbusmenu-glib4 libdbusmenu-gtk3-4 \
libdbusmenu-qt5-2 libdc1394-25 libdca0 libdconf1 libde265-0 libdebhelper-perl \
libdeflate0 libdevel-callchecker-perl libdevel-size-perl \
libdevel-stacktrace-perl libdiscover2 libdjvulibre-text libdjvulibre21 \
libdmapsharing-3.0-2 libdouble-conversion3 libdpkg-perl libdrm-amdgpu1 \
libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libdv4 \
libdvbpsi10 libdvdnav4 libdvdread8 libdw1 libdynaloader-functions-perl \
libe-book-0.1-1 libebml5 libefiboot1 libefivar1 libegl1 \
libemail-address-xs-perl libenchant-2-2 libencode-locale-perl libeot0 \
libepoxy0 libepsilon1 libept1.6.0 libepubgen-0.1-1 liberror-perl \
libetonyek-0.1-1 libevdev2 libevdocument3-4 libevent-2.1-7 libevview3-3 \
libexception-class-perl libexif12 libexo-2-0 libexo-common libexpat1 \
libexporter-tiny-perl libexttextcat-2.0-0 libexttextcat-data \
libextutils-depends-perl libextutils-pkgconfig-perl libfaad2 libfakeroot \
libfam0 libfdk-aac2 libffi-dev libfftw3-double3 libfido2-1 \
libfile-basedir-perl libfile-desktopentry-perl libfile-fcntllock-perl \
libfile-find-rule-perl libfile-listing-perl libfile-mimeinfo-perl \
libfile-slurper-perl libfile-stripnondeterminism-perl libfile-which-perl \
libflac8 libflashrom1 libflatpak0 libflite1 libfluidsynth2 libfolks25 \
libfont-afm-perl libfont-ttf-perl libfontconfig1 libfontenc1 libfreehand-0.1-1 \
libfreetype6 libfreexl1 libfribidi0 libfstrm0 libftdi1-2 libfuse2 libfwupd2 \
libfwupdplugin1 libfyba0 libgail-common libgail18 libgarcon-1-0 \
libgarcon-common libgarcon-gtk3-1-0 libgc1 libgcab-1.0-0 libgcc-10-dev \
libgck-1-0 libgconf-2-4 libgcr-base-3-1 libgcr-ui-3-1 libgd3 libgdal28 \
libgdata-common libgdata22 libgdbm-compat4 libgdbm6 libgdcm3.0 \
libgdk-pixbuf-2.0-0 libgdk-pixbuf-xlib-2.0-0 libgdk-pixbuf2.0-0 \
libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common libgee-0.8-2 libgeoclue-2-0 \
libgeocode-glib0 libgeos-3.9.0 libgeos-c1v5 libgeotiff5 libgfortran5 libgif7 \
libgirepository-1.0-1 libgjs0g libgl1 libgles2 libglew2.1 \
libglib-object-introspection-perl libglib-perl libglib2.0-0 libglib2.0-bin \
libglib2.0-data libglibmm-2.4-1v5 libglu1-mesa libglvnd0 libglx0 libgme0 \
libgmime-3.0-0 libgnome-desktop-3-19 libgnomekbd-common libgnomekbd8 \
libgnustep-base1.27 libgnutls-dane0 libgoa-1.0-0b libgoa-1.0-common libgomp1 \
libgpgme11 libgpgmepp6 libgphoto2-6 libgphoto2-l10n libgphoto2-port12 libgpm2 \
libgpod-common libgpod4 libgraphene-1.0-0 libgraphite2-3 libgrilo-0.3-0 \
libgs9-common libgs9 libgsasl7 libgsm1 libgsound0 libgspell-1-2 \
libgspell-1-common libgssdp-1.2-0 libgstreamer-gl1.0-0 \
libgstreamer-opencv1.0-0 libgstreamer-plugins-bad1.0-0 \
libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libgtk-3-0 libgtk-3-bin \
libgtk-3-common libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libgtk3-perl \
libgtkmm-3.0-1v5 libgtksourceview-3.0-1 libgtksourceview-3.0-common \
libgtksourceview-4-0 libgtksourceview-4-common libgtop-2.0-11 libgtop2-common \
libgudev-1.0-0 libgupnp-1.2-0 libgupnp-igd-1.0-4 libgusb2 libgweather-3-16 \
libgweather-common libgxps2 libhandy-1-0 libharfbuzz-icu0 libharfbuzz0b \
libhdf4-0-alt libhdf5-103-1 libhdf5-hl-100 libheif1 libhtml-form-perl \
libhtml-format-perl libhtml-html5-entities-perl libhtml-parser-perl \
libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl \
libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl \
libhunspell-1.7-0 libhyphen0 libice-dev libice6 libicu67 libidn11 \
libiec61883-0 libieee1284-3 libigdgmm11 libijs-0.35 libilmbase25 \
libimagequant0 libimobiledevice6 libimport-into-perl libinih1 libinput-bin \
libinput10 libinstpatch-1.0-2 libio-html-perl libio-socket-ssl-perl \
libio-string-perl libio-stringy-perl libip6tc2 libipc-run3-perl \
libipc-system-simple-perl libisl23 libiterator-perl libiterator-util-perl \
libitm1 libixml10 libjack-jackd2-0 libjavascriptcoregtk-4.0-18 libjbig0 \
libjbig2dec0 libjcat1 libjim0.79 libjpeg62-turbo libjs-jquery libjs-mathjax \
libjson-glib-1.0-0 libjson-glib-1.0-common libjson-maybexs-perl libjuh-java \
libjurt-java libkate1 libkeybinder-3.0-0 libkf5archive5 libkf5attica5 \
libkf5auth-data libkf5authcore5 libkf5bookmarks-data libkf5bookmarks5 \
libkf5codecs-data libkf5codecs5 libkf5completion-data libkf5completion5 \
libkf5config-data libkf5configcore5 libkf5configgui5 libkf5configwidgets-data \
libkf5configwidgets5 libkf5coreaddons-data libkf5coreaddons5 libkf5crash5 \
libkf5dbusaddons-data libkf5dbusaddons5 libkf5doctools5 libkf5globalaccel-bin \
libkf5globalaccel-data libkf5globalaccel5 libkf5globalaccelprivate5 \
libkf5guiaddons5 libkf5i18n-data libkf5i18n5 libkf5iconthemes-data \
libkf5iconthemes5 libkf5itemviews-data libkf5itemviews5 libkf5jobwidgets-data \
libkf5jobwidgets5 libkf5kiocore5 libkf5kiofilewidgets5 libkf5kiogui5 \
libkf5kiontlm5 libkf5kiowidgets5 libkf5notifications-data libkf5notifications5 \
libkf5sane-data libkf5sane5 libkf5service-bin libkf5service-data \
libkf5service5 libkf5solid5-data libkf5solid5 libkf5sonnet5-data \
libkf5sonnetcore5 libkf5sonnetui5 libkf5textwidgets-data libkf5textwidgets5 \
libkf5wallet-bin libkf5wallet-data libkf5wallet5 libkf5widgetsaddons-data \
libkf5widgetsaddons5 libkf5windowsystem-data libkf5windowsystem5 \
libkf5xmlgui-data libkf5xmlgui5 libklibc libkmlbase1 libkmldom1 libkmlengine1 \
libkpathsea6 libksba8 libkwalletbackend5-5 liblangtag-common liblangtag1 \
liblapack3 liblcms2-2 libldap-2.4-2 libldap-common libldb2 liblept5 liblhasa0 \
liblibreoffice-java liblightdm-gobject-1-0 liblilv-0-0 liblirc-client0 \
liblist-compare-perl liblist-moreutils-perl liblist-moreutils-xs-perl \
liblist-utilsby-perl libllvm11 liblmdb0 liblsan0 libltc11 libltdl-dev libltdl7 \
liblua5.2-0 liblwp-mediatypes-perl liblwp-protocol-https-perl liblzo2-2 \
libmad0 libmagic-mgc libmagic1 libmail-sendmail-perl libmailtools-perl \
libmailutils7 libmalcontent-0-0 libmanette-0.2-0 libmariadb3 libmarkdown2 \
libmatroska7 libmaxminddb0 libmbim-glib4 libmbim-proxy libmd4c0 libmfx1 \
libmhash2 libminizip1 libmjpegutils-2.1-0 libmm-glib0 libmms0 libmodplug1 \
libmodule-implementation-perl libmodule-runtime-perl libmoo-perl \
libmoox-aliases-perl libmouse-perl libmozjs-78-0 libmp3lame0 libmpc3 \
libmpcdec6 libmpdec3 libmpeg2-4 libmpeg2encpp-2.1-0 libmpfr6 libmpg123-0 \
libmplex2-2.1-0 libmspack0 libmspub-0.1-1 libmtdev1 libmtp-common \
libmtp-runtime libmtp9 libmwaw-0.3-3 libmysofa1 libmythes-1.2-0 \
libnamespace-clean-perl libnautilus-extension1a libncurses-dev libndp0 \
libneon27-gnutls libnet-dbus-perl libnet-domain-tld-perl libnet-http-perl \
libnet-smtp-ssl-perl libnet-ssleay-perl libnetcdf18 libnetfilter-conntrack3 \
libnfnetlink0 libnfs13 libnghttp2-14 libnice10 libnl-3-200 libnl-genl-3-200 \
libnl-route-3-200 libnm0 libnma-common libnma0 libnorm1 libnotify-bin \
libnotify4 libnpth0 libnsl-dev libnspr4 libnss-mdns libntfs-3g883 libntlm0 \
libnuma1 libnumber-compare-perl libnumbertext-1.0-0 libnumbertext-data \
libobjc-10-dev libobjc4 libodbc1 libodfgen-0.1-1 libofa0 libogdi4.1 libogg0 \
libomp-11-dev libomp5-11 liboobs-1-5 libopenal-data libopenal1 \
libopencore-amrnb0 libopencore-amrwb0 libopencv-calib3d4.5 \
libopencv-contrib4.5 libopencv-core4.5 libopencv-dnn4.5 \
libopencv-features2d4.5 libopencv-flann4.5 libopencv-highgui4.5 \
libopencv-imgcodecs4.5 libopencv-imgproc4.5 libopencv-ml4.5 \
libopencv-objdetect4.5 libopencv-video4.5 libopenexr25 libopenjp2-7 \
libopenmpt-modplug1 libopenmpt0 libopenni2-0 libopus0 liborc-0.4-0 \
liborcus-0.16-0 liborcus-parser-0.16-0 libostree-1-1 libpackage-stash-perl \
libpackage-stash-xs-perl libpackagekit-glib2-18 libpagemaker-0.0-0 \
libpam-gnome-keyring libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 \
libpangomm-1.4-1v5 libpangoxft-1.0-0 libpaper-utils libpaper1 \
libparams-classify-perl libparams-util-perl libparted-fs-resize0 libparted2 \
libpath-tiny-perl libpcap0.8 libpci3 libpciaccess0 libpcre2-16-0 libpcsclite1 \
libpeas-1.0-0 libpeas-common libperl5.32 libperlio-gzip-perl \
libperlio-utf8-strict-perl libpfm4 libpgm-5.3-0 libphonon4qt5-4 \
libphonon4qt5-data libphysfs1 libpipeline1 libpipewire-0.3-0 \
libpipewire-0.3-modules libpixman-1-0 libplacebo72 libplist3 libplymouth5 \
libpng16-16 libpocketsphinx3 libpolkit-agent-1-0 libpolkit-gobject-1-0 \
libpolkit-qt5-1-1 libpoppler-glib8 libpoppler102 libpostproc55 libpq5 \
libproc-processtable-perl libproj19 libprotobuf-c1 libprotobuf-lite23 \
libprotobuf23 libproxy1v5 libpsl5 libpthread-stubs0-dev \
libpulse-mainloop-glib0 libpulse0 libpulsedsp libpython3-stdlib \
libpython3.9-minimal libpython3.9-stdlib libpython3.9 libqhull8.0 libqmi-glib5 \
libqmi-proxy libqrcodegencpp1 libqrencode4 libqt5core5a libqt5dbus5 libqt5gui5 \
libqt5network5 libqt5printsupport5 libqt5qml5 libqt5qmlmodels5 libqt5quick5 \
libqt5svg5 libqt5texttospeech5 libqt5waylandclient5 libqt5widgets5 \
libqt5x11extras5 libqt5xml5 libquadmath0 libquvi-0.9-0.9.3 libquvi-scripts-0.9 \
libqxp-0.0-0 librabbitmq4 libraptor2-0 libraqm0 librasqal3 libraw1394-11 \
librdf0 libreadonly-perl libref-util-perl libref-util-xs-perl \
libregexp-assemble-perl libreoffice-base-core libreoffice-base-drivers \
libreoffice-base libreoffice-calc libreoffice-common libreoffice-core \
libreoffice-draw libreoffice-impress libreoffice-java-common libreoffice-math \
libreoffice-report-builder-bin libreoffice-style-colibre libreoffice-writer \
libreofficekit-data libresid-builder0c2a librest-0.7-0 librevenge-0.0-0 \
librhythmbox-core10 libridl-java librole-tiny-perl librsvg2-2 librsvg2-common \
librtmp1 librttopo1 librubberband2 libruby2.7 libsamplerate0 libsane-common \
libsane1 libsasl2-2 libsasl2-modules-db libsasl2-modules libsbc1 \
libsdl-image1.2 libsdl1.2debian libsdl2-2.0-0 libsdl2-image-2.0-0 \
libsecret-1-0 libsecret-common libsensors-config libsensors5 libserd-0-0 \
libsereal-decoder-perl libsereal-encoder-perl libsgutils2-2 libshine3 \
libshout3 libsidplay1v5 libsidplay2 libsigc++-2.0-0v5 libsigsegv2 libsm-dev \
libsm6 libsmbclient libsmbios-c2 libsnappy1v5 libsndfile1 libsndio7.0 \
libsnmp-base libsnmp40 libsocket++1 libsodium23 libsord-0-0 libsoundtouch1 \
libsoup-gnome2.4-1 libsoup2.4-1 libsoxr0 libspa-0.2-modules libspandsp2 \
libspatialaudio0 libspatialite7 libspectre1 libspeex1 libspeexdsp1 \
libsphinxbase3 libsqlite3-0 libsratom-0-0 libsrt1.4-gnutls libsrtp2-1 \
libssh-gcrypt-4 libssh2-1 libstaroffice-0.0-0 libstartup-notification0 \
libstdc++-10-dev libstemmer0d libstrictures-perl libsub-exporter-perl \
libsub-exporter-progressive-perl libsub-identify-perl libsub-install-perl \
libsub-name-perl libsub-override-perl libsub-quote-perl libsuitesparseconfig5 \
libsuperlu5 libswresample3 libswscale5 libsynctex2 libsys-hostname-long-perl \
libsz2 libtag1v5-vanilla libtag1v5 libtagc0 libtalloc2 libtbb2 libtcl8.6 \
libtdb1 libteamdctl0 libtesseract4 libtevent0 libtext-glob-perl \
libtext-levenshteinxs-perl libtext-markdown-discount-perl libtext-xslate-perl \
libthai-data libthai0 libtheora0 libthunarx-3-0 libtie-ixhash-perl libtiff5 \
libtime-duration-perl libtime-moment-perl libtimedate-perl libtinfo-dev \
libtirpc-dev libtk8.6 libtool libtotem-plparser-common libtotem-plparser18 \
libtry-tiny-perl libtsan0 libtss2-esys-3.0.2-0 libtss2-mu0 libtss2-sys1 \
libtss2-tcti-cmd0 libtss2-tcti-device0 libtss2-tcti-mssim0 libtss2-tcti-swtpm0 \
libtumbler-1-0 libtwolame0 libtype-tiny-perl libtype-tiny-xs-perl libu2f-udev \
libubsan1 libuchardet0 libudfread0 libudisks2-0 libunbound8 \
libunicode-utf8-perl libuno-cppu3 libuno-cppuhelpergcc3-3 \
libuno-purpenvhelpergcc3-3 libuno-sal3 libuno-salhelpergcc3-3 libunoil-java \
libunoloader-java libunshield0 libunwind8 libupnp13 libupower-glib3 \
liburi-perl liburing1 liburiparser1 libusb-0.1-4 libusb-1.0-0 libusbmuxd6 \
libutempter0 libuv1 libv4l-0 libv4lconvert0 libva-drm2 libva-wayland2 \
libva-x11-2 libva2 libvariable-magic-perl libvdpau-va-gl1 libvdpau1 \
libvidstab1.1 libvisio-0.1-1 libvisual-0.4-0 libvlc-bin libvlc5 libvlccore9 \
libvncclient1 libvo-aacenc0 libvo-amrwbenc0 libvolume-key1 libvorbis0a \
libvorbisenc2 libvorbisfile3 libvpx6 libvte-2.91-0 libvte-2.91-common \
libvulkan1 libwacom-bin libwacom-common libwacom2 libwavpack1 \
libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 \
libwbclient0 libwebkit2gtk-4.0-37 libwebp6 libwebpdemux2 libwebpmux3 \
libwebrtc-audio-processing1 libwildmidi2 libwnck-3-0 libwnck-3-common libwoff1 \
libwpd-0.10-10 libwpe-1.0-1 libwpebackend-fdo-1.0-1 libwpewebkit-1.0-3 \
libwpg-0.3-3 libwps-0.4-4 libwrap0 libwww-perl libwww-robotrules-perl libx11-6 \
libx11-data libx11-dev libx11-protocol-perl libx11-xcb1 libx264-160 \
libx265-192 libxapian30 libxapp1 libxau-dev libxau6 libxaw7 libxcb-composite0 \
libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-icccm4 libxcb-image0 \
libxcb-keysyms1 libxcb-present0 libxcb-randr0 libxcb-render-util0 \
libxcb-render0 libxcb-res0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-util1 \
libxcb-xfixes0 libxcb-xinerama0 libxcb-xinput0 libxcb-xkb1 libxcb-xv0 \
libxcb1-dev libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp-dev \
libxdmcp6 libxerces-c3.2 libxext6 libxfce4panel-2.0-4 libxfce4ui-2-0 \
libxfce4ui-common libxfce4ui-utils libxfce4util-bin libxfce4util-common \
libxfce4util7 libxfconf-0-3 libxfixes3 libxfont2 libxft2 libxi6 libxinerama1 \
libxkbcommon-x11-0 libxkbcommon0 libxkbfile1 libxkbregistry0 libxklavier16 \
libxml-libxml-perl libxml-namespacesupport-perl libxml-parser-perl \
libxml-sax-base-perl libxml-sax-expat-perl libxml-sax-perl libxml-twig-perl \
libxml-xpathengine-perl libxml2-utils libxml2 libxmlb1 libxmlsec1-nss \
libxmlsec1 libxmu6 libxmuu1 libxpm4 libxpresent1 libxrandr2 libxrender1 \
libxres1 libxshmfence1 libxslt1.1 libxss1 libxt-dev libxt6 libxtst6 libxv1 \
libxvidcore4 libxvmc1 libxxf86dga1 libxxf86vm1 libyajl2 libyaml-0-2 \
libyaml-libyaml-perl libyelp0 libytnef0 libz3-4 libz3-dev libzbar0 \
libzmf-0.0-0 libzmq5 libzvbi-common libzvbi0 light-locker lintian linux-base \
linux-image-5.10.0-8-amd64 linux-libc-dev llvm-11-dev llvm-11-runtime \
llvm-11-tools llvm-11 lm-sensors lp-solve lsb-release lua-bitop lua-expat \
lua-json lua-lpeg lua-socket lzip lzop m4 mailcap mailutils-common mailutils \
make manpages-dev manpages-pt-br mariadb-common media-player-info mesa-utils \
mobile-broadband-provider-info modemmanager mysql-common node-normalize.css \
ntfs-3g ocl-icd-libopencl1 odbcinst1debian2 odbcinst openclipart-png \
opencv-data openjdk-11-jdk-headless openjdk-11-jdk openjdk-11-jre-headless \
openjdk-11-jre openssl os-prober p11-kit-modules p11-kit p7zip-full p7zip \
packagekit-tools packagekit parted patch patchutils pavucontrol pci.ids \
perl-modules-5.32 perl-openssl-defaults phonon4qt5-backend-vlc phonon4qt5 \
pinentry-curses pinentry-gnome3 pipewire-bin pipewire pkg-config plocate \
plymouth-label po-debconf pocketsphinx-en-us policykit-1-gnome policykit-1 \
poppler-data popularity-contest ppp proj-bin proj-data psmisc publicsuffix \
pulseaudio-utils python-apt-common python3-apt python3-bs4 python3-cairo \
python3-certifi python3-chardet python3-configobj python3-dbus python3-debconf \
python3-debian python3-debianbts python3-distro-info python3-distro \
python3-gi-cairo python3-gi python3-html5lib python3-httplib2 python3-idna \
python3-ldb python3-lxml python3-mako python3-markupsafe python3-minimal \
python3-olefile python3-pexpect python3-pil python3-pkg-resources \
python3-psutil python3-ptyprocess python3-pycurl python3-pygments \
python3-pysimplesoap python3-requests-file python3-requests \
python3-setproctitle python3-six python3-software-properties python3-soupsieve \
python3-talloc python3-tk python3-tldextract python3-uno python3-urllib3 \
python3-webencodings python3-xapp python3-xdg python3-xlib python3-yaml \
python3.9-minimal python3.9 python3 qt5-gtk-platformtheme \
qt5-gtk2-platformtheme qt5-style-plugin-cleanlooks qt5-style-plugin-motif \
qt5-style-plugin-plastique qttranslations5-l10n rake rhythmbox-data \
rhythmbox-plugins rtkit ruby-json ruby-minitest ruby-net-telnet \
ruby-power-assert ruby-rubygems ruby-test-unit ruby-xmlrpc ruby2.7 ruby \
rubygems-integration samba-libs sane-utils sgml-base sgml-data \
shared-mime-info software-properties-common sound-theme-freedesktop \
supertux-data system-tools-backends t1utils tango-icon-theme thunar-data \
timgm6mb-soundfont tk8.6-blt2.5 tpm-udev tree tumbler-common udisks2 ufw \
unattended-upgrades uno-libs-private unzip update-inetd upower ure \
usb-modeswitch-data usb-modeswitch usb.ids usbmuxd util-linux-locales \
va-driver-all vdpau-driver-all vlc-bin vlc-data vlc-l10n \
vlc-plugin-access-extra vlc-plugin-base vlc-plugin-notify vlc-plugin-qt \
vlc-plugin-samba vlc-plugin-skins2 vlc-plugin-video-output \
vlc-plugin-video-splitter vlc-plugin-visualization wbrazilian wireless-regdb \
wpasupplicant x11-apps x11-common x11-session-utils x11-utils x11-xkb-utils \
x11-xserver-utils x11proto-dev xapps-common xauth xbitmaps xdg-dbus-proxy \
xdg-desktop-portal-gtk xdg-desktop-portal xfce4-appfinder xfce4-clipman \
xfce4-helpers xfce4-panel xfce4-power-manager-data xfce4-power-manager-plugins \
xfce4-power-manager xfce4-pulseaudio-plugin xfce4-session xfce4-settings \
xfconf xfdesktop4-data xfdesktop4 xfonts-100dpi xfonts-75dpi xfonts-base \
xfonts-encodings xfonts-scalable xfonts-utils xfwm4 xiccd xinit xkb-data \
xml-core xorg-docs-core xorg-sgml-doctools xorg xserver-common \
xserver-xorg-input-all xserver-xorg-input-libinput xserver-xorg-input-wacom \
xserver-xorg-legacy xserver-xorg xtrans-dev yelp-xsl zenity-common zip"

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
sudo apt install $PACOTES_PARA_INSTALAR --no-install-recommends -y

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
