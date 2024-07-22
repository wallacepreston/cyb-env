#!/bin/bash
none='\033[0m'
green='\033[0;32m'
echo "[UNIT 2 LAB] Starting script..."

# Create the unit2 folder if it doesn't exist
if [ ! -d "$HOME/unit2" ]; then
    mkdir "$HOME/unit2"
fi

echo -e "${green}[UNIT 2 LAB]${none} Setup successful!"