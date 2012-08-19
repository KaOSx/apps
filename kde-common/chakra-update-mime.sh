#!/bin/bash

update_mime_db() {
		echo -e  -n " > Rebuilding MIME database ..."
			update-mime-database /usr/share/mime &>/dev/null
		echo -e " DONE"
}

if [ $UID -ne 0 ]; then
	echo " "
        echo "Only root can run $0"
	echo " "
	exit 1
fi

update_mime_db

