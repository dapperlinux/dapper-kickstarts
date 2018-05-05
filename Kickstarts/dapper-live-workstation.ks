%include fedora-live-workstation.ks
%include dapper-repo.ks
%include dapper-packages.ks
%include dapper-settings.ks

%packages




%end

%post

cat >> /etc/rc.d/init.d/livesys << EOF

# Turn off Fedora Welcome Screen
rm -f /usr/share/applications/fedora-welcome.desktop
rm -f ~liveuser/.config/autostart/fedora-welcome.desktop

# Ensure Correct Live User Permission and SELinux Contexts
chown -R liveuser:liveuser /home/liveuser/
restorecon -R /home/liveuser/

EOF

%end
