echo "1. Mcpaste Install - Panel Version: 1.x.x,
echo "2. MoreServerInfo - Panel Version: 1.x.x"
echo "3. McPaste Uninstall
echo "4. MoreServerInfo Uninstall
echo "6. Cancel"
echo ""
echo ""
echo "Screenshots of the themes can be found at: https://github.com/OreoKitten/PteroThemes"
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
if [ $choice == "6" ]
    then
    echo "Canceling..."
    exit 0
fi
