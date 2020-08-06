#!/bin/sh

if [ ! -f /var/log/nvidia ] && [ ! -f /var/log/nvidia-340xx ] \
    && [ ! -f /var/log/nvidia-390xx ] && [ ! -f /var/log/nvidia-prime ]; then
    sudo sed -i -e 's|- license|#- license|' /usr/share/calamares/settings.conf
fi

if ! ping -c 1 "8.8.8.8" > /dev/null; then
    sudo sed -i -e 's|- localeq|- locale|' /usr/share/calamares/settings.conf
fi

sudo /usr/bin/calamares -d > installation.log
