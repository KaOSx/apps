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

            text: qsTr("<h3>KaOS - 2021.04</h3>
            <p>Time goes fast, it is eight years ago this week that KaOS started, so this is kind of an April anniversary release.  It has also been eight years that the same initramfs creation tool has been used (Mkinitcpio), but with Dracut being the more widely used and constantly maintained, it is time to move to this new tool for KaOS. For almost two years Mkinitcpio did not have a maintainer and upstream had talks about abandoning this tool. This will be a major change and will require lots of work for the ISO creation, but a start has been made, the linux-next kernel already defaults to Dracut for initramfs creation.</p>
            
            <p>The tool to manage, search, and install <strong>KaOS Community Packages, kcp</strong> has been completely rewritten (still in Go) in order to support the main new feature: the configuration.</p>
            <p>Now, you can adapt kcp/pckcp to your needs in editing the configuration’s files (located in <code>$HOME/.config/kcp/<code> directory). Notable options :</p>
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
            
            <p>The installer Calamares has picked up the transition to QML again.  All navigation is now done in QML for KaOS. The <strong>finished module</strong> was also ported to QML, this gives a simpler end page, with clear buttons showing two options.  It also opened the way to give users a clear message regarding installation logs once the install is completed. Usersq is another module being ported to QML, a preview is included in this release, but is not the default users module yet.</p>
            
            <p>As always with this rolling distribution, you will find the very latest packages for the Plasma Desktop, this includes Frameworks 5.81.0, Plasma 5.21.4 and KDE Applications 21.04.0. All built on Qt 5.15.2.</p>
            
            <p>This ISO means the end of the non-free Nvidia 340xx support in KaOS. This drivers needed to be heavily patched since Linux 5.6, but now with Linux 5.11, loading the module completely fails SDDM. Since upstream pretty much abandoned this driver, it is time to remove from KaOS.  Users with Nvidia cards prior to 2014 will need to switch over to the in-kernel modesetting driver or install nouveau.</p>
            
            <p>New applications added include VSCodium.</p>
            
            <p>Updates to the base of this distribution were numerous and include a new GCC 10.3.0, Glibc 2.33 & Binutils 2.36.1 based Toolchain, with most of the core being rebuild on this new Toolchain, Systemd 247.6, Proj 8.0.0, Git 2.30.1, LLVM/Clang 11.1.0, Protobuf 3.15, Hdf5 1.12.0, Poppler 21.04.0, Mesa 21.0.2, NetworkManager 1.30.2, ZSTD 1.4.9, Samba 4.13.5.< /br>
            Qt 5.15 does not receive updates or maintenance from the Qt company (only closed source, paid support is available). KDE has stepped up though and published a maintained 5.15 fork https://dot.kde.org/2021/04/06/announcing-kdes-qt-5-patch-collection. KaOS now regularly does a patch update from this fork for all of Qt 5.15, so it basically is now at 5.15.3.</p>
            
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
            
            <p>The ISO ships with <b>Frameworks 5.81.0, Plasma 5.21.4, KDE Applications 21.04.0</b>, Linux 5.11.16, Systemd 247.6, Kmod 28, NetworkManager 1.30.4, LibreOffice 7.1.2, Krita 4.4.3, Elisa, Xorg-Server 1.20.11, Mesa 21.0.2, Glibc 2.33, GCC 10.3.0, non-free Nvidia 465 and Python3 3.8.9 to name a few.</p>
            
            <p>The package manager is <strong>Pacman 5.2.2</strong>, with the simple but powerful Octopi 0.11.0 as GUI frontend. Falkon is the default, Qt based, web browser. <b>GFXboot</b> is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.</p>
            
            <p><b>Repositories</b> of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200. A gist of what is available, besides the stable kernel there is Linux-next 5.11, Calligra 3.2.1, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.<br />
            A limited number of the most well-known GTK applications are available, examples Firefox 88.0, Chrome 91, Ardour 6.6.0, Inkscape 1.0.2, GIMP 2.10.22 and Thunderbird 78.10.0.<br />
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
