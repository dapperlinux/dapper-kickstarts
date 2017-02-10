%post

# Setup Our Custom gsettings Commands

cat >> /etc/rc.d/init.d/livesys << EOF

# ---------------------------------------------
# Nautilus
# ---------------------------------------------

# Set the Icon View to Sensible Values

cat >> /usr/share/glib-2.0/schemas/org.gnome.nautilus.icon-view.gschema.override << FOE
[org.gnome.nautilus.icon-view]
default-zoom-level="standard"
FOE

# Single Click for Nautilus and hide sidebar

cat >> /usr/share/glib-2.0/schemas/org.gnome.nautilus.preferences.gschema.override << FOE
[org.gnome.nautilus.preferences]
click-policy="single"
sort-directories-first=true
search-filter-time-type="last_modified"
FOE

# Window State Perferences

cat >> /usr/share/glib-2.0/schemas/org.gnome.nautilus.window-state.gschema.override << FOE
[org.gnome.nautilus.window-state]
start-with-sidebar=false
maximized=false
geometry="704x402+23+15"
FOE

# ---------------------------------------------
# GTK
# ---------------------------------------------

# Sort Folders Before Icons

cat >> $buildroot$datadir/glib-2.0/schemas/org.gtk.settings.file-chooser.gschema.override << FOE
[org.gtk.Settings.FileChooser]
sort-directories-first=true
FOE

# ---------------------------------------------
# Evince
# ---------------------------------------------

# Evince Uses Inverted Colours by Default

cat >> /usr/share/glib-2.0/schemas/org.gnome.Evince.Default.gschema.override << FOE
[org.gnome.Evince.Default]
inverted-colors=true
FOE

# ---------------------------------------------
# Eog
# ---------------------------------------------

# EOG Hide Sidebar

cat >> /usr/share/glib-2.0/schemas/org.gnome.eog.ui.gschema.override << FOE
[org.gnome.eog.ui]
sidebar=false
FOE

# ---------------------------------------------
# Gedit
# ---------------------------------------------

cat >> /usr/share/glib-2.0/schemas/org.gnome.gedit.preferences.editor.gschema.override << FOE
[org.gnome.gedit.preferences.editor]
auto-indent=true
auto-save=true
auto-save-interval=5
bracket-matching=true
create-backup-copy=true
display-line-numbers=true
display-overview-map=true
display-right-margin=true
insert-spaces=true
tabs-size=4
FOE

cat >> /usr/share/glib-2.0/schemas/org.gnome.gedit.preferences.ui.gschema.override << FOE
[org.gnome.gedit.preferences.ui]
side-panel-visible=false
statusbar-visible=false
FOE

# ---------------------------------------------
# Liferea
# ---------------------------------------------

# Hide Toolbar, Dont Minimise to Tray and Keep Items
cat >> /usr/share/glib-2.0/schemas/net.sf.liferea.gschema.override << FOE
[net.sf.liferea]
disable-toolbar=true
dont-minimise-to-tray=true
trayicon=false
maxitemcount=999
FOE

# ---------------------------------------------
# Terminal
# ---------------------------------------------

# Terminal Hide Menubar

cat >> /usr/share/glib-2.0/schemas/org.gnome.Terminal.Legacy.Settings.gschema.override << FOE
[org.gnome.Terminal.Legacy.Settings]
default-show-menubar=false
FOE

# ---------------------------------------------
# Desktop
# ---------------------------------------------

# Set the Desktop and Lock Screen Backgrounds

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.background.gschema.override << FOE
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/dapperlinux/default/ultrahd/dapperlinux.png'
FOE

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.screensaver.gschema.override << FOE
[org.gnome.desktop.screensaver]
picture-uri='file:///usr/share/backgrounds/dapperlinux/default/ultrahd/dapperlinux.png'
FOE

# Ensure Mouse Scrolling is Correct

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.peripherals.mouse.gschema.override << FOE
[org.gnome.desktop.peripherals.mouse]
natural-scroll=false
FOE

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.peripherals.touchpad.gschema.override << FOE
[org.gnome.desktop.peripherals.touchpad]
natural-scroll=false
FOE

# Change Desktop And Theme Settings

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.interface.gschema.override << FOE
[org.gnome.desktop.interface]
clock-show-date=true
gtk-theme="dapper-dark"
icon-theme="Numix-Circle"
FOE

# Clean Up Old Temp Files

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.privacy.gschema.override << FOE
[org.gnome.desktop.privacy]
remove-old-temp-files=true
remove-old-trash-files=true
old-files-age=1
report-technical-problems=false
FOE

# Set most as Manpage Provider for Colour Manpages

cat >> /home/liveuser/.bashrc << FOE
export MANPAGER="/usr/bin/most -s"
FOE

# Set Anaconda Branding
cp /usr/share/icons/Fedora/scalable/apps/anaconda.svg /usr/share/icons/Adwaita/scalable/apps/
sed -i "s%Icon=anaconda%Icon=/usr/share/icons/Fedora/scalable/apps/anaconda.svg%g" /usr/share/applications/anaconda.desktop

# Fix Nautilus Icon
ln -sf /usr/share/icons/Numix-Circle/48/apps/file-manager.svg /usr/share/icons/Numix-Circle/48/apps/org.gnome.Nautilus.svg

# ---------------------------------------------
# Oz
# ---------------------------------------------
mkdir -p /media/liveuser
usermod -aG xpra liveuser
mkdir -p /run/resolvconf

# ---------------------------------------------
# Shell Extensions
# ---------------------------------------------

# Mediaplayer Settings

cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.extensions.mediaplayer.gschema.override << FOE
[org.gnome.shell.extensions.mediaplayer]
indicator-position='right'
position=true
status-size=300
status-text='{trackTitle} - {trackArtist}'
volume=false
FOE


# ---------------------------------------------
# Shell
# ---------------------------------------------

# Set Our Favourite Apps for Gnome-Shell and Enable Extensions

cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
enabled-extensions=['user-theme@gnome-shell-extensions.gcampax.github.com', 'mediaplayer@patapon.info', 'firewall@subgraph.com', 'ozshell@subgraph.com']
favorite-apps=['firefox-hardened.desktop', 'firefox.desktop', 'mozilla-thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Terminal.desktop', 'gnome-music.desktop', 'liferea.desktop', 'anaconda.desktop']
FOE

# Set Custom Shell Theme

cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.extensions.user-theme.gschema.override << FOE
[org.gnome.shell.extensions.user-theme]
name="dapper-dark"
FOE

# Make Menu Bars Smaller

cat > ~/.config/gtk-3.0/gtk.css << FOE
.header-bar.default-decoration {
    padding-top: 3px;
    padding-bottom: 3px;
    border: none;
    background-image: linear-gradient(to bottom,
                                      shade(@theme_bg_color, 1.05),
                                      shade(@theme_bg_color, 0.99));
    box-shadow: inset 0 1px shade(@theme_bg_color, 1.4);
}

.header-bar.default-decoration .button.titlebutton {
    padding-top: 2px;
    padding-bottom: 2px;
}

FOE

# Set Fonts Looking Nice - Requires freetype-freeworld

cat > /etc/fonts/local.conf << FOE
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
    <match target="font">
        <edit name="antialias" mode="assign">
            <bool>true</bool>
        </edit>
        <edit name="autohint" mode="assign">
            <bool>false</bool>
        </edit>
        <edit name="embeddedbitmap" mode="assign">
            <bool>false</bool>
        </edit>
        <edit name="hinting" mode="assign">
            <bool>true</bool>
        </edit>
        <edit name="hintstyle" mode="assign">
            <const>hintslight</const>
        </edit>
        <edit name="lcdfilter" mode="assign">
            <const>lcdlight</const>
        </edit>
        <edit name="rgba" mode="assign">
            <const>rgb</const>
        </edit>
    </match>
</fontconfig>

FOE

# Rebuild Schema Cache With Any Overrides We Installed
glib-compile-schemas /usr/share/glib-2.0/schemas

EOF

%end
