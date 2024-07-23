#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
none='\033[0m'
scripts_dir="./Files/"

echo "[UNIT 3 LAB] Starting script..."

# Download the required files into the unit3 directory
if [ -e "$HOME/unit3/crackfiles.zip" ]; then
    echo -e "${green}[UNIT 3 LAB]${none} File crackfiles.zip already found at ~/unit3."
else
    # Ensure the unit3 directory exists
    if [ ! -d "$HOME/unit3" ]; then
        mkdir -p "$HOME/unit3"
    fi
    
    # Download and configure the file
    success=true
    cp "${scripts_dir}unit3/crackfiles.zip" "$HOME/unit3/crackfiles.zip" || success=false

    # Verify copy was successful
    if [ "$success" = false ]; then
        echo -e "${red}[UNIT 3 LAB]${none} Error: Could not copy crackfiles.zip to unit3/crackfiles.zip"
        echo -e "${red}[UNIT 3 LAB]${none} Try copying manually from ${scripts_dir}unit3/crackfiles.zip and placing in ~/unit3."
        exit 1
    else
        sudo chown $USER:$USER "$HOME/unit3/crackfiles.zip"
        echo -e "${green}[UNIT 3 LAB]${none} File crackfiles.zip downloaded successfully."
    fi
fi

echo -e "${green}[UNIT 3 LAB]${none} Setup successful!"
