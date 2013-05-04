#!/bin/bash

_user=`whoami`

get_data() {
	echo
	echo
	echo "################################################################################"
	echo "## Chakra Sysinfo                                                             ##"
	echo "################################################################################"
	echo
	echo -n "Release:                "
	cat /etc/issue |sed '/Arch/!d; s/\([^\\]*\).*/\1/g'
	echo -n "Platform:               "
	uname -m
	echo
	echo


	echo "CPU data:"
	echo "--------------------------------------------------------------------------------"
	cat /proc/cpuinfo |egrep 'vendor|model name|MHz|cache size'


	echo
	echo
	echo "RAM data (MiB):"
	echo "--------------------------------------------------------------------------------"
	free -m


	echo
	echo
	echo "PCI devices:"
	echo "--------------------------------------------------------------------------------"
	lspci


	echo
	echo
	echo "USB devices:"
	echo "--------------------------------------------------------------------------------"
	lsusb |grep -v 0000:0000


	echo
	echo
	echo "Disk space:"
	echo "--------------------------------------------------------------------------------"
	echo -n "Available: "
	df -k|grep -v '/dev/shm' |awk -- '{ print $2 }'| sed -e '1d; s/$/+/g;'| xargs -L 100 | awk -- '{ print "("$0,"0 )/1024/1024" }'|bc |tr '\n' ' '
	echo "GiB"
	echo -n "Used:      "
	df -k|grep -v '/dev/shm' |awk -- '{ print $3 }'| sed -e '1d; s/$/+/g;'| xargs -L 100 | awk -- '{ print "("$0,"0 )/1024/1024" }'|bc |tr '\n' ' '
	echo "GiB"
	echo -n "Free:      "
	df -k|grep -v '/dev/shm' |awk -- '{ print $4 }'| sed -e '1d; s/$/+/g;'| xargs -L 100 | awk -- '{ print "("$0,"0 )/1024/1024" }'|bc |tr '\n' ' '
	echo "GiB"


	echo
	echo
	echo "Kernel info:"
	echo "--------------------------------------------------------------------------------"
	uname -s -r -v


	echo
	echo
	echo "Kernel Modules:"
	echo "--------------------------------------------------------------------------------"
	lsmod| sed -e '1d;' | awk -- '{ print $1 }'| sort| uniq |xargs -n 3|awk -- '{ printf("%-25s %-25s %-25s\n", $1, $2, $3) }'


	echo
	echo
	echo "Uptime and Load average:"
	echo "--------------------------------------------------------------------------------"
	uptime


	echo
	echo
	echo "Chakra Packages"
	echo "--------------------------------------------------------------------------------"
	pacman -Q


	echo
	echo
	echo "testdb output"
	echo "--------------------------------------------------------------------------------"
	testdb


	echo
	echo
	echo "EOF"
}
echo
echo ":: collecting data"
get_data > ~/chakra-sysinfo.txt
echo ":: system info saved to /home/$_user/chakra-sysinfo.txt"
echo
