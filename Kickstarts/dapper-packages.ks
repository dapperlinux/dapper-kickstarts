%packages

# ---------------------------------------------
# Free Packages Shipped by Upstream Fedora
# ---------------------------------------------

# System Applications
dconf-editor
gconf-editor
gnome-tweak-tool
gtk-murrine-engine
system-config-printer

# Graphical Applications
gimp
gnome-music
inkscape
liferea
pdfshuffler
polari
thunderbird
transmission

# Terminal Applications
cowsay
fortune-mod
elinks
fuse-sshfs
livecd-tools
most
nasm
php
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
#dapper-kernel-grsec
#dapper-kernel-grsec-core
#dapper-kernel-grsec-modules
#dapper-kernel-grsec-modules-extra

# Pax Tools
paxctl
paxctld-systemd
paxtest
#paxrat

# RBAC Definitions
#dapper-rbac-def

# Dark Shell Theme
dapper-dark

# Oz Sandbox
#dapper-oz

# Add Dapper Linux Branding
dapper-backgrounds-gnome
dapper-logos
dapper-logos-httpd
dapper-release
dapper-release-notes
dapper-repos
dapper-settings

# Hardened Firefox
firefox-hardened

# Mediaplayer Extension
gnome-shell-extensions-mediaplayer


# ---------------------------------------------
# Packages to Remove
# ---------------------------------------------

# Remove Upstream Branding Per Remix Regulations
-f24-backgrounds-gnome
-fedora-logos
-fedora-logos-httpd
-fedora-release
-fedora-release-notes
-fedora-repos

# Remove Standard Kernel
#-kernel
#-kernel-core
#-kernel-modules
#-kernel-modules-extra

# Remove Unnecessary packages
-cheese
-evolution
-gnome-clocks
-gnome-contacts
-gnome-documents
-gnome-maps
-gnome-weather
-rhythmbox
-shotwell

%end
