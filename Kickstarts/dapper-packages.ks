%packages

# ---------------------------------------------
# Free Packages Shipped by Upstream Fedora
# ---------------------------------------------

# System Applications
calamares
dconf-editor
dnssec-trigger
firewall-config
gconf-editor
gnome-tweak-tool
grub2-efi
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
liferea
lyx
pdfshuffler

# Terminal Applications
ack
cargo
chkrootkit
cowsay
elinks
figlet
fortune-mod
fuse-sshfs
gem
golang
java-openjdk
java-openjdk-devel
libvpx
most
nano
nasm
php
rkhunter
ruby
ruby-devel
rust
strace
toilet
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

# Dracut
dapper-dracut
dapper-dracut-config-rescue
dapper-dracut-live
dapper-dracut-network

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
-f28-backgrounds-gnome
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

# Remove Standard Dracut
-dracut
-dracut-caps
-dracut-config
-dracut-config-rescue
-dracut-live
-dracut-network
-dracut-tools

# Remove Unnecessary packages
-cheese
-gnome-calendar
-gnome-clocks
-gnome-contacts
-gnome-documents
-gnome-maps
-gnome-photos
-gnome-todo
-gnome-weather
-rhythmbox
-shotwell
-simple-scan

# Remove Standard Installer
-anaconda

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
-gnome-calculator
-grilo-plugins
-kdump-anaconda-addon
-@libreoffice
-libreoffice-calc
-libreoffice-core
-libreoffice-draw
-libreoffice-impress
-libreoffice-writer
-libreoffice-pyuno
-totem
-totem-nautilus
-unoconv

# Dapper Linux Extras
-dnssec-trigger-panel
-gimp
-gnome-builder
-gnome-music
-inkscape
-krita
#-lyx
#-pdfshuffler
-polari
-scribus
-thunderbird
-transmission-gtk
-vlc


%end

%post

# Really Remove Libreoffice
dnf remove -y libreoffice-core libreoffice-calc libreoffice-draw libreoffice-impress libreoffice-writer

# Really Remove Anaconda
dnf remove -y anaconda

# DHCP Client info to use hostnames to lookup flatpak remotes
echo nameserver 8.8.8.8 > /etc/resolv.conf

# ---------------------------------------------
# Flatpak Remotes
# ---------------------------------------------

# Flathub
flatpak remote-add --if-not-exists flathub --from https://flathub.org/repo/flathub.flatpakrepo

# DapperLinux
flatpak remote-add --if-not-exists dapperlinux --from https://download.dapperlinux.com/dapperlinux.flatpakrepo

# ---------------------------------------------
# Flatpak Runtimes
# ---------------------------------------------

# Gnome Runtimes
flatpak install flathub org.gnome.Platform 3.30
flatpak install flathub org.gnome.Sdk 3.30

# ---------------------------------------------
# Flatpak Applications
# ---------------------------------------------

# Dapper Dark GTK Theme
flatpak install -y dapperlinux org.gtk.Gtk3theme.dapper-dark

# Dapper Hardened Browser
flatpak install -y dapperlinux com.dapperlinux.Dapper-Hardened-Browser

# Evince
flatpak install -y flathub org.gnome.Evince

# Eye of Gnome
flatpak install -y flathub org.gnome.eog

# Firefox
flatpak install -y dapperlinux org.mozilla.Firefox

# Gedit
flatpak install -y flathub org.gnome.gedit

# Gimp
flatpak install -y flathub org.gimp.GIMP

# Gnome-Builder
flatpak install -y flathub org.gnome.Builder

# Gnome-Calculator
flatpak install -y flathub org.gnome.Calculator

# Gnome-Music
flatpak install -y flathub org.gnome.Music

# Inkscape
flatpak install -y flathub org.inkscape.Inkscape

# Krita
flatpak install -y flathub org.kde.krita

# Libreoffice
flatpak install -y flathub org.libreoffice.LibreOffice

# Lyx

# Pdfshuffler

# Polari
flatpak install -y flathub org.gnome.Polari

# Scribus

# Thunderbird
flatpak install -y flathub org.mozilla.Thunderbird
flatpak update -y --commit=56f777252f901346eaeb5ddebd56438b19965079866026aa93237d7589f3538d org.mozilla.Thunderbird

# Transmission
flatpak install -y flathub com.transmissionbt.Transmission

# VLC
flatpak install -y flathub org.videolan.VLC

%end
