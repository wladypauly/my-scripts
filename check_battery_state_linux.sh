#!/bin/sh
#A simple script to show battery information for your laptop.
#The first command shows only charge levels, the second gives you full data about the battery.
echo "Do you want tho see the charging level of the battery (press C) or full data about your battery (press F)?"
read a 
if [ $a = "c" ] ; then
upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"
exit
elif [ $a = "f" ] ; then
echo "Here are the full data"
echo 
upower -i /org/freedesktop/UPower/devices/battery_BAT0
fi
exit
