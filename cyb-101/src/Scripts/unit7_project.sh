#!/bin/bash
none='\033[0m'
green='\033[0;32m'
echo "[UNIT 7 PROJECT] Starting script..."

# First, check if curl is installed
if command -v curl &> /dev/null; then
    echo -e "$[UNIT 7 PROJECT] curl is already installed."
else
    sudo apt install -y curl
    if ! command -v curl &> /dev/null; then
        echo -e "${red}[UNIT 7 PROJECT]${none} ERROR: curl did not install!"
        exit 1
    fi
    echo -e "${green}[UNIT 7 PROJECT]${none} curl installed successfully."
fi

# Next, check if python3 is installed
if command -v python3 &> /dev/null; then
    echo -e "${green}[UNIT 7 PROJECT]${none} python is already installed."
else
    sudo apt install -y python3
    if ! command -v python3 &> /dev/null; then
        echo -e "${red}[UNIT 7 PROJECT]${none} ERROR: python did not install!"
        exit 1
    fi
    # Next, configure python command
    if ! command -v python &> /dev/null; then
        sudo apt install -y python-is-python3
        if ! command -v python &> /dev/null; then
            echo -e "${red}[UNIT 7 PROJECT]${none} ERROR: python-is-python3 did not install!"
            exit 1
        fi
    fi
    echo -e "${green}[UNIT 7 PROJECT]${none} python installed successfully."
fi
