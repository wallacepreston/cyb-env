#!/bin/bash
none='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
scripts_repo="https://raw.githubusercontent.com/codepath/cyb101-vm-setup/main/Files/"

echo "[UNIT 3 PROJECT] Starting script..."

# Download the required file into the unit3 directory
if [ -e "$HOME/unit3/cp_leak.txt" ]; then
    echo -e "${green}[UNIT 3 PROJECT]${none} File cp_leak.txt found at ~/unit3."
else
    # Ensure the unit3 directory exists
    if [ ! -d "$HOME/unit3" ]; then
        mkdir -p "$HOME/unit3"
    fi
    
    # Download and configure the file
    success=true
    wget "${scripts_repo}unit3/cp_leak.txt" -O "$HOME/unit3/cp_leak.txt" || success=false
    
    # Verify copy was successful
    if [ "$success" = false ]; then
        echo -e "${red}[UNIT 3 PROJECT]${none} Error: Could not download cp_leak.txt to unit3/cp_leak.txt"
        echo -e "${red}[UNIT 3 PROJECT]${none} Try downloading manually from ${scripts_repo}unit3/cp_leak.txt and placing in ~/unit3."
        exit 1
    else
        sudo chown $USER:$USER "$HOME/unit3/cp_leak.txt"
        echo -e "${green}[UNIT 3 PROJECT]${none} File cp_leak.txt download successfully."
    fi
fi

# Verify John is installed
if ! command -v john-the-ripper >/dev/null 2>&1 ; then
    echo -e "${red}[UNIT 3 PROJECT]${none} Error: John (snap) is not installed.  Please run Unit 3 Lab script."
    exit 1
fi