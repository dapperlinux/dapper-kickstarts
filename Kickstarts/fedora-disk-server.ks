%include fedora-disk-base.ks

services --enabled=sshd,NetworkManager,chronyd,initial-setup

autopart

%packages
# install the default groups for the server evironment since installing the environment is not working
@server-product
@standard
@headless-management
@container-management
@domain-client
-initial-setup-gui
-generic-release*
%end

%post

# setup systemd to boot to the right runlevel
echo -n "Setting default runlevel to multiuser text mode"
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target
echo .

%end

