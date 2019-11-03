#!/bin/bash

IP=$(ip a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}' | cut -d "/" -f1)

echo ${IP}

ssh ricjm@115.156.xxx.xxx "./ddns.sh $IP"
