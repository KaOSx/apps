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

            text: qsTr("<h3>KaOS - 2021.03</h3>
            <p>KaOS is very proud to announce the availability of the March release of a new stable ISO.</p>
            
            <p>For the many changes in this release, a few stand out. This is a first ISO that ships with Qt 6. Not that Plasma is ready for Qt 6, but some are (Poppler, Strawberry,Qsynth, Qtkeychain for example), so to get this distribution in good shape for the eventual Qt 6 move, any that can be build with Qt 6 are done so now.</br>
            The KDE Applications release 20.12 saw the addition of almost a dozen new applications, some just moved from standalone releases to now a monthly release, but the addition of Itinerary (an app that provides you with all the information you need while on the road) and Spectacle using Kimageannotator for annotation tool are good improvements.</br>
            There has been a search for quite some time for a good GUI to handle Systemd services, the used systemd-kcm has not been maintained for years. This replacement is now found and included in the ISO, Stacer (it can also be used as system clean-up tool and handle startup applications). </p>
            
            <p>The tool to manage, search, and install KaOS Community Packages, kcp has been completely rewritten (still in Go) in order to support the main new feature: the configuration.</p>
            <p>Now, you can adapt kcp/pckcp to your needs in editing the configuration’s files (located in $HOME/.config/kcp/ directory). Notable options :</p>
            <ul>
                <li>You can use another temporary directory (for installations through kcp) than /tmp</li>
                <li>kcp can use a third organization for package managements. The only constraint is the organization should be on github</li>
                <li>For install or download operations, the clone method can use either ssh or https</li>
                <li>You can define a locale different from the system</li>
                <li>You can use un custom PKGBUILD prototype to use for PKGBUILD generation through pcpkcp</li>
                <li>You can add packages to ignore for depends when you check a PKGBUILD with pckcp</li>
            </ul>
            <p>Other notable changes :</p>
            <ul>
                <li>Improved performances on updating the database (which needed to completelly refactor the database). The operation should be significatively faster.</li>
                <li>Improved performances for the PKGBUILD parser. The scanner is more accurate and faster. Plus it is designed as an API in order to be usable for a third app.</li>
                <li>Some PKBUILD checkers were added/modified/merged.</li>
                <li>Added is a man for pckcp. The man for kcp was updated</li>
            </ul>
            
            <p>As always with this rolling distribution, you will find the very latest packages for the Plasma Desktop, this includes Frameworks 5.80.0, Plasma 5.21.2 and KDE Applications 20.12.3. All built on Qt 5.15.2.</p>
            
            <p>News for those working on KaOS (probably and hopefully not visible at all to regular users) is the migration to a new, dedicated server. This is a real hardware server, running KaOS, so no longer using a VPS. Advantage is direct access to the hardware and much more powerful specs.</p>
            
            <p>The installer Calamares has picked up the transition to QML again.  All navigation is now done in QML for KaOS. The finished module was also ported to QML, this gives a simpler end page, with clear buttons showing two options.  It also opened the way to give users a clear message regarding installation logs once the install is completed.</p>
            
            <p>New applications added include VSCodium.</p>
            
            <p>Updates to the base of this distribution were numerous and include Python3 3.8.8, ICU 68.2, Boost 1.75.0, Git 2.30.1, LLVM/Clang 11.1.0, Protobuf 3.15, Hdf5 1.12.0, Poppler 21.03.0, Mesa 20.3.4, NetworkManager 1.30.0, Libarchive 3.5.1, Samba 4.13.3. The maintenance of the Linux AUFS patches has started again, so the latest kernel can be included again in the ISO, 5.10.5</p>
            
            <p>The Midna theme used for KaOS has been redone for 2020, biggest change there is the move from QtCurve to <b>Kvantum</b> for the application style.  Implemented is a custom Midna Kvantum theme, following the same style as used in Croeso and the Welcome application. Ksplash is simplified with less moving images, SDDM theme has better contrast.  Complete new is <b>theming for the systemd-bootloader</b>, gone is the standard black background with white text, instead you will see a well intgrated option with the rest of the Midna theme.  The grub bootloader was updated to follow a similar look as the systemd-bootloader.</p>
            
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
            
            <p>The ISO ships with <b>Frameworks 5.80.0, Plasma 5.21.2, KDE Applications 20.12.3</b>, Linux 5.10.6, Systemd 247.3, Kmod 28, NetworkManager 1.30.0, LibreOffice 7.1.1, Krita 4.4.2, Elisa, Xorg-Server 1.20.10, Mesa 20.3.4, Glibc 2.32, GCC 10.2.0, non-free Nvidia 460 and Python3 3.8.8 to name a few.</p>
            
            <p>The package manager is <strong>Pacman 5.2.2</strong>, with the simple but powerful Octopi 0.11.0 as GUI frontend. Falkon is the default, Qt based, web browser. <b>GFXboot</b> is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.</p>
            
            <p><b>Repositories</b> of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200. A gist of what is available, besides the stable kernel there is Linux-next 5.11, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.<br />
            A limited number of the most well-known GTK applications are available, examples Firefox 86.0, Chrome 90, Ardour 6.6.0, Inkscape 1.0.2, GIMP 2.10.22 and Thunderbird 78.8.0.<br />
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
