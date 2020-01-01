#!/bin/sh

if [ ! -f /var/log/nvidia ] && [ ! -f /var/log/nvidia-prime ] && [ ! -f /var/log/nvidia-340xx ] && [ ! -f /var/log/nvidia-390xx ]; then
    sudo sed -i -e 's|- license|#- license|' /usr/share/calamares/settings.conf
fi

sudo /usr/bin/calamares -d > installation.log
