#!/bin/bash

echo '''    _              _
   / \   ___  __ _(_)___
  / _ \ / _ \/ _` | / __|
 / ___ |  __| (_| | \__ \
/_/   \_\___|\__, |_|___/
             |___/'''


# Check if the script is being run as root
if [ "$EUID" -ne 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# Get the current screen size
screen_size=$(stty size)

# Extract the number of rows and columns
rows=$(echo $screen_size | cut -d' ' -f1)
cols=$(echo $screen_size | cut -d' ' -f2)

# Define the menu options
options=("Full Audit" "Nmap" "ZAP Scan" "Quit")

connection_string="mongodb+srv://shellr:<password>@cluster0.zfbvsyl.mongodb.net/?retryWrites=true&w=majority"

show_menu() {
    clear
    echo "Please choose an option:"
    for i in "${!options[@]}"; do
        printf "%s) %s\n" "$((i + 1))" "${options[$i]}"
    done
}

get_input() {
    local choice
    read -p "Enter your choice [1-${#options[@]}]: " choice
    echo $choice
}

fullScan() {
    cd lynsis
    ./lynis audit system

    cd ..
    ./lynisConverter.sh

    cd ..

    nmapScan
    ZapScan
    #Upload to mongo

    file_path="lynis-report-converter/report.pdf"

    collection="auditReports"

    mongoimport --uri "$connection_string" --collection "$collection" --file "$file_path"

    file_path="devices.xml"

    collection="auditReports"

    mongoimport --uri "$connection_string" --collection "$collection" --file "$file_path"


    file_path="targetDevice.xml"

    collection="auditReports"

    mongoimport --uri "$connection_string" --collection "$collection" --file "$file_path"
    

}

nmapScan() {

    # Get the IP address of the computer
    IP=$(hostname -I | awk '{print $1}')

    # Print IP
    echo "My IP address is: $IP"

    # Scan the local network for devices using Nmap
    nmap -sn $IP/24 -oX devices.xml

    nmap -A -sS -sV -p- -T4 $IP -oX targetDevice.xml

}

ZapScan() {
    # read target_url
echo "WIP"
    # java -jar ZAP/zap-2.12.0.jar -cmd -quickurl $target_url -quickprogress

}
while true; do
    show_menu
    choice=$(get_input)
    case $choice in
    1) fullScan ;;
    2) nmapScan ;;
    3) ZAPScan ;;
    4) break ;;
    *) echo "Invalid option" ;;
    esac
    read -n1 -p "Press any key to continue..."
done

clear