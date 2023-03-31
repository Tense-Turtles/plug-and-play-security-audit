#!/bin/bash

Update the package list
sudo apt update

sudo apt install nmap

echo "Nmap has been successfully installed."

# Get the IP address of the computer
IP=$(hostname -I | awk '{print $1}')

# Print IP 
echo "My IP address is: $IP"

# Scan the local network for devices using Nmap
nmap -sn $IP/24 -oX devices.xml

echo "Nmap scan complete. XML report generated in devices.xml."
