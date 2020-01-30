#!/bin/bash
#Author: Surendra Kumar Anne
#Purpose: To monitor the CPU usage
#Date:2012-04-13
SUBJECT="WARNING CPU USAGE HIGH"
TO=swapna.mannem1@gmail.com
MESSAGE=/tmp/messages
echo "#######################" > $MESSAGE
echo "CPU statistics as follows.." >> $MESSAGE
mpstat >> $MESSAGE
echo "#######################" >> $MESSAGE
CPU_USAGE=$(top -b -n1 | awk '/^Cpu/ {print $2}' | cut -d. -f1)
if [ $CPU_USAGE -gt 75 ]; then
echo "alert"
else
echo "cpu current usage $CPU_USAGE"
fi
