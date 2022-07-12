/* === This file is part of Calamares - <https://github.com/calamares> ===
 *
 *   Copyright 2020 - 2022, Anke Boersma <demm@kaosx.us>
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

            text: qsTr("<h3>KaOS - 2022.07</h3>
            <p>It is with great pleasure to present to you the July release of a new stable ISO.</p>

            <p>This is a release were quite a few changes that have long been wanted finally can be implemented.< /br>
            The longest wanted of those is the final removal of Python2 from KaOS.  The default install has been Python2 free for quite some time, but some major packages had still required it to build, now the last one of those, QtWebEngine, has been patched to build against Python3, so now KaOS is completely Python2 free.< /br>
            Second is the move to Pipewire (away from PulseAudio) as the default sound/low level multimedia framework.  A switch had been a planned a while, but there were some issues on a Wayland session, so it had to wait.  Those are now all resolved, and you will see Pipewire as the default on this ISO.< /br>
            For those who still prefer PulseAudio, the installer Calamares now has a module added (KaOS only), that gives users the option to select which sound server they prefer (with Pipewire set as default).< /br>
            Third is the removal of QtWebKit.  Upstream Qt abandoned it some then years ago, but a fork picked up maintenance.  Unfortunately, that maintenance stopped a few years ago, so it is time to move away from QtWebKit.  All that still depended on it are now ready to move to QtWebEngine.  A couple could not do that move, thus they were removed from the repositories.</p>

            <p>But for most, the biggest news for this release will be Plasma 5.25.  KDE Plasma 5.25 redesigns and enhances how you navigate between windows and workspaces. The Overview effect shows all of your open windows and virtual desktops. Gestures on touchpads and touchscreens put Plasma at your fingertips. The dominant color of your background picture can be applied to all components that use the accent color. Titlebars of KDE apps become taller when in Touch Mode, making it easier to press, drag, and close windows with touch. Floating Panels add a margin all around the panel to make it float, while animating it back to look normal when a window is maximized. And Plasma panels can now be navigated with the keyboard, and you can assign custom shortcuts to focus individual panels.< /br>
            For the other KDE parts, the latest Frameworks (5.95.0) and KDE Gear (22.04.2) are included. All built on <strong>Qt 5.15.5+</strong>.</p>

            <p>After almost two years of testing IWD, it is now in such a good state that it has replaced Wpa_Suplicant as the default wireless daemon for KaOS.</p>

            <p>During the install, there now is an option to either view a slideshow with information about the distribution, or watch what the installer Calamares is currently doing by selecting the Log View.</p>
            
            <p>A shift has started as to how all Python packages are build.  Historically, just about all were build with setuptools though a setup.py script.  PEP17 is the new standard for building python packages, see https://peps.python.org/pep-0517/.  At this stage, KaOS is testing this transition with different new Python build tools, such as Python-flit & Python-build, with Python-wheel currently in use to install the build packages.</p>

            <p>Qt 5.15 does not receive updates or maintenance from the Qt company (only closed source, paid support is available). KDE has stepped up though and published a maintained 5.15 fork https://dot.kde.org/2021/04/06/announcing-kdes-qt-5-patch-collection. KaOS now regularly does a patch update from this fork for all of Qt 5.15, so it basically is now at 5.15.6.
            </p>
            
            <p>For Nvidia, a new longterm support version is included in this ISO, 470xx. The move by Nvidia to 495 meant the end of support for Kepler based cards, thus the need to add a new legacy version.</p>
            
            <p>Qt 6.3.1 is included and is now far more complete since many more are ported from Qt5, this includes qt6-location and the big one, qt6-webengine (plus all the Qt6 webengine depends on). A few test applications have been build on qt6-webengine, including some web-browsers. All of the PyQt packages are now available in a Qt6 version too. Plus the Kvantum theming has support for Qt6.</p>
            
            <p>Big thanks goes to <strong>Fosshost</strong> for not only providing the default mirror (through the <strong>Fastly CDN</strong>, but also providing a server for KaOS. This server is replacing the old Centos server (used for package upload, ZNC bouncer and the old PHP based package viewer).</p>
            
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
            
            <p>The ISO ships with <b>Frameworks 5.96.0, Plasma 5.25.3, KDE Applications 22.04.3</b>, Linux 5.17.15, Systemd 250.7, Kmod 30, NetworkManager 1.38.2, LibreOffice 7.3.4, Elisa, Xorg-Server 1.21.3, Mesa 22.1.3, Glibc 2.35, GCC 11.3.0, non-free Nvidia 515 and Python3 3.9.13 to name a few.</p>
            
            <p>The package manager is <strong>Pacman 6.0.1</strong>, with the simple but powerful Octopi 0.13.0 as GUI frontend. Falkon is the default, Qt based, web browser. <b>GFXboot</b> is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.</p>
            
            <p><b>Repositories</b> of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200. A gist of what is available, besides the stable kernel there is Linux-next 5.18, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.<br />
            A limited number of the most well-known GTK applications are available, examples Firefox 102.0, Chrome 105, Ardour 6.9.0, Inkscape 1.2, GIMP 2.10.32 and Thunderbird 102.0.<br />
            Complete language packs are available for KDE, Calligra, Firefox, LibreOffice and Thunderbird. For IM, Fcitx 4.2.9.6 is available as a rather complete group.</p>
            
            <p><b>Known issues:</b></p>
            <ul>
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
