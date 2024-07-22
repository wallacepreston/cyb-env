#!/bin/bash
none='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
echo "[UNIT 4 LAB] Starting script..."

# First, check if firefox is installed
if command -v firefox &> /dev/null; then
    echo -e "${green}[UNIT 4 LAB]${none} Firefox is already installed."
else
    sudo apt install -y firefox
    if ! command -v firefox &> /dev/null; then
        echo -e "${red}[UNIT 4 LAB]${none} ERROR: Firefox did not install!"
        exit 1
    else
        echo -e "${green}[UNIT 4 LAB]${none} Firefox installed successfully."
    fi
fi
