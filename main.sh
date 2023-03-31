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
options=("Option 1" "Option 2" "Option 3" "Quit")

show_menu () {
    clear
    echo "Please choose an option:"
    for i in "${!options[@]}"; do
        printf "%s) %s\n" "$((i+1))" "${options[$i]}"
    done
}

get_input () {
    local choice
    read -p "Enter your choice [1-${#options[@]}]: " choice
    echo $choice
}

while true; do
    show_menu
    choice=$(get_input)
    case $choice in
        1) echo "You chose Option 1";;
        2) echo "You chose Option 2";;
        3) echo "You chose Option 3";;
        4) break;;
        *) echo "Invalid option";;
    esac
    read -n1 -p "Press any key to continue..."
done

clear