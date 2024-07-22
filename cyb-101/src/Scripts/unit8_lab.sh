#!/bin/bash
none='\033[0m'
green='\033[0;32m'
echo "[UNIT 8 LAB] Starting script..."

# First, check if steghide is installed
if command -v setoolkit &> /dev/null; then
    echo -e "${green}[UNIT 8 LAB]${none} setoolkit is already installed."
    exit 0
fi

# Next, check if python is installed
if ! command -v python &> /dev/null; then
    sudo apt install -y python-is-python3
    if ! command -v python &> /dev/null; then
        echo -e "${red}[UNIT 8 LAB]${none} ERROR: python-is-python3 did not install!"
        exit 1
    fi
fi

# Next, check if pip3 is installed
if ! command -v pip3 &> /dev/null; then
    sudo apt install -y python3-pip
    if ! command -v pip3 &> /dev/null; then
        echo -e "${red}[UNIT 8 LAB]${none} ERROR: python3-pip did not install!"
        exit 1
    fi
fi

git clone https://github.com/trustedsec/social-engineer-toolkit/ setoolkit/
cd setoolkit
pip3 install -r requirements.txt
sudo python setup.py

if ! command -v setoolkit &> /dev/null; then
    echo -e "${red}[UNIT 8 LAB]${none} ERROR: setoolkit did not install!"
    exit 1
else
    echo -e "${green}[UNIT 8 LAB]${none} setoolkit installed!"
fi



