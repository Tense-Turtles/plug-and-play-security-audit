#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# if [ -z "$2" ]; then
#     ip_address=$2
#     # echo "Usage: $0 <IP_ADDRESS>"
#     # exit 1
# else
ip_address=$(hostname -I | awk '{print $1}')
netmask=$(ifconfig | grep -w inet | grep -v 127.0.0.1 | awk '{print $4}')

# subnet_address=$(echo $host_address | sed -r "s/([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)([0-9]{1,3})/\1$new_value/")
# fi
IFS=. read -r i1 i2 i3 i4 <<< "$ip_address"
IFS=. read -r m1 m2 m3 m4 <<< "$netmask"
subnet="$((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))"

nmap -A -sS -sV -p- -T4 $ip_address
# nmap -sn $subnet/24