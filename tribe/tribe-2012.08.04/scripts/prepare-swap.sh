#!/bin/bash

SWAP_PARTITIONS=$(fdisk -l | grep sd | gawk ' {print $1,$5}' | grep 82 | cut -d " " -f 1)

for swap_partition in $SWAP_PARTITIONS; do
	if [ -e "$swap_partition" ] ; then
		/sbin/mkswap $swap_partition
	fi
done


SWAP_PARTITIONS_2=$(fdisk -l | grep hd | gawk ' {print $1,$5}' | grep 82 | cut -d " " -f 1)

for swap_partition_2 in $SWAP_PARTITIONS_2; do
	if [ -e "$swap_partition_2" ] ; then
		/sbin/mkswap $swap_partition_2
	fi
done
