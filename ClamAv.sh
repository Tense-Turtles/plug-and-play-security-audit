#!/bin/bash

# Install ClamAV
echo "Installing ClamAV..."
sudo apt-get update
sudo apt-get install -y clamav

# Configure ClamAV
echo "Configuring ClamAV..."
sudo freshclam # Update virus definition database
sudo systemctl stop clamav-freshclam # Stop freshclam service
sudo systemctl disable clamav-freshclam # Disable freshclam service
sudo sed -i 's/Example/#Example/' /etc/clamav/freshclam.conf # Comment out example configuration
sudo sed -i 's/#LocalSocket \/run\/clamav\/clamd.sock/LocalSocket \/var\/run\/clamav\/clamd.sock/' /etc/clamav/clamd.conf # Update Clamd socket path
sudo systemctl restart clamav-daemon # Restart ClamAV daemon

# Run ClamAV scan
echo "Running ClamAV scan..."
sudo clamscan -r ~ # Replace /path/to/scan_directory with the directory you want to scan

# Display scan results
#echo "Scan complete. Scan results:"
#sudo tail -n 20 /var/log/clamav/clamscan.log # Display last 20 lines of ClamAV scan log