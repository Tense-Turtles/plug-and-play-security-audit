
#!/bin/bash
# Here is a simple script that can be used to perform OS reconnaissance on a target system:
# Simple script to perform OS reconnaissance on a target system

# Check if an IP address was provided as an argument
# if [ -z "$1" ]; then
#     echo "Usage: $0 <IP_ADDRESS>"
#     exit 1
# fi

# Set the target IP address

target_ip=$(hostname -I | awk '{print $1}')


# Run the nmap command to perform OS detection
nmap -O $target_ip

# This script takes the target IP address as an argument and then runs the `nmap` command with the `-O` option to perform OS detection. The output of the `nmap` command will show the detected OS and its version.

# You can run this script by saving it to a file (e.g., `os_recon.sh`) and making it executable (`chmod +x os_recon.sh`). Then you can run it from the command line (`./os_recon.sh <IP_ADDRESS>`) to perform the OS reconnaissance.

# Please note that you need to have `nmap` installed on your system to run this script. Also, make sure you have permission to perfor./m network scans on your network.

# I hope this helps! Let me know if you have any questions or need further assistance.