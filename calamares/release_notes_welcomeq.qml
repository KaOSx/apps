/* === This file is part of Calamares - <https://github.com/calamares> ===
 *
 *   Copyright 2020 - 2021, Anke Boersma <demm@kaosx.us>
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

import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

Rectangle {
    width: parent.width
    height: parent.height
    focus: true
    color: "#f2f2f2"

    Flickable {
        id: flick
        anchors.fill: parent
        contentHeight: 4200
        
        ScrollBar.vertical: ScrollBar {
            id: fscrollbar 
            width: 10
            policy: ScrollBar.AlwaysOn
        }

        TextArea {
            id: intro
            x: 130
            y: 8
            width: 640
            font.pointSize: 14
            textFormat: Text.RichText
            antialiasing: true
            activeFocusOnPress: false
            wrapMode: Text.WordWrap

            text: qsTr("<h3>KaOS - 2021.08</h3>
            <p>It is with great pleasure to present to you the August release of a new stable ISO.</p>
            
            <p>Biggest news for this release are major changes in the aesthetics. The Midna theme has been redone, 
            this includes a uniform look for SDDM and lockscreen with a (darker) transparent sidebar, cleaner splash-screen and darker logout look. The application menu has moved from the long used cascading menu option to the all new Application Launcher introduced with Plasma 5.22.< /br>
            About eighteen months ago, KaOS set out to overhaul all the Calamares view modules into QML, this has now been almost completed (just one left, the partitioning). This release adds another two new QML converted modules, the users and summary pages.  It took a while, but now some other distributions are starting to use the KaOS converted modules too. The QML move gives Calamares a much more modern and uniform look with the other KaOS QML applications.
            
            <p>Of course is it is not just aesthetics for this release, the updates to packages are numerous, some 70 %
            are new.< /br>
            You will find KDE Applications 21.08 on this ISO. Highlights of this new major version include animated sequence of previews in Dolphin, if a folder contains a lot of previewable files. Easier to rename several files in Dolphin with `F2` and `TAB`. Konsole has color and image previews added, just typing a color will show it on hovering and it has an SSH plugin added to work with machines you regularly connect to. In Kdenlive, changing the speed of a clip is now a keyframeable effect.< /br>
            For the Plasma desktop the latest Plasma (5.22.4) and Frameworks (5.85.0) are included.  All built on Qt 5.15.2+.< /br>
            Updates to the base of this distribution include Systemd 249.3, Curl 7.78.0, IWD 1.16, NetworkManager 1.32.8, Mesa 21.1.7, Poppler 21.08.0, Vulkan packages 1.2.187, Udisks 2.9.3, MLT 7.0.1 and Openexr 3.1.1.< /br>
            Qt 5.15 does not receive updates or maintenance from the Qt company (only closed source, paid support is available). KDE has stepped up though and published a maintained 5.15 fork https://dot.kde.org/2021/04/06/announcing-kdes-qt-5-patch-collection. KaOS now regularly does a patch update from this fork for all of Qt 5.15, so it basically is now at 5.15.3.
            </p>
            
            <p>The installer Calamares now also has the ability added to carry over the network settings from the Live system, so no longer a need to enter the Wifi password again on booting into the newly installed system.</p>
            
            <p>New applications added include speedtest-cli, mauikit-accounts and bibletime. Biggest change here is the addition of Plasma Mobile Apps, that are very suitable for desktop use. They include Angelfish (web-browser), Kasts (pocasts), Kalk (calculator) and Koko (image viewer).</p>
            
            <p>Since LibreOffice 6.2, it is now possible to supply this as a pure Qt5/kf5 application.  LibreOffice has thus replaced Calligra as the default Office Application for KaOS.</p>
            
            <p>KaOS' creation <strong>Croeso</strong> (Welsh for welcome) for helping with configuring a new install is included.  It will run on the newly installed system and offers to adjust some 15 commonly used settings, includes a custom Wallpaper selector, distribution info, and the option to select packages to install from six different groups.  It is written in QML and fits well with the Welcome application used in the Live system.  The latter includes an Installation Guide.</p>
            
            <p>There is an option to verify the authenticity of downloaded KaOS ISO files through GPG signature verification, see the Download page for further details and instructions.</p>
            
            <p>A KaOS specific tool to write ISO files to USB is in use.  Not only does IsoWriter write to USB it also gives the option to recover your USB stick after using it for an ISO, something that regular dd copy or the previously used Imagewriter were not able to do. It includes the option to verify the written USB in comparison to the used ISO file.</p>
            
            <p>The artwork includes custom icon themes for light and dark themes. Midna and Midna Dark both create a complete unified look from boot-up all the way through logout.</p>

            <p>This ISO uses the <b>CRC and finobt enabled</b> XFS filesystem as default. CRCs enable enhanced error detection due to hardware issues, whilst the format changes also improves crash recovery algorithms and the ability  of  various  tools to validate and repair metadata corruptions when they are found.  The  free  inode  btree does not index used inodes, allowing faster, more consistent inode allocation performance as filesystems age.</p>
            
            <p><strong>Octopi</strong> is becoming a very crucial part of full system maintenance for KaOS. It is not just a GUI frontend to pacman. Tools like making sure a mirror is synced before starting any update, looking at the pacman logs, an option to get a paste from a complete snapshot of all info of a system with the SysInfo tool are included. Also included are very simple ways to open files, like copy to clipboard the file path shown in Octopi. To make sure the system doesn't start using too much disk space for the pacman cache, but still giving the user the option to retain some recent packages, the cache-cleaner tool is a great addition. The built-in tool to access <b>KCP</b> has now a much clearer place with the addition of its own foreign icon in the menu-bar. New added is the option to select custom icons for the systemtray.</p>
            
            <p>For UEFI installs, KaOS uses the simple, transparent but quite powerful systemd-boot as bootloader.</p>
            
            <p>To learn more about the goals and ideas behind KaOS, please read the <b>http://kaosx.us/</b>, <b>http://kaosx.us/about/</b>, and <b>http://kaosx.us/faq/</b> pages.</p>
            
            <p>To avoid any misunderstanding and confusion, KaOS is <b>not based upon, derived of, or inspired by</b> any one particular distribution. It is completely independent, build entirely from scratch with its own repositories. To read more about this see <b>http://kaosx.us/about/based/</b>. A <b>rolling release distribution</b> never has a final release, every ISO is merely a snapshot of the current status of the repositories. An idea what is currently available:</p>
            
            <p>The ISO ships with <b>Frameworks 5.85.0, Plasma 5.22.4, KDE Applications 21.08.0</b>, Linux 5.13.11, Systemd 249.3, Kmod 29, NetworkManager 1.32.8, LibreOffice 7.1.5, Krita 4.4.7, Elisa, Xorg-Server 1.20.13, Mesa 21.1.7, Glibc 2.33, GCC 10.3.0, non-free Nvidia 470 and Python3 3.8.11 to name a few.</p>
            
            <p>The package manager is <strong>Pacman 5.2.2</strong>, with the simple but powerful Octopi 0.11.0 as GUI frontend. Falkon is the default, Qt based, web browser. <b>GFXboot</b> is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.</p>
            
            <p><b>Repositories</b> of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200. A gist of what is available, besides the stable kernel there is Linux-next 5.11, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.<br />
            A limited number of the most well-known GTK applications are available, examples Firefox 91.0, Chrome 94, Ardour 6.9.0, Inkscape 1.1, GIMP 2.10.24 and Thunderbird 91.0.<br />
            Complete language packs are available for KDE, Calligra, Firefox, LibreOffice and Thunderbird. For IM, Fcitx 4.2.9.6 is available as a rather complete group.</p>
            
            <p><b>Known issues:</b></p>
            <ul>
                <li>Some Intel CPU systems might have an issue kernel’s entropy pool and have a long boot delay, if encountered add <strong>random.trust_cpu=1</strong> to the kernel boot line.
                <li>Installing on RAID is currently not possible</li>
            </ul>
            
            <p>To create <b>reliable</b> installation media, please follow the instructions from the <b>http://kaosx.us/download/</b> page. KaOS's ISO's <b>do not support Unetbootin or Rufus</b>, and DVDs need a burn speed <b>no higher than 4x</b>.</p>")

        }
    }

    ToolButton {
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
    }

}
