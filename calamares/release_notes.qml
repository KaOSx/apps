/* === This file is part of Calamares - <https://github.com/calamares> ===
 *
 *   Copyright 2020, Anke Boersma <demm@kaosx.us>
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

Item {
    width: 740
    height: 420

    Flickable {
        id: flick
        anchors.fill: parent
        contentHeight: 3500
        
        ScrollBar.vertical: ScrollBar {
            id: fscrollbar 
            width: 10
            policy: ScrollBar.AlwaysOn
        }

        TextArea {
            id: intro
            x: 1
            y: 0
            width: parent.width - fscrollbar.width
            font.pointSize: 14
            textFormat: Text.RichText
            antialiasing: true
            activeFocusOnPress: false
            wrapMode: Text.WordWrap

            text: qsTr("<h3>KaOS - 2020.05</h3>
            <p>KaOS is very proud to announce the availability of the May release of a new stable ISO.</p>
            
            <p>This release is unlike the February version, not about many new features, but rather about updates and rebuilds. Most of the base of this distribution has been rebuild on a new GCC 9.3.0, Glibc 2.31 & Binutils 2.34 based Toolchain. Other rebuilds were needed for ICU 66.1, Boost 1.72.0, Krb5 1.18, Glib2 2.64.2 based stack, Guile 2.2.6, Mesa 20.0.6, NetworkManager 1.22.10, Perl 5.30.2, Linux 5.6.8 and Qt 5.14.2.</p>
            
            <p>The new features from the last, major, release were numerous, so repeated here one more time.  It starts with the installer, there it is now possible <b>to select whether or not to install</b> an OfficeSuite (current choice is limited to LibreOffice, future might see the addition of Calligra as option).  You can also opt to do a minimal install. This means opting for a fully functional Plasma Desktop with a filemanager, texteditor, and simple web-browser, but no further applications. So there won't be a music player, image viewer, office suite and so on. You as a user can decide once the system is installed what to add when the minimal install was chosen.</p>
            
            <p>That brings us to the next new feature. To help with selecting what to add to your new install, the first run wizard Croeso has the option added <b>to install packages</b> from six commonly used groups. For example, one group will give a choice of four different web-browsers to add, so it is now very simple to add Chrome or Firefox. Since KaOS has never installed an email client by default, there naturally is now a group for that too.<br />
            The above new feature makes it no longer needed to ship as many applications by default on the ISO, thus it is reduced in size.</p>
            
            <p>A smaller change is done for the Welcome application as seen in Live mode. The installed package list is now part of the main window with its own tab in the slideview.  No longer is there a need to open a new window for this list.</p>
            
            <p>The Midna them used for KaOS has been redone for 2020, biggest change there is the move from QtCurve to <b>Kvantum</b> for the application style.  Implemented is a custom Midna Kvantum theme, following the same style as used in Croeso and the Welcome application. Ksplash is simplified with less moving images, SDDM theme has better contrast.  Complete new is <b>theming for the systemd-bootloader</b>, gone is the standard black background with white text, instead, you will see a well-intgrated option with the rest of the Midna theme.  The grub bootloader was updated to follow a similar look as the systemd-bootloader.</p>
            
            <p>For the installer Calamares, a second new feature was added.  The Release Notes are now shown in a QML module, so there no longer is a need to work around sandboxing issues with QtWebengine or having to use the depreciated QtWebkit.</br>
            A complete new locale module is being developed by KaOS for Calamares, it is available for preview on this ISO by editing <code>/usr/share/calamares/settings.conf</code> and replacing locale with localeq. Not ready to use by default yet, but will give a modern and much accurate option to pinpoint a users location for use in the needed section of the install.  Once finished it will be presented upstream to be included in Calamares.</p>
            
            <p>Last new feature you will see on this ISO is the change of package compression standard from tar.xz to tar.zst. ZSTD brings a significant improvement of decompression speed over XZ, while bringing only a marginal larger package size.</p>
            
            <p>You will find <b>KDE Applications 20.04.0</b> on this ISO already. Highlights of 20.04 include Okular now implements smooth scrolling both when you are using the mouse wheel and the keyboard, Elisa added visual shuffle mode, it’s much easier to rearrange your music in the playlists. Now you can start watching movies stored on remote sites without having to download them, and instead stream them directly from the cloud to your player through <strong>Dolphin</strong>, which also added the new Duplicate function. One of KDE Connects newest features shipped with this release is the ability to start new conversations with the SMS app.<br />
            Frameworks is at 5.69.0, Plasma at 5.18.4 and KDE Applications at 20.04.0. All built on <b>Qt 5.14.2</b>.
            
            <p>Since LibreOffice 6.2, it is now possible to supply this as a pure Qt5/kf5 application.  LibreOffice has thus replaced Calligra as the default Office Application for KaOS.</p>
            
            <p>KaOS' creation <strong>Croeso</strong> (Welsh for welcome) for helping with configuring a new install is included.  It will run on the newly installed system and offers to adjust some 15 commonly used settings, includes a custom Wallpaper selector, distribution info and the option to select packages to install from six different groups.  It is written in QML and fits well with the Welcome application used in the Live system.  The latter includes an Installation Guide.</p>
            
            <p>There is an option to verify the authenticity of downloaded KaOS ISO files through GPG signature verification, see the Download page for further details and instructions.</p>
            
            <p>A KaOS specific tool to write ISO files to USB is in use.  Not only does IsoWriter write to USB it also gives the option to recover your USB stick after using it for an ISO, something that regular dd copy or the previously used Imagewriter were not able to do. It includes the option to verify the written USB in comparison to the used ISO file.</p>
            
            <p>The artwork includes custom icon themes for light and dark themes. Midna and Midna Dark both create a complete unified look from boot-up all the way through logout.</p>

            <p>This ISO uses the <b>CRC and finobt enabled</b> XFS filesystem as default. CRCs enable enhanced error detection due to hardware issues, whilst the format changes also improves crash recovery algorithms and the ability  of  various  tools to validate and repair metadata corruptions when they are found.  The  free  inode  btree does not index used inodes, allowing faster, more consistent inode allocation performance as filesystems age.</p>
            
            <p><strong>Octopi</strong> is becoming a very crucial part of full system maintenance for KaOS. It is not just a GUI frontend to pacman. Tools like making sure a mirror is synced before starting any update, looking at the pacman logs, an option to get a paste from a complete snapshot of all info of a system with the SysInfo tool are included. Also included are very simple ways to open files, like copy to clipboard the file path shown in Octopi. To make sure the system doesn't start using too much disk space for the pacman cache, but still giving the user the option to retain some recent packages, the cache-cleaner tool is a great addition. The built-in tool to access <b>KCP</b> has now a much clearer place with the addition of its own foreign icon in the menu-bar. New added is the option to select custom icons for the systemtray.</p>
            
            <p>For UEFI installs, KaOS uses the simple, transparent but quite powerful systemd-boot as bootloader.</p>
            
            <p>To learn more about the goals and ideas behind KaOS, please read the <b>http://kaosx.us/</b>, <b>http://kaosx.us/about/</b>, and <b>http://kaosx.us/faq/</b> pages.</p>
            
            <p>To avoid any misunderstanding and confusion, KaOS is <b>not based upon, derived of, or inspired by</b> any one particular distribution. It is completely independent, build entirely from scratch with its own repositories. To read more about this see <b>http://kaosx.us/about/based/</b>. A <b>rolling release distribution</b> never has a final release, every ISO is merely a snapshot of the current status of the repositories. An idea what is currently available:</p>
            
            <p>The ISO ships with <b>Frameworks 5.69.0, Plasma 5.18.4, KDE Applications 20.04.0</b>, Linux 5.6.8, Systemd 244, Kmod 27, NetworkManager 1.22.10, LibreOffice 6.4.3, Krita 4.2.9, Elisa, Xorg-Server 1.20.8, Mesa 20.0.6, Glibc 2.31, GCC 9.3.0, non-free Nvidia 440.82, Pepperflash and Python3 3.7.7 to name a few.</p>
            
            <p>The package manager is <strong>Pacman 5.2.1</strong>, with the simple but powerful Octopi 0.9.0 as GUI frontend. Falkon is the default, Qt based, web browser. <b>GFXboot</b> is included with KaOS artwork, Grub theme is Midna, Look &amp; Feel is a KaOS exclusive version Midna.</p>
            
            <p><b>Repositories</b> of KaOS will stay limited in size and expect it to stay at the current maximum of about 2100-2200. A gist of what is available, besides the stable kernel there is Linux-next 5.6, Calligra 3.2, VLC, Vokoscreen, Blender, Kodi, Calibre, Sigil, Vulkan packages, a few games like 0ad and Knights.<br />
            A limited number of the most well-known GTK applications are available, examples Firefox 75.0, Chrome 84, Ardour 5.12.0, Inkscape 0.92.5, GIMP 2.10.18 and Google-talkplugin 5.41.3.0.1.<br />
            Complete language packs are available for KDE, Calligra, Firefox, LibreOffice and Thunderbird. For IM, Fcitx 4.2.9.6 is available as a rather complete group.</p>
            
            <p><b>Known issues:</b></p>
            <ul>
                <li>Some Intel CPU systems might have an issue kernel’s entropy pool and have a long boot delay, if encountered add <strong>random.trust_cpu=1</strong> to the kernel boot line.
                <li>Installing on RAID is currently not possible</li>
            </ul>
            
            <p>To create <b>reliable</b> installation media, please follow the instructions from the <b>http://kaosx.us/download/</b> page. KaOS's ISO's <b>do not support Unetbootin or Rufus</b>, and DVDs need a burn speed <b>no higher than 4x</b>.</p>")

        }
    }
}
