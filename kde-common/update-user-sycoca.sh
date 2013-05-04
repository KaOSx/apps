#!/bin/bash

rebuild_user_config_cache() {

		current_users=`LC_ALL=C w | cut -d " " -f 1 | grep -v USER | sed -e '/^$/d' | uniq`

		for victim in $current_users
		do
			if [ -d "/home/$victim/.kde4" ] ; then
				echo -e  -n " > Rebuilding configuration cache for user: $victim ..."
				pushd /home/$victim &> /dev/null
				su -c kbuildsycoca4 $victim &> /dev/null
				popd &> /dev/null
				echo " DONE"
			fi
		done
}

if [ $UID -ne 0 ]; then
	echo " "
        echo "Only root can run $0"
	echo " "
	exit 1
fi

rebuild_user_config_cache