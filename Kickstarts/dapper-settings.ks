%post

# Setup Our Custom gsettings Commands

cat >> /etc/rc.d/init.d/livesys << EOF

# Fix anaconda by allowing root to view /proc
usermod -aG proc_access root

# Set Calamares branding on .desktop file
sed -i "s%Name=Calamares%Name=Install Dapper Linux%g" /usr/share/applications/calamares.desktop
sed -i "s%Icon=calamares%Icon=/usr/share/icons/Fedora/scalable/apps/anaconda.svg%g" /usr/share/applications/calamares.desktop

# Set branding on Calamares installer
rm /usr/share/calamares/branding/auto/branding.desc
cat >> /usr/share/calamares/branding/auto/branding.desc << FOE
---
componentName:  auto

strings:
    productName:         "Dapper Linux"
    shortProductName:    "Dapper Linux"
    version:             "26 (Penguin)"
    shortVersion:        "26"
    versionedName:       "Dapper Linux 26 (Penguin)"
    shortVersionedName:  "Dapper Linux 26"
    bootloaderEntryName: "Dapper Linux"
    productUrl:          "https://dapperlinux.com"
    supportUrl:          "https://github.com/dapperlinux/dapper-linux-issues"
    knownIssuesUrl:      "https://github.com/dapperlinux/dapper-linux-issues"
    releaseNotesUrl:     "https://dapperlinux.com/documentation.html"

images:
    productLogo:         "/usr/share/pixmaps/fedora-logo.png"
    productIcon:         "/usr/share/pixmaps/fedora-logo.png"
    productWelcome:      "/usr/share/pixmaps/fedora-logo.png"

slideshow:               "show.qml"

style:
    sidebarBackground:   "#111111"
    sidebarText:         "#FFFFFF"
    sidebarTextSelect:   "#FFFFFF"
    sidebarTextHighlight:"#5294E2"
FOE

# Set the slideshow used in Calamares installer
rm /usr/share/calamares/branding/auto/show.qml
cat >> /usr/share/calamares/branding/auto/show.qml << FOE
import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    Slide {
        Image {
            id: background
            source: "/usr/share/pixmaps/fedora-logo.png"
            width: 400; height: 400
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }

        Text {
            anchors.horizontalCenter: background.horizontalCenter
            anchors.top: background.bottom
            text: qsTr("Spread the word about Dapper Linux! Imagine a world where everyone ran a secure operating system!")
            wrapMode: Text.WordWrap
            width: root.width
            horizontalAlignment: Text.Center
            onLinkActivated: Qt.openUrlExternally(link)
        }
    }
}
FOE

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
