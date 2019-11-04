#!/bin/bash
pi=$(pwd)

IPOLD=$(cat $pi/localip.txt)
echo $IPOLD
IP=$(ip a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | cut -d "/" -f1)

if [ "$IP" == "$IPOLD" ]
then
        echo "IP address not changed!" | tee -a sj.log
        exit
else
#       rm $pi/localip.txt
        echo ${IP} > $pi/localip.txt | tee -a sj.log
        ssh ricjm@newifi "./ddns.sh $IP" | tee -a sj.log
fi