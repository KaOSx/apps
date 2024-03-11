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
        text: "## KaOS - 2024.03

It is a great pleasure to present to you the March release of a new stable ISO.

**Plasma 6.0.0** (stable release) is of course to focal point of this release.  Highlights of this new version include two major upgrades: a transition to the latest version of our application framework, Qt, and a migration to the modern Linux graphics platform, Wayland. These under-the-hood upgrades benefit Plasma's security, efficiency, and performance, and improve support for modern hardware. Plasma on Wayland now has partial support for High Dynamic Range (HDR). On supported monitors and software, this will provide you with richer and deeper colors for your games, videos, and visual creations.

**New defaults** (configurable to whatever you prefer):
 * Files and folders are now selected with a single-click and opened with a double-click
 * Touchpad tap-to-click is enabled by default on Wayland
 * Wayland is the default graphical session
 * `Thumbnail Grid` is the new default Task Switcher style
 * Clicking on the scrollbar track now scrolls to the clicked location
 * Scrolling on the desktop no longer switches virtual desktops
 * Panels float by default

On many settings pages, buttons have been relocated to the toolbar, enhancing consistency with our other applications and creating additional space for the actual content.

You now have the option to customize your sound theme, and a new default sound theme named `Ocean` has been introduced to replace the `Oxygen` sound theme.

The Look & Feel is also updated for the Plasma 6 move, with the Midna theme, exclusive to KaOS, fully redone.

For the rest of the Plasma 6 desktop, KDE Gear 24.02.0 and Frameworks 6.0.0 are included. Changes included in **KDE Gear 24.02** are KOrganizer now lets you send encrypted and signed email invitations — important if your work requires confidentiality. KMail now supports a few offline and open source AI features.  Kdenlive added support for replacing the audio or the video of a clip in a timeline and further enhanced its subtitle feature, allowing you to incorporate multiple subtitles onto a single track.

Four years after being end of life, GTK2 is finally removed from the KaOS repositories.  The one major application left that had still required GTK2 was Ardour, but with 8.4.0, an internal YTK is used, thus GTK2 is now gone.

Updates to the base of the system included a move to a GCC 13.2.1, Glibc 2.39 & Binutils 2.42 based toolchain, Opencv 4.9.0, kernel moved to Linux 6.7.7, Systemd 253.17, Python 3.10.13, Util-Linux 2.39.3, OpenSSL 3.2, MariaDB 11, and Postgresql 16.

Among the new packages included is **Systemdgenie**, a nicely in Plasma 6 integrated GUI to manage systemd.

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

The ISO ships with **Frameworks 6.0.0, Plasma 6.0.2, KDE Applications 24.02.0**, Linux 6.7.9, Systemd 253.17, Kmod 32, NetworkManager 1.46.0, LibreOffice 24.2.1, Elisa, Xorg-Server 1.21.11, Mesa 24.0.2, Glibc 2.39, GCC 13.2.1, non-free Nvidia 550 and Python3 3.10.13 to name a few.

The package manager is **Pacman 6.0.2**, with the simple but powerful Octopi 0.15.0 as GUI frontend. Falkon is the default, Qt based, web browser. **GFXboot** is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.

**Repositories** of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200 packages. A gist of what is available, besides the stable kernel there is Linux-next 6.7, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.  
A limited number of the most well-known GTK applications are available, for example, Firefox 123, Chrome 123, Ardour 8.4.0, Inkscape 1.3, GIMP 2.99.16 and Thunderbird 115. Complete language packs are available for KDE, Calligra, Firefox, LibreOffice and Thunderbird. For IM, Fcitx 4.2.9.9 is available as a rather complete group.

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
