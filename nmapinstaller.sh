#!/bin/bash

# Install Nmap

Update the package list
sudo apt update

# Install Nmap
sudo apt install nmap

echo "Nmap has been successfully installed."

# Run Nmap to scan for devices
# Get the IP address of the computer
IP=$(hostname -I | awk '{print $1}')

# Print the IP address to the console
echo "My IP address is: $IP"

# Scan the local network for devices using Nmap
nmap -sn $IP/24 -oX devices.xml

# nmap -sn 192.168.0.0/24 -oX devices.xml

echo "Nmap scan complete. XML report generated in devices.xml."
