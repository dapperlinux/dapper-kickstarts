%post

# Setup Our Custom gsettings Commands

cat >> /etc/rc.d/init.d/livesys << EOF

# Fix anaconda by allowing root to view /proc
usermod -aG proc_access root

# Set Calamares branding on .desktop file
sed -i "s%Name=Calamares%Name=Install Dapper Linux%g" /usr/share/applications/calamares.desktop
sed -i "s%Icon=calamares%Icon=/usr/share/icons/Fedora/scalable/apps/anaconda.svg%g" /usr/share/applications/calamares.desktop

# Set Our Favourite Apps for Gnome-Shell and Enable Extensions

cat >> /usr/share/glib-2.0/schemas/95_org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
enabled-extensions=['user-theme@gnome-shell-extensions.gcampax.github.com', 'mediaplayer@patapon.info', 'firewall@subgraph.com', 'ozshell@subgraph.com']
favorite-apps=['dapper-hardened-browser.desktop', 'firefox.desktop', 'evolution.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'com.gexperts.Tilix.desktop', 'gnome-music.desktop', 'net.sourceforge.liferea.desktop', 'calamares.desktop']
FOE

# Rebuild Schema Cache With Any Overrides We Installed
glib-compile-schemas /usr/share/glib-2.0/schemas

EOF

%end
