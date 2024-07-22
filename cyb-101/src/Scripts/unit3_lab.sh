#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
none='\033[0m'
scripts_repo="https://raw.githubusercontent.com/codepath/cyb101-vm-setup/main/Files/"

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
    wget "${scripts_repo}unit3/crackfiles.zip" -O "$HOME/unit3/crackfiles.zip" || success=false

    # Verify copy was successful
    if [ "$success" = false ]; then
        echo -e "${red}[UNIT 3 LAB]${none} Error: Could not download crackfiles.zip to unit3/crackfiles.zip"
        echo -e "${red}[UNIT 3 LAB]${none} Try downloading manually from ${scripts_repo}unit3/crackfiles.zip and placing in ~/unit3."
        exit 1
    else
        sudo chown $USER:$USER "$HOME/unit3/crackfiles.zip"
        echo -e "${green}[UNIT 3 LAB]${none} File crackfiles.zip downloaded successfully."
    fi
fi

# Check if the old John needs to be removed
if command -v john >/dev/null 2>&1 ; then
    echo -e "[UNIT 3 LAB] Removing apt-get John package."
    sudo apt-get purge -y john
fi

# Check if the script needs to run
if command -v john-the-ripper >/dev/null 2>&1 ; then
    echo -e "${green}[UNIT 3 LAB]${none} John (snap) is already installed."
    exit 0
fi
echo "[UNIT 3 LAB] Installing John..."

# Install John
sudo snap install john-the-ripper

# Print output based on whether or not John is installed
if command -v john-the-ripper >/dev/null 2>&1 ; then
    echo -e "${green}[UNIT 3 LAB]${none} John (snap) installed successfully."
else
    echo -e "${red}[UNIT 3 LAB]${none} ERROR: John (snap) was not installed correctly!"
    exit 1
fi
