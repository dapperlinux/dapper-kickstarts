%include fedora-disk-base.ks
%include dapper-repo.ks

services --enabled=sshd,NetworkManager,chronyd,initial-setup

autopart

%packages
# ---------------------------------------------
# Groups to Install
# ---------------------------------------------

# Default Groups
# Note Server environment is broken
#@server-product-environment

@server-product
@standard
@headless-management
@container-management
@domain-client
-initial-setup-gui
-generic-release*


# Groups that are in server environment
@ansible-node
@web-server
@dns-server
@directory-server
@dogtag
@domain-client
@ftp-server
@freeipa-server
@guest-agents
@server-hardware-support
@virtualization-headless
@ha
@load-balancer
@mail-server
@mysql
@network-server
@sql-server
@printing
@smb-server

# ---------------------------------------------
# Adding Dapper Linux Additions
# ---------------------------------------------

# Dappersec Hardened Kernel
dapper-kernel-grsec
dapper-kernel-grsec-core
dapper-kernel-grsec-modules
dapper-kernel-grsec-modules-extra

# Pax tools
dapper-paxset
paxctl
paxctld-systemd
paxtest

# Dapper Linux Branding
dapper-release
dapper-release-notes
dapper-release-server
dapper-logos
dapper-logos-httpd
dapper-repos

# Extra Tools
dapper-screenfetch

# System Applications
dnssec-trigger
tor

# Terminal Applications
ack
chkrootkit
cowsay
elinks
most
nano
rkhunter
tripwire
vim-enhanced

# ---------------------------------------------
# Packages to Remove
# ---------------------------------------------

# Remove standard kernel
-kernel
-kernel-core
-kernel-modules
-kernel-modules-extra

# Remove upstream branding
-fedora-release
-fedora-release-notes
-fedora-release-server
-fedora-logos
-fedora-logos-httpd
-fedora-repos

%end

%post

# setup systemd to boot to the right runlevel
echo -n "Setting default runlevel to multiuser text mode"
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target
echo .

%end

