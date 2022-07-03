#!/bin/bash

set -e
SCRIPT_VERSION="V1.9.1.0.0"

clear
echo
#print_brake 70
echo "* Pterodactyl-Freestuff-Installer Script @ $SCRIPT_VERSION"
echo
echo "* Copyright (C) 2021 - 2022."
echo "* https://github.com/finnie2006/PteroFreeStuffinstaller"
echo
echo "* This script is not associated with the official Pterodactyl Project."
#print_brake 70
echo
echo "1. Install DarkNColor"
echo "2. Install Addons"
echo "3. Install MinecraftTheme"
echo "4. Install Animated Background theme"
echo "5. Install Animatedlogin"
echo "6. Install Sidebar"
echo "7. Restore from backup"
echo "8. Close / Cancel"
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.9.1/resources/DarkNColor.sh)
fi
if [ $choice == "2" ]
    then
    bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.9.1/resources/Addons.sh)
fi
if [ $choice == "3" ]
    then
    echo "Installing Minecraft Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.9.1/resources/mcTheme/install.sh)
fi
if [ $choice == "4" ]
    then
    echo "Installing Animated Background Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/mvb/install.sh)
fi
if [ $choice == "5" ]
    then
    echo "resource temporary disabled"
    #bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.9.1/resources/login/install.sh)
fi
if [ $choice == "6" ]
    then
    echo "Installing Sidebar..."
    bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.9.1/resources/Sidebar/install.sh)
fi
if [ $choice == "7" ]
    then
    bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.9.1/resources/restore.sh)
fi
if [ $choice == "8" ]
    then
    echo "Canceling..."
    exit 0
fi
