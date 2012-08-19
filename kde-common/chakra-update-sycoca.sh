#!/bin/bash

launch_dbus() {
			local _i
			for _i in $(dbus-launch); do
				export "${_i}";
			done
}

rebuild_global_config_cache() {

		echo -e  -n " > Rebuilding global configuration cache ..."

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

rebuild_global_config_cache

