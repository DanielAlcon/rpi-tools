#!/bin/bash
COUNTER=0
for OUTPUT in $(seq 5)
do
    let COUNTER++
    ping -c4 www.google.es > /dev/null
    if [ $? != 0 && $COUNTER > 5] 
    then
        echo "No network connection, restarting wlan0"
        /sbin/ifdown 'wlan0'
        sleep 5
        /sbin/ifup --force 'wlan0'
    else
        sudo /sbin/shutdown -r now
    fi
done