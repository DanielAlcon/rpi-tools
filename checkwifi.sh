#!/bin/bash
# you need to sudo chmod 775 the file and then in crontab */5 * * * * /usr/bin/sudo -H /path/to/your/checkwifi.sh >> /dev/null 2>&1
ping -c4 www.google.es > /dev/null
 
if [ $? != 0 ] 
then
  sudo /sbin/shutdown -r now
fi