#!/bin/bash

kdialog --passivepopup "Verifying......" 20

CheckedFile=${1}

UsbDevice=$(blkid | grep iso9660 | head -c 8)

md5=$(md5sum ${CheckedFile} | head -c 32)

bites=$(wc -c ${CheckedFile} | awk '{print $1;}')

usb=$(head -c ${bites} ${UsbDevice} | md5sum | head -c 32)

if [ ${md5} == ${usb} ]; then
    kdialog --msgbox "The downloaded ISO file and USB write match"
fi

if [ ${md5} != ${usb} ]; then
    kdialog --error "ISO files do not match, do not use this USB for install media"
fi

