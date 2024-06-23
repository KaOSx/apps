/* === This file is part of Calamares - <https://github.com/calamares> ===
 *
 *   Copyright 2020 - 2024, Anke Boersma <demm@kaosx.us>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Item {
    width: parent.width
    height: parent.height
    //focus: true
    //color: "#f2f2f2"

    TextArea {
        id: intro
        //x: 130
        //y: 8
        width: parent.width
        font.pointSize: 12
        textFormat: Text.MarkdownText
        antialiasing: true
        activeFocusOnPress: false
        wrapMode: Text.WordWrap
        text: "## KaOS - 2024.05

It is a great pleasure to present to you the July release of a new stable ISO.

For the Plasma desktop, the latest Plasma (6.1.0), KDE Gear (24.05.1), and Frameworks (6.3.0) are included. All built on **Qt 6.7.2**. Among the many changes included in KDE Gear 24.05, are Dolphin provides a more tailored and informative insights into specific folders by default, so when browsing through recently used files and folders, users will find modification times listed by default and have streamlined access to the most recent items. Itinerary now shows more information about your train and coach facilities. This includes general comfort features such as air conditioning or Wi-Fi, as well as things specifically relevant if you are travelling with young children, a bicycle or a wheelchair. Kdenlive 24.05 add group effects, effects that can be added to clips grouped together all at the same time.

More application are now ready to use Qt6 and Frameworks 6 including Kooka, Qdirstats, KWave and Kaffeine

Support has been added for the all new filesystem **bcachefs**, it is still in experimental stage, but is included in the kernel build, and the needed bcachefs-tools are available in the repositories.  Calamares can use bcachefs when use in manual mode, though no specific settings for this filesystem have been implemented yet.

A new Phonon sound backend is added.  So far VLC was used, but there is no Qt6 porting for VLC yet.  Using **phonon-mpv** as default now, gives a fully Qt 6 ready backend.

New for this ISO  is to no longer include the kernel modesetting for all graphics card, thus shaving roughly 700 Mb of the ISO size.

Four years after being end of life, GTK2 is finally removed from the KaOS repositories.  The one major application left that had still required GTK2 was Ardour, but with 8.4.0, an internal YTK is used, thus GTK2 is now gone.

Updates to the base of the system included a move to Python 3.11, Glib2 2.80 stack, kernel moved to Linux 6.9.10, Systemd 253.20, ZFS 2.2.4, KMod 32, OpenSSL 3.3, FFMPEG 6.1, OpenJDK 17 and Mesa 24.1.2.

Among the new packages included is **Marknote**, a nicely in Plasma 6 integrated note management application.

SDDM 0.20.0 added the option to run this display manager in Wayland mode, so KaOS is one step closer to being ready to move away from X11. The shell used to run in Wayland mode is kwin_wayland (upstream default is using Weston).  **Wayland is the default for SDDM with the move to 0.21.0.**

The automated partitioning option in the installer (Calamares) now offers the use of all popular filesystems, so no need to use manually partitioning to be able to choose XFS, EXT4, BTRFS or ZFS.

Big thanks goes to **YourHostingSolutions** for not only providing a mirror, but also providing a server for KaOS. With the discontinuation of Fosshost, a new server was sorely needed.

To get good logs has always been a bit of a challenge since you have to know what journalctl commands to use. That is now a thing of the past, **Kjournald** gives the option to view the logs from a nice GUI, with all kinds of filter options in the left-hand pane (it is now part of the default install)

After almost two years of testing IWD, it is now in such a good state that it has replaced Wpa_Suplicant as the default wireless daemon for KaOS.  
Similar, Pipewire has replaced PulseAudio as the default sound/low-level multimedia framework.

A shift has started as to how all Python packages are build.  Historically, just about all were build with setuptools though a setup.py script.  PEP17 is the new standard for building python packages, see https://peps.python.org/pep-0517/.  At this stage, KaOS is testing this transition with different new Python build tools, such as Python-flit & Python-build, with Python-wheel currently in use to install the build packages.

For Nvidia, longterm supported versions 390xx and 470xx are include, alongside the latest released version.

Since LibreOffice 6.2, it is now possible to supply this as a pure Qt6/kf6 application.  LibreOffice has thus replaced Calligra as the default Office Application for KaOS.

KaOS' creation **Croeso** (Welsh for welcome) for helping with configuring a new install is included.  It will run on the newly installed system and offers to adjust some 15 commonly used settings, includes a custom Wallpaper selector, distribution info, and the option to select packages to install from six different groups.  It is written in QML and fits well with the Welcome application used in the Live system.  The latter includes an Installation Guide.

There is an option to verify the authenticity of downloaded KaOS ISO files through GPG signature verification, see the Download page for further details and instructions.

The artwork includes a custom icon theme. Midna creates a complete unified look from boot-up all the way through logout.

This ISO uses the **CRC and finobt enabled** XFS filesystem as default. CRCs enable enhanced error detection due to hardware issues, whilst the format changes also improves crash recovery algorithms and the ability  of  various  tools to validate and repair metadata corruptions when they are found.  The  free  inode  btree does not index used inodes, allowing faster, more consistent inode allocation performance as filesystems age.

**Octopi** is becoming a very crucial part of full system maintenance for KaOS. It is not just a GUI frontend to pacman. Tools like making sure a mirror is synced before starting any update, looking at the pacman logs, an option to get a paste from a complete snapshot of all info of a system with the SysInfo tool are included. Also included are very simple ways to open files, like copy to clipboard the file path shown in Octopi. To make sure the system doesn't start using too much disk space for the pacman cache, but still giving the user the option to retain some recent packages, the cache-cleaner tool is a great addition. The built-in tool to access **KCP** has now a much clearer place with the addition of its own foreign icon in the menu-bar. New added is the option to select custom icons for the systemtray.

For UEFI installs, KaOS uses the simple, transparent but quite powerful systemd-boot as bootloader.

To learn more about the goals and ideas behind KaOS, please read the **https://kaosx.us/**, **https://kaosx.us/about/**, and **https://kaosx.us/faq/** pages.

To avoid any misunderstanding and confusion, KaOS is **not based upon, derived of, or inspired by** any one particular distribution. It is completely independent, build entirely from scratch with its own repositories. To read more about this see **https://kaosx.us/about/based/**. A **rolling release distribution** never has a final release, every ISO is merely a snapshot of the current status of the repositories. An idea what is currently available:

The ISO ships with **Frameworks 6.3.0, Plasma 6.1.0, KDE Applications 24.05.1**, Linux 6.9.10, Systemd 253.20, Kmod 32, NetworkManager 1.48.0, LibreOffice 24.2.4, Elisa, Xorg-Server 1.21.13, Mesa 24.1.2, Glibc 2.39, GCC 13.2.1, non-free Nvidia 550 and Python3 3.11.9 to name a few.

The package manager is **Pacman 6.0.2**, with the simple but powerful Octopi 0.16.2 as GUI frontend. Falkon is the default, Qt based, web browser. **GFXboot** is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.

**Repositories** of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200 packages. A gist of what is available, besides the stable kernel there is Linux-next 6.10, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.  
A limited number of the most well-known GTK applications are available, for example, Firefox 127, Chrome 128, Ardour 8.6.0, Inkscape 1.3, GIMP 2.99.18 and Thunderbird 127. Complete language packs are available for KDE, Calligra, Firefox, LibreOffice and Thunderbird. For IM, Fcitx 4.2.9.9 is available as a rather complete group.

**Known issues:**

 * Installing on RAID is currently not possible

**To create reliable** installation media, please follow the instructions from the **https://kaosx.us/download/** page. KaOS's ISO's **do not support Unetbootin or Rufus**, and DVDs need a burn speed **no higher than 4x**."
    }

    /*ToolButton {
        id: toolButton
        x: 19
        y: 29
        width: 105
        height: 48
        text: qsTr("Back")
        hoverEnabled: true
        onClicked: load.source = ""

        Image {
            id: image1
            x: 0
            y: 13
            width: 22
            height: 22
            source: "file:/usr/share/pixmaps/chevron-left-solid.svg"
            fillMode: Image.PreserveAspectFit
        }
    }*/

}
