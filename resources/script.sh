echo "1. McPaste Install"
echo "2. MoreServerInfo Install"
echo "3. Enola - Panel Version: 1.2.0, 1.2.1, and 1.2.2"
echo "4. Recolor - Panel Version: 1.2.0, 1.2.1, and 1.2.2"
echo "5. Twilight - Panel Version: 1.1.3, 1.2.0, 1.2.1, and 1.2.2"
echo "6. Uninstall"
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
if [ $choice == "7" ]
    then
    echo "Canceling..."
    exit 0
fi
