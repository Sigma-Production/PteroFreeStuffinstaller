echo ""
echo "1. DarkNRed"
echo "2. DarkNYellow"
echo "3. DarkNGreen"
echo "4. DarkNPurple"
echo "5. Close / Cancel"
echo ""
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    echo "Installing DarkNRed Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/DarkNRed/install.sh)
fi
if [ $choice == "2" ]
    then
    echo "Installing DarkNYellow Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/DarkNYellow/install.sh)
fi
if [ $choice == "3" ]
    then
    echo "Installing DarkNGreen Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/DarkNGreen/install.sh)
fi
if [ $choice == "4" ]
    then
    echo "Installing DarkNPurple Theme..."
    bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/DarkNPurple/install.sh)
fi

if [ $choice == "5" ]
    then
    echo "Canceling..."
    exit 0
fi
