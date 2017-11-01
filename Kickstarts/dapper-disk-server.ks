%include fedora-disk-server.ks
%include dapper-repo.ks

%packages
# ---------------------------------------------
# Groups to Install
# ---------------------------------------------

# Dapper Linux Server Environment
@^server-product-environment
@^web-server-environment
@^infrastructure-environment

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

# Needed for Install
@anaconda-tools
@platform-vmware

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
fail2ban
fail2ban-systemd
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
-kernel-headers
-kernel-devel*
-kernel-debug*
-kernel-tools*
-kernel-cross*

# Remove upstream branding
-fedora-release
-fedora-release-notes
-fedora-release-server
-fedora-logos
-fedora-logos-httpd
-fedora-repos

# Remove branded environments
-@^custom-environment

%end
