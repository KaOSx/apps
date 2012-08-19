#!/bin/bash

update_xdg_icons() {
		echo -n " > Rebuilding xdg icon database ..."
			xdg-icon-resource forceupdate --theme hicolor &> /dev/null
		echo " DONE"
}

if [ $UID -ne 0 ]; then
	echo " "
        echo "Only root can run $0"
	echo " "
	exit 1
fi

update_xdg_icons

