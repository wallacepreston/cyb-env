#!/bin/bash
none='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
scripts_dir="./Files/"


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
    cp "${scripts_dir}unit3/cp_leak.txt" "$HOME/unit3/cp_leak.txt" || success=false

    # Verify copy was successful
    if [ "$success" = false ]; then
        echo -e "${red}[UNIT 3 PROJECT]${none} Error: Could not copy cp_leak.txt to unit3/cp_leak.txt"
        echo -e "${red}[UNIT 3 PROJECT]${none} Try copying manually from ${scripts_dir}unit3/crackfiles.zip and placing in ~/unit3."
        exit 1
    else
        sudo chown $USER:$USER "$HOME/unit3/cp_leak.txt"
        echo -e "${green}[UNIT 3 PROJECT]${none} File cp_leak.txt download successfully."
    fi
fi

echo -e "${green}[UNIT 3 PROJECT]${none} Setup successful!"