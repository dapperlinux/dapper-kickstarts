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
# Evince
# ---------------------------------------------

# Evince Uses Inverted Colours by Default

cat >> /usr/share/glib-2.0/schemas/org.gnome.evince.default.gschema.override << FOE
[org.gnome.Evince.Default]
inverted-colors=true
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

# Change Desktop And Theme Settings

cat >> /usr/share/glib-2.0/schemas/org.gnome.desktop.interface.gschema.override << FOE
[org.gnome.desktop.interface]
clock-show-date=true
gtk-theme="dapper-dark"
icon-theme="Numix2"
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

# ---------------------------------------------
# Shell
# ---------------------------------------------

# Set Our Favourite Apps for Gnome-Shell and Enable Extensions

cat >> /usr/share/glib-2.0/schemas/org.gnome.shell.gschema.override << FOE
[org.gnome.shell]
enabled-extensions=['user-theme@gnome-shell-extensions.gcampax.github.com']
favorite-apps=['firefox.desktop', 'mozilla-thunderbird.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Terminal.desktop', 'gnome-music.desktop', 'liferea.desktop', 'anaconda.desktop']
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
