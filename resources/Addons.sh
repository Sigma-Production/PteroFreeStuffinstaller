echo ""
echo "1. Serperate Kill-Button"
echo "2. McPaste"
echo "3. MoreServerInfo"
echo "4. pma Button"
echo "5. Close / Cancel"
echo ""
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    echo "Installing Serperate Kill-button..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/Kill-Button/install.sh)
fi
if [ $choice == "2" ]
    then
    echo "Installing McPaste..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/McPaste/install.sh)
fi
if [ $choice == "3" ]
    then
    echo "Installing MoreServerInfo..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/MoreServerInfo/install.sh)
fi
if [ $choice == "4" ]
    then
    echo "Installing Phpmyadmin button..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/phpmyadmin/install.sh)
fi

if [ $choice == "5" ]
    then
    echo "Canceling..."
    exit 0
fi
