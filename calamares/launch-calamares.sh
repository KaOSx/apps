#!/bin/sh

if [ ! -f /var/log/nvidia ] || [ ! -f /var/log/nvidia-304xx ]; then
    sudo sed -i -e 's|- license|#- license|' /usr/share/calamares/settings.conf
fi

sudo /usr/bin/calamares -d > installation.log
