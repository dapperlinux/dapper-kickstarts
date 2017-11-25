%packages

# ---------------------------------------------
# Free Packages Shipped by Upstream Fedora
# ---------------------------------------------

# System Applications
calamares
dconf-editor
dnssec-trigger
dnssec-trigger-panel
firewall-config
gconf-editor
gnome-tweak-tool
gtk-murrine-engine
numix-icon-theme-circle
seahorse
system-config-printer
tilix
tor

# Flatpak
flatpak
flatpak-builder
xdg-desktop-portal

# Graphical Applications


# Terminal Applications
ack
chkrootkit
cowsay
elinks
fortune-mod
fuse-sshfs
golang
java-1.8.0-openjdk
java-1.8.0-openjdk-devel
libvpx
most
nano
nasm
php
rkhunter
rust
strace
tripwire
vim-enhanced
@c-development

# LaTeX Distrubution
texlive
texlive-IEEEconf
texlive-IEEEtran
texlive-a4wide
texlive-beamer
texlive-beameraudience
texlive-beamersubframe
texlive-layaureo
texlive-subfigure
texlive-supertabular
texlive-textpos
texlive-titlesec
texlive-xltxtra

# ---------------------------------------------
# Non Free Extensions (RPM Fusion)
# ---------------------------------------------

# RPM Fusion Repos
rpmfusion-free-release

# Fonts
freetype-freeworld

# Media Applications and Codecs
ffmpeg
gstreamer
gstreamer-ffmpeg
gstreamer-plugin-crystalhd
gstreamer-plugins-bad
gstreamer-plugins-bad-free
gstreamer-plugins-bad-free-extras
gstreamer-plugins-bad
gstreamer-plugins-good
gstreamer-plugins-ugly
gstreamer1-libav
gstreamer1-plugins-bad-free-extras
gstreamer1-plugins-bad-freeworld
gstreamer1-plugins-base-tools
gstreamer1-plugins-good-extras
gstreamer1-plugins-ugly
h264enc
x264

# ---------------------------------------------
# Dapper Linux Packages
# ---------------------------------------------

# Dappersec Hardened Kernel
dapper-secure-kernel
dapper-secure-kernel-core
dapper-secure-kernel-modules
dapper-secure-kernel-modules-extra

# Pax Tools
dapper-paxset
paxctl
paxctld-systemd
paxtest

# Dark Shell Theme
dapper-dark

# Add Dapper Linux Branding
dapper-backgrounds-gnome
dapper-logos
dapper-logos-httpd
dapper-release
dapper-release-notes
dapper-release-workstation
dapper-repos
dapper-gpg-keys
dapper-screenfetch
dapper-settings

# Mediaplayer Extension
gnome-shell-extensions-mediaplayer

# Selinux Policy
dapper-selinux-policy


# ---------------------------------------------
# Packages to Remove
# ---------------------------------------------

# Remove Upstream Branding Per Remix Regulations
-f26-backgrounds-gnome
-fedora-logos
-fedora-logos-httpd
-fedora-release
-fedora-release-notes
-fedora-release-workstation
-fedora-repos

# Remove Standard Kernel
-kernel
-kernel-core
-kernel-modules
-kernel-modules-extra

# Remove Unnecessary packages
-cheese
-gnome-calendar
-gnome-clocks
-gnome-contacts
-gnome-documents
-gnome-maps
-gnome-todo
-gnome-weather
-rhythmbox
-shotwell
-simple-scan

# Remove Standard Installer
-anaconda
-@anaconda-tools

# Remove Applications to be Replaced with Flatpaks

# Fedora Defaults
-dleyna-server
-eog
-evince
-evince-nautilus
-evolution
-evolution-ews
-evolution-help
-@firefox
-gedit
-grilo-plugins
-@libreoffice
-libreoffice-calc
-libreoffice-core
-libreoffice-draw
-libreoffice-impress
-libreoffice-writer
-totem
-totem-nautilus

# Dapper Linux Extras
-gimp
-gnome-builder
-gnome-music
-inkscape
-krita
-liferea
-lyx
-pdfshuffler
-polari
-scribus
-transmission-gtk
-vlc


%end

%post

# Really Remove Libreoffice
dnf remove -y libreoffice-core libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer

# DHCP Client info to use hostnames to lookup flatpak remotes
echo nameserver 8.8.8.8 > /etc/resolv.conf

# ---------------------------------------------
# Flatpak Remotes
# ---------------------------------------------

# Gnome
flatpak remote-add --if-not-exists gnome --from https://sdk.gnome.org/gnome.flatpakrepo

# Kde
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo

# Flathub
flatpak remote-add --if-not-exists flathub --from https://flathub.org/repo/flathub.flatpakrepo

# DapperLinux
#flatpak remote-add --if-not-exists dapperlinux --from https://download.dapperlinux.com/repo/dapperlinux.flatpakrepo

# ---------------------------------------------
# Flatpak Runtimes
# ---------------------------------------------

# Gnome Runtimes
flatpak install gnome org.gnome.Platform 3.26
flatpak install gnome org.gnome.Sdk 3.26

# KDE Runtimes

# ---------------------------------------------
# Flatpak Applications
# ---------------------------------------------

# Dapper Hardened Browser

# Evince
flatpak install -y flathub org.gnome.Evince

# Evolution

# Eye of Gnome
flatpak install -y flathub org.gnome.eog

# Firefox

# Gedit
flatpak install -y flathub org.gnome.gedit

# Gimp
flatpak install -y flathub org.gimp.GIMP

# Gnome-Builder
flatpak install -y flathub org.gnome.Builder

# Gnome-Music

# Inkscape
flatpak install -y flathub org.inkscape.Inkscape

# Krita
flatpak install -y kdeapps org.kde.krita

# Libreoffice
flatpak install -y flathub org.libreoffice.LibreOffice

# Liferea

# Lyx

# Pdfshuffler

# Polari
flatpak install -y flathub org.gnome.Polari

# Scribus
flatpak install -y --from http://drjurf.tk/scribus-flatpak/scribus-nightly.flatpakref

# Totem
flatpak install -y flathub org.gnome.Totem

# Transmission
flatpak install -y flathub com.transmissionbt.Transmission

# VLC
flatpak install -y flathub org.videolan.VLC

%end
