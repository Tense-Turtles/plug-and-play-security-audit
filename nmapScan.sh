#!/bin/bash
# Here is a simple `nmap` script that can be used to scan the current device and check for firewall rules:
# Simple nmap script to scan the current device and check for firewall rules

if [ "$EUID" -ne 0 ]; then
    # If not, use sudo to re-run the script as root
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

# Print the subnet
# echo $subnet

# Get the IP address of the current device
# echo $ip_address
# Run the nmap command to scan the current device
nmap -A -sS -sV -p- -T4 $ip_address
nmap -sn $subnet/24

# This script uses the `hostname` command to get the IP address of the current device and then runs the `nmap` command to perform a scan. The `-sS` option performs a SYN scan, the `-sV` option detects service versions, the `-p-` option scans all ports, and the `-T4` option sets the timing template to "aggressive".

# You can run this script by saving it to a file (e.g., `scan.sh`) and making it executable (`chmod +x scan.sh`). Then you can run it from the command line (`./scan.sh`) to perform the scan.

# Please note that you need to have `nmap` installed on your system to run this script. Also, make sure you have permission to perform network scans on your network.

# I hope this helps! Let me know if you have any questions or need further assistance.
