/* === This file is part of Calamares - <https://github.com/calamares> ===
 *
 *   Copyright 2020 - 2023, Anke Boersma <demm@kaosx.us>
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
        textFormat: Text.RichText
        antialiasing: true
        activeFocusOnPress: false
        wrapMode: Text.WordWrap

        text: qsTr("<h3>KaOS - 2023.12</h3>
        <p>It is with great pleasure to present to you the December release of a new Plasma 6 ISO.</p>
        
        <p>Think of this ISO as an early start of a test cycle for a first Plasma 6 based stable ISO.  Expect such an ISO to be released in January 2024.</p>

        <p>Updates to the base of the system included a move to FFMPEG 6, fully updated Boost 1.83.0/ICU 74.1 stack, LLVM/Clang 17.0.6 , kernel moved to Linux 6.5.11, Systemd 254.7, Python 3.10.13, Util-Linux 2.39.2, IWD 2.10, MariaDB 11, and Postgresql 16.</p>
        
        <p>For the Plasma desktop, the latest KDE Megarelease Beta 1 is included, that means Plasma 5.90.0, KDE Gear 243.01.80, and Frameworks 5.246.0. All built on <b>Qt 6.6.1</b>.Everything is now packaged in such a way that just about all kf5 based KDE Applications can also run on Plasma 6, so Plasma 6 is almost ready to fully replace Plasma 5 in KaOS. This ISO is only linked in the dedicated Forum post, not available from the Download page. The Midna theme is getting a complete overhaul for Plasma 6, major parts are included in this ISO.</p>

        <p>SDDM 0.20.0 added the option to run this display manager in Wayland mode, so KaOS is one step closer to being to move away from X11. The shell used to run in Wayland mode is kwin_wayland (upstream default is using Weston).</p>

        <p>The automated partitioning option in the installer (Calamares) now offers the use of all popular filesystems, so no need to use manually partitioning to be able to choose XFS, EXT4, BTRFS or ZFS.</p>
        
        <p>Big thanks goes to <strong>YourHostingSolutions</strong> for not only providing a mirror, but also providing a server for KaOS. With the discontinuation of Fosshost, a new server was sorely needed.</p>
        
        <p>To get good logs has always been a bit of a challenge since you have to know what journalctl commands to use. That is now a thing of the past, <strong>Kjournald</strong> gives the option to view the logs from a nice GUI, with all kinds of filter options in the left-hand pane (it is now part of the default install)</p>

        <p>For the adventurous, the kde-next repository is used for a complete Qt6-based KDE stack, all Frameworks and Plasma are built there on Qt6, and about half of KDE Applications have also been ported to Qt6.</p>

        <p>After almost two years of testing IWD, it is now in such a good state that it has replaced Wpa_Suplicant as the default wireless daemon for KaOS.</br>
        Similar, Pipewire has replaced PulseAudio as the default sound/low-level multimedia framework.</p>

        <p>A shift has started as to how all Python packages are build.  Historically, just about all were build with setuptools though a setup.py script.  PEP17 is the new standard for building python packages, see https://peps.python.org/pep-0517/.  At this stage, KaOS is testing this transition with different new Python build tools, such as Python-flit & Python-build, with Python-wheel currently in use to install the build packages.</p>
        
        <p>For Nvidia, longterm supported versions 390xx and 470xx are include, alongside the latest released version.</p>
        
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
        
        <p>The ISO ships with <b>Frameworks 5.246.0, Plasma 5.90.0, KDE Applications 24.01.80</b>, Linux 6.5.11, Systemd 254.7, Kmod 31, NetworkManager 1.44.2, LibreOffice 7.6.2, Elisa, Xorg-Server 1.21.9, Mesa 23.2.1, Glibc 2.37, GCC 12.3.0, non-free Nvidia 545 and Python3 3.10.13 to name a few.</p>
        
        <p>The package manager is <strong>Pacman 6.0.2</strong>, with the simple but powerful Octopi 0.15.0 as GUI frontend. Falkon is the default, Qt based, web browser. <b>GFXboot</b> is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.</p>
        
        <p><b>Repositories</b> of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200. A gist of what is available, besides the stable kernel there is Linux-next 6.6, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.<br />
        A limited number of the most well-known GTK applications are available, examples Firefox 120, Chrome 121, Ardour 8.1.0, Inkscape 1.3, GIMP 2.99.16 and Thunderbird 115.<br />
        Complete language packs are available for KDE, Calligra, Firefox, LibreOffice and Thunderbird. For IM, Fcitx 4.2.9.9 is available as a rather complete group.</p>

        <p><b>Known issues:</b></p>
        <ul>
            <li>Installing on RAID is currently not possible</li>
        </ul>
        
        <p>To create <b>reliable</b> installation media, please follow the instructions from the <b>http://kaosx.us/download/</b> page. KaOS's ISO's <b>do not support Unetbootin or Rufus</b>, and DVDs need a burn speed <b>no higher than 4x</b>.</p>")
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
