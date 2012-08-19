#!/bin/bash

update_xdg_icons() {
		echo -n ":: Rebuilding icon database ..."
			xdg-icon-resource forceupdate --theme hicolor &> /dev/null
		echo " DONE"
}

update_mime_db() {
		echo -e  -n ":: Rebuilding MIME database ..."
			update-mime-database /usr/share/mime &>/dev/null
		echo -e " DONE"
}

launch_dbus() {
			local _i
			for _i in $(dbus-launch); do
				export "${_i}";
			done
}

rebuild_global_config_cache() {

		echo -e  -n ":: Rebuilding global config cache ..."

			launch_dbus &> /dev/null

			/usr/bin/kbuildsycoca4 --global --noincremental &> /dev/null

			kill ${DBUS_SESSION_BUS_PID}
			unset DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID

		echo -e " DONE"
}

if [ $UID -ne 0 ]; then
	echo " "
        echo "Only root can run $0"
	echo " "
	exit 1
fi

echo " "
echo " > Chakra global config updater"
echo "   ----------------------------"
update_mime_db
update_xdg_icons
rebuild_global_config_cache
echo ":: All done!"
echo " "
