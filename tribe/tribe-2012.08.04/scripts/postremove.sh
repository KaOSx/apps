#!/bin/bash
#
#**************************************************************************
#   Copyright (C) 2008 Jan Mette                                          *
#   <jan[dot]mette[at]berlin[dot]de>                                      *
#                                                                         *
#   This script is free software; you can redistribute it and/or modify   *
#   it under the terms of the GNU General Public License as published by  *
#   the Free Software Foundation; either version 2 of the License, or     *
#   (at your option) any later version.                                   *
#                                                                         *
#   This program is distributed in the hope that it will be useful,       *
#   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
#   GNU General Public License for more details.                          *
#                                                                         *
#   You should have received a copy of the GNU General Public License     *
#   along with this program; if not, write to the                         *
#   Free Software Foundation, Inc.,                                       *
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.          *
#**************************************************************************


#
# Define Colors
#
_r="\033[00;31m"
_y="\033[00;33m"
_g="\033[00;32m"
_b="\033[00;34m"
_B="\033[01;34m"
_W="\033[01;37m"
_n="\033[00;0m"


# 
# we need to be root to start this
#
if [ $UID -ne 0 ]; then
        echo "Only root can run $0"; exit 1
fi


# source functions we need
# - cmdline is needed to parse kernel command line parameters
# 
# check if we are running our live system
if [ -d "/.livesys" ] ; then
	source /etc/rc.d/functions
	source /etc/rc.d/functions.d/cmdline
else
	clear
        echo " "
	echo -e "$_r >$_W You are not running the live system$_n"
	echo -e " "
	echo -e "$_r >$_W Something is ${_y}WR${_W}oO${_y}nG$_n"
	echo -e "$_r >$_W - or - $_n"
	echo -e "$_r >$_W You are just running the script for$_n"
	echo -e "$_r >$_W debug purposes, keep calm :)$_n"
	echo -e " "
	echo -e "$_r >$_W Everything could happen from here ...$_n"
	echo -e " "
	sleep 6
fi






######################################################
#
# Disaster prevention routine (read: error handling)
#
######################################################

function error_handler {
   echo "Something went wrong :( ..."
   exit 1
}






######################################################
#
# JOBS
# #shaman-arch insider slang: "the B*tches" :D
#
# These are the various jobs you can do with
# this script...
#
######################################################

job_remove_nvidia() {

			# initialize error handling
			trap error_handler ERR

			echo -e -n "$_y >$_W Running Job: remove_nvidia ... $_n"

			# remove nvidia drivers...
			if [ -e "/tmp/nvidia" ] ; then
			
				# uninstall driver from target
				pacman -r ${mountpoint} -Rf --noconfirm nvidia-utils nvidia

				# reinstall libgl from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/libgl*
			
				# remove driver from xorg.conf
				DRIVER_NVIDIA="Driver\t\"nv\""
				sed -i -e /'Section "Device"'/,/'EndSection'/s/'Driver.*'/$DRIVER_NVIDIA/g ${mountpoint}/etc/X11/xorg.conf
			
				# remove options from xorg.conf
				cat /etc/X11/xorg.conf | grep -v NvAGP | grep -v NoLogo | grep -v RenderAccel | grep -v AddARGBVisuals | grep -v AddARGBGLXVisuals | grep -v AllowGLXWithComposite | grep -v DynamicTwinView > ${mountpoint}/etc/X11/xorg.conf.clean
			
				# clean up
				rm -rf ${mountpoint}/etc/X11/xorg.conf
				mv ${mountpoint}/etc/X11/xorg.conf.clean ${mountpoint}/etc/X11/xorg.conf
			fi
			
			if [ -e "/tmp/nvidia-96xx" ] ; then
			
				# uninstall driver from target
				pacman -r ${mountpoint} -Rf --noconfirm nvidia-96xx nvidia-96xx-utils

				# reinstall libgl from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/libgl*
			
				# remove driver from xorg.conf
				DRIVER_NVIDIA="Driver\t\"nv\""
				sed -i -e /'Section "Device"'/,/'EndSection'/s/'Driver.*'/$DRIVER_NVIDIA/g ${mountpoint}/etc/X11/xorg.conf
			
				# remove options from xorg.conf
				cat /etc/X11/xorg.conf | grep -v NvAGP | grep -v NoLogo | grep -v RenderAccel | grep -v AddARGBVisuals | grep -v AddARGBGLXVisuals | grep -v AllowGLXWithComposite | grep -v DynamicTwinView > ${mountpoint}/etc/X11/xorg.conf.clean
			
				# clean up
				rm -rf ${mountpoint}/etc/X11/xorg.conf
				mv ${mountpoint}/etc/X11/xorg.conf.clean ${mountpoint}/etc/X11/xorg.conf
			fi

			if [ -e "/tmp/nvidia-173xx" ] ; then
			
				# uninstall driver from target
				pacman -r ${mountpoint} -Rf --noconfirm nvidia-173xx nvidia-173xx-utils

				# reinstall libgl from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/libgl*
			
				# remove driver from xorg.conf
				DRIVER_NVIDIA="Driver\t\"nv\""
				sed -i -e /'Section "Device"'/,/'EndSection'/s/'Driver.*'/$DRIVER_NVIDIA/g ${mountpoint}/etc/X11/xorg.conf
			
				# remove options from xorg.conf
				cat /etc/X11/xorg.conf | grep -v NvAGP | grep -v NoLogo | grep -v RenderAccel | grep -v AddARGBVisuals | grep -v AddARGBGLXVisuals | grep -v AllowGLXWithComposite | grep -v DynamicTwinView > ${mountpoint}/etc/X11/xorg.conf.clean
			
				# clean up
				rm -rf ${mountpoint}/etc/X11/xorg.conf
				mv ${mountpoint}/etc/X11/xorg.conf.clean ${mountpoint}/etc/X11/xorg.conf
			fi

			echo -e "$_g DONE$_n"
}


job_remove_catalyst() {

			# initialize error handling
			trap error_handler ERR

			echo -e -n "$_y >$_W Running Job: remove_catalyst ... $_n"

			# remove catalyst drivers...
			if [ -e "/tmp/catalyst" ] ; then
			
				# uninstall driver from target
				pacman -r ${mountpoint} -Rf --noconfirm catalyst

				# reinstall libgl from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/libgl*

				# reinstall free ati-drivers from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/ati-dri*
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/xf86-video-ati*
			
				# remove driver from xorg.conf
				DRIVER_ATI="Driver\t\"ati\""
				sed -i -e /'Section "Device"'/,/'EndSection'/s/'Driver.*'/$DRIVER_ATI/g ${mountpoint}/etc/X11/xorg.conf
			fi

			if [ -e "/tmp/catalyst-legacy" ] ; then
			
				# uninstall driver from target
				pacman -r ${mountpoint} -Rf --noconfirm catalyst-legacy

				# reinstall libgl from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/libgl*

				# reinstall free ati-drivers from overlay
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/ati-dri*
				pacman -r ${mountpoint} -Udf --noconfirm ${PKG_OVERLAY}/xf86-video-ati*
			
				# remove driver from xorg.conf
				DRIVER_ATI="Driver\t\"ati\""
				sed -i -e /'Section "Device"'/,/'EndSection'/s/'Driver.*'/$DRIVER_ATI/g ${mountpoint}/etc/X11/xorg.conf
			fi
			echo -e "$_g DONE$_n"
}


job_remove_jre() {

			# initialize error handling
			trap error_handler ERR

			echo -e -n "$_y >$_W Running Job: remove_jre ... $_n"

			pacman -r ${mountpoint} -Rf --noconfirm jre

			echo -e "$_g DONE$_n"
}


job_remove_flashplugin() {

			# initialize error handling
			trap error_handler ERR

			echo -e -n "$_y >$_W Running Job: remove_flashplugin ... $_n"

			pacman -r ${mountpoint} -Rf --noconfirm flashplugin

			echo -e "$_g DONE$_n"
}


job_remove_msfonts() {

			# initialize error handling
			trap error_handler ERR

			echo -e -n "$_y >$_W Running Job: remove_msfonts ... $_n"

			pacman -r ${mountpoint} -Rf --noconfirm ttf-ms-fonts

			echo -e "$_g DONE$_n"
}






######################################################
#
# JOB CONTROL MODULE (I LIKE SCI-FI :D )
#
######################################################


#
# This starts the various jobs
#
job_init() {

		#
		# OUTPUT STUFF
		#
		echo " "
		echo -e "$_r >$_W Postremove 0.0.1 $_n"
		sleep 0.5
		echo " "

		#
		# SOME SANIFICATION STUFF
		#
		echo -e "$_r  $_n ConditionCheck module 0.0.1 $_n"
		echo -e "$_n  $_y *$_n checking job dependencies $_n"


		#
		# GLOBAL JOB DEPENDENCIES
		#
		if [ -z "${mountpoint}" ] ; then
			echo -e "$_n  $_r *$_W ERROR:$_n You need specify a target mountpoint with$_y --mountpoint $_n"
			echo -e "$_r  $_n Error detected. Stopping. $_n"
			echo " "
			exit 0
		fi

		if [ -z "${job}" ] ; then
			echo -e "$_n  $_r *$_W ERROR:$_n You need to specify a job with$_y --job $_n"
			echo -e "$_r  $_n Error detected. Stopping. $_n"
			echo " "
			exit 0
		fi

		echo " "
		echo -e "$_r  $_n JobControl module 0.0.5 $_n"
		echo -e "$_n  $_y *$_n running job$_g $job $_n"
		echo " "

		#
		# JOB HANDLING
		#
		case "$job" in
				nvidia)
					job_remove_nvidia
				;;
				catalyst)
					job_remove_catalyst
				;;
				jre)
					job_remove_jre
				;;
				flashplugin)
					job_remove_flashplugin
				;;
				ttf-ms-fonts)
					job_remove_msfonts
				;;
				*)
				echo -e "$_r >$_W OOOPs... INVALID JOB $_n"
				echo " "
				echo "   You know when you are falling asleep,"
				echo "   and you imagine yourself walking or"
				echo "   something, and suddenly you misstep,"
				echo "   stumble and jolt awake ?"
				echo " "
				echo -e "   Well, thats what an$_r INVALID JOB$_n feels"
				echo "   like. Double check your commands ok?"
				echo " "
				echo "   :("
				echo " "
				exit 1
				;;
		esac
}






######################################################
#
# INIT STARTUP
#
######################################################


# This... thing... handles startup parameters.
# EVERY PARAMETER HAS TO BE SET FOR EVERY OPERATION
# = ALWAYS EVERYTHING ;)
#
while [ $# -gt 0 ]
	do
		case $1
		in
			--job)
			job=$2
			shift 2
			;;

			--mountpoint)
			mountpoint=$2
			shift 2
			;;
			
			*)
			clear
			echo " "
			echo -e "$_r >$_W Postremove 0.0.1 $_n"
			echo " "
			echo -e "$_y >$_W Usage: $_n"
			echo " "
			echo -e "$_W   --job            :$_n the job to that should be performed$_n"
			echo -e "                      EXAMPLE:$_g --job flashplugin"
			echo -e "$_W   --mountpoint     :$_n defines the mountpoint of the install target$_n"
			echo -e "                      EXAMPLE:$_g --mountpoint /mnt/target$_n"
			echo " "
			echo -e "$_y >$_W Available jobs$_n "
			echo " "
			echo -e "$_n  $_g nvidia$_n      (removes nvidia drivers from target)"
			echo -e "$_n  $_g catalyst$_n    (removes ati catalyst drivers from target)"
			echo -e "$_n  $_g jre$_n         (removes jre from target)"
			echo -e "$_n  $_g flashplugin$_n (removes flashplugin from target)"
			echo -e "$_n  $_g ttf-ms-fonts$_n(removes microsoft fonts from target)"
			echo " "
			echo -e "$_y >$_W Example:$_n "
			echo " "
			echo -e "$_W   ./postinstall --job flashplugin               :$_n removes the flashplugin from the target"
			echo -e "$_W                 --mountpoint /mnt/chakra_target :$_n defines the mountpoint of the install target"
			echo " "
			shift 1
			;;
	esac
done


#
# Now check if we have a job
#
if [ -z "$job" ] ; then
		echo " "
		echo -e "$_r >$_W You need to specify some parameters, try$_g --help $_n"
		echo " "
	 exit 0
fi

#
# When we have a job, start job_init
#
job_init