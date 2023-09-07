#!/bin/sh

if [ ! -f /var/log/nvidia ] && [ ! -f /var/log/nvidia-470xx ] \
    && [ ! -f /var/log/nvidia-390xx ] && [ ! -f /var/log/nvidia-prime ]; then
    sudo sed -i -e 's|- packagechooserq@licenseq|#- packagechooserq@licenseq|' /usr/share/calamares/settings.conf
fi

#if ! ping -c 1 "8.8.8.8" > /dev/null; then
#    sudo sed -i -e 's|- localeq|- locale|' /usr/share/calamares/settings.conf
#fi

if [ ! -d /sys/firmware/efi/efivars ]; then
    sudo sed -i -e 's|"xfs","ext4","zfs"|"xfs","ext4"|' /usr/share/calamares/modules/partition.conf
fi

sudo /usr/bin/calamares -d > installation.log
