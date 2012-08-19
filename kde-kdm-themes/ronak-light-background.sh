#!/bin/sh

#Copyright 2010 Phil Miller <philm@chakra-project.org>
#
#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License as
#published by the Free Software Foundation; either version 2 of 
#the License, or (at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

echo "Search for your current screen resolution (this may flicker)"

CURRENT_RES=`xrandr  | grep '*' | cut -b -16 | sed 's/ //g'`

echo "Your current screen resolution is: $CURRENT_RES"
echo "Try to link right backround ..."

FOLDER="/usr/share/apps/kdm/themes/RONAK-LIGHT/$CURRENT_RES"

if [ -d $FOLDER ];
then
   echo "Using $FOLDER"
   cp -Rvf /usr/share/apps/kdm/themes/RONAK-LIGHT/$CURRENT_RES/* /usr/share/apps/kdm/themes/RONAK-LIGHT
else
   echo "File $FILE does not exists! Using 1280x800"
   CURRENT_RES="1280x800"
   cp -Rvf /usr/share/apps/kdm/themes/RONAK-LIGHT/$CURRENT_RES/* /usr/share/apps/kdm/themes/RONAK-LIGHT
fi

