%packages

# ---------------------------------------------
# Free Packages Shipped by Upstream Fedora
# ---------------------------------------------

# System Applications
dconf-editor
dnssec-trigger
dnssec-trigger-panel
firewall-config
gconf-editor
gnome-tweak-tool
gtk-murrine-engine
system-config-printer
numix-icon-theme-circle

# Graphical Applications
gimp
gnome-builder
gnome-music
inkscape
liferea
pdfshuffler
polari
thunderbird
thunderbird-enigmail
transmission-gtk

# Terminal Applications
ack
cowsay
fortune-mod
elinks
fuse-sshfs
golang
java-1.8.0-openjdk
java-1.8.0-openjdk-devel
most
nano
nasm
php
rust
screenfetch
strace
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
lyx

# ---------------------------------------------
# Non Free Extensions (RPM Fusion)
# ---------------------------------------------

# RPM Fusion Repos
rpmfusion-free-release
rpmfusion-nonfree-release

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
vlc
x264

# ---------------------------------------------
# Dapper Linux Packages
# ---------------------------------------------

# Grsec Hardened Kernel
dapper-kernel-grsec
dapper-kernel-grsec-core
dapper-kernel-grsec-modules
dapper-kernel-grsec-modules-extra

# Pax Tools
dapper-paxset
paxctl
paxctld-systemd
paxtest

# RBAC Definitions
#dapper-rbac-def

# Dark Shell Theme
dapper-dark

# Oz Sandbox
oz
dapper-oz-profiles
gnome-shell-extension-ozshell
oztool

# Add Dapper Linux Branding
dapper-backgrounds-gnome
dapper-logos
dapper-logos-httpd
dapper-release
dapper-release-notes
dapper-release-workstation
dapper-repos
dapper-settings

# Hardened Web Browser
dapper-hardened-browser

# Mediaplayer Extension
gnome-shell-extensions-mediaplayer

# Interactive Firewall
application-firewall

# Selinux Policy
dapper-selinux-policy


# ---------------------------------------------
# Packages to Remove
# ---------------------------------------------

# Remove Upstream Branding Per Remix Regulations
-f25-backgrounds-gnome
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
-evolution
-evolution-ews
-evolution-help
-gnome-calendar
-gnome-clocks
-gnome-contacts
-gnome-documents
-gnome-maps
-gnome-weather
-rhythmbox
-shotwell

%end
