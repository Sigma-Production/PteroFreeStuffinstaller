echo "1. Dracula - Panel Version: 1.2.0, 1.2.1, and 1.2.2"
echo "2. Dark-N-Purple - Panel Version: 1.2.2"
echo "3. Enola - Panel Version: 1.2.0, 1.2.1, and 1.2.2"
echo "4. Recolor - Panel Version: 1.2.0, 1.2.1, and 1.2.2"
echo "5. Twilight - Panel Version: 1.1.3, 1.2.0, 1.2.1, and 1.2.2"
echo "6. Uninstall"
echo "7. Cancel"
echo ""
echo ""
echo "Screenshots of the themes can be found at: https://github.com/OreoKitten/PteroThemes"
read -p "Please enter a number: " choice
if [ $choice == "1" ]
    then
    echo "Installing Dracula..."
    bash <(curl -sSL https://raw.githubusercontent.com/WeLikeToCodeStuff/ptero-1.0-theme-install/main/resources/dracula/install.sh)
fi
if [ $choice == "2" ]
    then
    echo "Installing Dark-N-Purple..."
    bash <(curl -sSL https://raw.githubusercontent.com/WeLikeToCodeStuff/ptero-1.0-theme-install/main/resources/dark-n-purple/install.sh)
fi
if [ $choice == "3" ]
    then
    echo "Installing enola..."
    bash <(curl -sSL https://raw.githubusercontent.com/WeLikeToCodeStuff/ptero-1.0-theme-install/main/resources/enola/install.sh)
fi
if [ $choice == "4" ]
    then
    echo "Installing Recolor..."
    bash <(curl -sSL https://raw.githubusercontent.com/WeLikeToCodeStuff/ptero-1.0-theme-install/main/resources/recolor/install.sh)
fi
if [ $choice == "5" ]
    then
    echo "Installing Twilight..."
    bash <(curl -sSL https://raw.githubusercontent.com/WeLikeToCodeStuff/ptero-1.0-theme-install/main/resources/twilight/install.sh)
fi
if [ $choice == "6" ]
    then
    echo "Uninstalling..."
    bash <(curl -sSL https://raw.githubusercontent.com/WeLikeToCodeStuff/ptero-1.0-theme-install/main/resources/uninstall/uninstall.sh)
fi
if [ $choice == "7" ]
    then
    echo "Canceling..."
    exit 0
fi
