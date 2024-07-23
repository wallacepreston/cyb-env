#!/bin/bash
none='\033[0m'
green='\033[0;32m'
scripts_dir="./Files/"

echo "[UNIT 6 PROJECT] Starting script..."

# First, check if steghide is installed
if command -v steghide &> /dev/null; then
    echo -e "${green}[UNIT 6 PROJECT]${none} Steghide is already installed."
else
    sudo apt install -y steghide
    if ! command -v steghide &> /dev/null; then
        echo -e "${red}[UNIT 6 PROJECT]${none} ERROR: Steghide did not install!"
        exit 1
    fi
fi

# Create the unit6 folder if it doesn't exist
if [ ! -d "$HOME/unit6" ]; then
    mkdir "$HOME/unit6"
fi

# Copy the required files into the unit6 folder
if [ -e "$HOME/unit6/images.zip" ]; then
    echo -e "${green}[UNIT 6 PROJECT]${none} File images.zip found at ~/unit6."
else
    # Ensure the unit6 directory exists
    if [ ! -d "$HOME/unit6" ]; then
        mkdir -p "$HOME/unit6"
    fi
    
    # Copy and configure the file
    success=true
    cp "${scripts_dir}unit6/images.zip" "$HOME/unit6/images.zip" || success=false

    # Verify copy was successful
    if [ "$success" = false ]; then
        echo -e "${red}[UNIT 6 PROJECT]${none} Error: Could not copy images.zip to unit6/images.zip"
        echo -e "${red}[UNIT 6 PROJECT]${none} Try copying manually from ${scripts_dir}unit6/images.zip and placing in ~/unit6."
        exit 1
    else
        sudo chown $USER:$USER "$HOME/unit6/images.zip"
        # Unzip the images.zip file
        cd ~/unit6
        unzip images.zip
        echo -e "${green}[UNIT 6 PROJECT]${none} File images.zip copied successfully."
    fi
fi

