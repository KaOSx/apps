#!/bin/sh

CheckedFile="$1"

MD5SUM=`md5sum "$CheckedFile" | awk '{ print $1;}'`
SHA256SUM=`sha256sum "$CheckedFile" | awk '{ print $1;}'`

      kdialog --title "md5sum Calculator" --yesno "File : $CheckedFile \n md5sum : $MD5SUM\n sha256sum : $SHA256SUM\n\n  Save to file?"

        if [ $? == 0 ];then
		Result=`kdialog --menu "select" md5 md5sum sha256 sha256sum`
		
		if [ $? == 0 ];then
			if [ "$Result" == "md5" ];then
				echo $MD5SUM > $CheckedFile".md5"
			else
				echo $SHA1SUM > $CheckedFile".sha256"
			fi
		fi
	fi

