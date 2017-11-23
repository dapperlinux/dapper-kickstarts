%post

# Setup Our Custom gsettings Commands

cat >> /etc/rc.d/init.d/livesys << EOF

# The following disable specific grsecurity chroot protection features.
# This is for the livecd only, in order for the install to succeed.
# These features are always enabled on standard Dapper Linux installs.

# Fix Calamares use of features that abuse chroots when using LUKS keyfiles
echo 0 > /proc/sys/kernel/grsecurity/chroot_restrict_nice
echo 0 > /proc/sys/kernel/grsecurity/chroot_caps

# Fix Calamares use of features that abuse chroots when generating initramfs
echo 0 > /proc/sys/kernel/grsecurity/chroot_deny_mknod
echo 0 > /proc/sys/kernel/grsecurity/chroot_deny_chmod

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
    version:             "27 (Parrot)"
    shortVersion:        "27"
    versionedName:       "Dapper Linux 27 (Parrot)"
    shortVersionedName:  "Dapper Linux 27"
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
enabled-extensions=['user-theme@gnome-shell-extensions.gcampax.github.com', 'mediaplayer@patapon.info']
favorite-apps=['dapper-hardened-browser.desktop', 'firefox.desktop', 'evolution.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'com.gexperts.Tilix.desktop', 'gnome-music.desktop', 'net.sourceforge.liferea.desktop', 'calamares.desktop']
FOE

# Rebuild Schema Cache With Any Overrides We Installed
glib-compile-schemas /usr/share/glib-2.0/schemas

EOF

%end
