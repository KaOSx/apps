#!/bin/bash

kdialog --passivepopup "Verifying the integrity of the USB in comparison to the downloaded ISO, this can take a few minutes...... " 15

CheckedFile=${1}

UsbDevice=$(pkexec /sbin/blkid | grep iso9660 | head -c 8)

if [ ! ${UsbDevice} ]; then

    kdialog --msgbox "No Flash USB detected"
    
else

    md5=$(md5sum ${CheckedFile} | head -c 32)

    bites=$(wc -c ${CheckedFile} | awk '{print $1;}')

    usb=$(pkexec /usr/bin/head -c ${bites} ${UsbDevice} | md5sum | head -c 32)
    
    if [ ${md5} == ${usb} ]; then
    
        kdialog --msgbox "The downloaded ISO file and USB write match"
        
    fi

    if [ ${md5} != ${usb} ]; then
    
        kdialog --error "ISO files do not match, do not use this USB for install media. Or make sure only one USB flash device is connected"
        
    fi
    
fi


