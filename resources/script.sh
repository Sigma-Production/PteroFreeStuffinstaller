echo "1. MoreServerInfo Install"
echo "2. Remove MoreServerInfo"
echo "3. Install Dark N Color Theme (Yellow, Purple, Green or Red)"
echo "4. Install Minecraft Theme"
echo "5. Install Animated Background Theme (unfinished, make a PR if you can)"
echo "6. Install Statistics page"
echo "7. Install phpMyAdmin button"
echo "8  Close / Cancel"
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    echo "Installing MoreServerInfo..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/MoreServerInfo/install.sh)
fi
if [ $choice == "2" ]
    then
    echo "Removing MoreServerInfo..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/uninstall/uninstall2.sh)
fi
if [ $choice == "3" ]
    then
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNColor.sh)
fi
if [ $choice == "4" ]
    then
    echo "Installing Minecraft Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/mcTheme/install.sh)
fi
if [ $choice == "5" ]
    then
    echo "Installing Animated Background Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/mvb/install.sh)
fi
if [ $choice == "6" ]
    then
    echo "Installing Statistics page..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/install.sh)
fi
if [ $choice == "7" ]
    then
    echo "Installing phpMyAdmin button..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/phpmyadmin/install.sh)
fi
if [ $choice == "8" ]
    then
    echo "Canceling..."
    exit 0
fi
