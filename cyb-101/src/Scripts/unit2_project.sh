#!/bin/bash
red='\033[0;31m'
none='\033[0m'
green='\033[0;32m'
echo "[UNIT 2 PROJECT] Starting script..."

# Minimum required Git version
required_version="2.34.0"

# Check if Git is installed
if command -v git &>/dev/null; then
    # Get Git version
    git_version=$(git --version | awk '{print $3}')

    # Compare Git version with the required version
    if [ "$(printf '%s\n' "$required_version" "$git_version" | sort -V | head -n 1)" != "$required_version" ]; then
        echo "[UNIT 2 PROJECT] Updating Git to version >= $required_version"
        
        # Add Git PPA, update, and upgrade
        sudo add-apt-repository ppa:git-core/ppa -y
        sudo apt-get update
        sudo apt-get upgrade -y

        echo "Git updated successfully!"
    fi
else
    echo "[UNIT 2 PROJECT] Git is not installed. Installing Git..."

    # Add Git PPA, update, and install Git
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt-get update
    sudo apt-get install -y git
fi

# Verify the installed Git version
installed_git_version=$(git --version | awk '{print $3}')
if [ "$(printf '%s\n' "$required_version" "$installed_git_version" | sort -V | head -n 1)" == "$required_version" ]; then
    echo -e "${green}[UNIT 2 PROJECT]${none} Git <=$required_version is installed!"
else
    echo -e "${red}[UNIT 2 PROJECT]${none} Git <=$required_version is NOT installed! Check the installation or try installing manually."
    exit 1
fi