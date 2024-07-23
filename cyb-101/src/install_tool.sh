#!/bin/bash
none='\033[0m'
green='\033[0;32m'
red='\033[0;31m'
yellow='\033[33m'
course="CYB101"

scripts_dir="./Scripts/"

# Function to check and perform system updates
perform_system_updates() {

    echo -e "Checking for system updates..."

    # Check the last update time by examining the modification time of /var/lib/apt/periodic/update-success-stamp
    if [ -f /var/lib/apt/periodic/update-success-stamp ]; then
        last_update=$(date -r /var/lib/apt/periodic/update-success-stamp +%s)
        current_time=$(date +%s)
        update_age=$(( (current_time - last_update) / 86400 )) # Convert seconds to days

        if [ $update_age -ge 7 ]; then # More than 7 days since last update
            echo -e "${yellow}INFO:${none} The system needs to update."
            echo -e "Downloading and running the update script..."
            wget "https://raw.githubusercontent.com/codepath/cyb101-vm-setup/main/Scripts/update.sh" -O update.sh
            chmod +x update.sh
            ./update.sh
        else
            echo -e "${green}System is up-to-date.${none}"
        fi
    else
        echo -e "${yellow}INFO:${none}No update history found... the system needs to update."
        wget "https://raw.githubusercontent.com/codepath/cyb101-vm-setup/main/Scripts/update.sh" -O update.sh
        chmod +x update.sh
        ./update.sh
    fi
}

# Welcome message
echo -e "Welcome to ${green}CodePath Cybersecurity${none}!"
echo -e "This tool will help you set up your environment for the ${course} course."


# Check if user is running Ubuntu
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" != "ubuntu" ]; then
        echo -e "${red}WARNING: You are not running Ubuntu. This script is intended for use on Ubuntu.${none}"
        read -p "Do you want to continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Exiting the program. Goodbye!"
            exit 1
        fi
    fi
else
    echo -e "${yellow}WARNING: Unable to determine Linux distribution. This script is intended for use on Ubuntu.${none}"
    read -p "Do you want to continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting the program. Goodbye!"
        exit 1
    fi
fi

# Check if wget is installed
if ! command -v wget &> /dev/null; then
    echo -e "${red}ERROR: wget is not installed.${none}"
    read -p "Do you want to install wget? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo apt install -y wget
    else
        echo "Exiting the program. Goodbye!"
        exit 1
    fi
fi

# Function to install all scripts
install_all_scripts() {
    echo -e "Installing all ${course} scripts..."
    for i in {1..8} ; do
        install_specific_unit "$i"
    done
}

# Function to install a specific script
install_specific_unit() {
    unit=$1

    # Download and run Lab script
    install_specific_script $unit lab
    # Download and run Project script
    install_specific_script $unit project
}

# Function to install a specific script
install_specific_script() {
    unit=$1
    type=$2
    script_name="unit${unit}_${type}.sh"

    # Set the script name to rdp_setup.sh if unit is 0
    if [ "$unit" == "0" ]; then
        script_name="rdp_setup.sh"
    fi

    # run script
    chmod +x "${scripts_dir}${script_name}"
    ${scripts_dir}${script_name}

    # Check the exit status of the script
    status=$?
    if [ $status -ne 0 ] ; then
        echo -e "${red}Error:${none} ${script_name} exited with status $status"
        read -p "Do you want to continue anyway? (y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Exiting the program. Goodbye!"
            exit 1
        fi       
    fi
}

# Ensure the system is updated before proceeding
perform_system_updates

install_all_scripts