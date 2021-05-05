echo "1. McPaste Install"
echo "2. MoreServerInfo Install"
echo "3. Remove Mcpaste"
echo "4. Remove MoreServerInfo"
echo "5. Install Dark N Red Theme"
echo "6. Install Dark n Green Theme"
echo "7. Cancel"
echo ""
echo ""
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    echo "Installing McPaste..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/McPaste/install.sh)
fi
if [ $choice == "2" ]
    then
    echo "Installing MoreServerInfo..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/MoreServerInfo/install.sh)
fi
if [ $choice == "3" ]
    then
    echo "Removing McPaste..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/uninstall/uninstall.sh)
fi
if [ $choice == "4" ]
    then
    echo "Removing MoreServerInfo..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/uninstall/uninstall2.sh)
fi
if [ $choice == "5" ]
    then
    echo "Installing Dark N Red Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNRed/install.sh)


fi
if [ $choice == "5" ]
    then
    echo "Installing Dark N Green Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNGreen/install.sh)


fi
if [ $choice == "7" ]
    then
    echo "Canceling..."
    exit 0
fi
