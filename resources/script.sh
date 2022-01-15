#!/bin/bash

set -e


SCRIPT_VERSION="v1.8.5"


print_brake() {
  for ((n = 0; n < $1; n++)); do
    echo -n "#"
  done
  echo ""
}

hyperlink() {
  echo -e "\e]8;;${1}\a${1}\e]8;;\a"
}

#### Colors ####

GREEN="\e[0;92m"
YELLOW="\033[1;33m"
reset="\e[0m"
red='\033[0;31m'

error() {
  COLOR_RED='\033[0;31m'
  COLOR_NC='\033[0m'

  echo ""
  echo -e "* ${COLOR_RED}ERROR${COLOR_NC}: $1"
  echo ""
}


#### Check Sudo ####

if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudo)." 1>&2
  exit 1
fi


#### Check Curl ####

if ! [ -x "$(command -v curl)" ]; then
  echo "* curl is required in order for this script to work."
  echo "* install using apt (Debian and derivatives) or yum/dnf (CentOS)"
  exit 1
fi

cancel() {
echo
echo -e "* ${red}Installation Canceled!${reset}"
done=true
exit 1
}

done=false
clear
echo
print_brake 70
echo "* Pterodactyl-Freestuff-Installer Script @ $SCRIPT_VERSION"
echo
echo "* Copyright (C) 2021 - 2022."
echo "* https://github.com/finnie2006/PteroFreeStuffinstaller"
echo
echo "* This script is not associated with the official Pterodactyl Project."
print_brake 70
echo

DarkNColor() {
bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/DarkNColor.sh)
}

Addons() {
bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/Addons.sh)
}

MinecraftTheme() {
 bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/mcTheme/install.sh)
}

mvbtheme() {
 bash <(curl -sSL https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/mvb/install.sh)
}

Animatedlogin() {
 bash <(curl -s https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/login/install.sh)
}


while [ "$done" == false ]; do
  options=(
    "Install DarkNColor"
    "Install Addons"
    "Install MinecraftTheme"
    "Install Animated Background theme"
    "Install Animatedlogin"

    
    
    "Cancel Installation"
  )
  
  actions=(
    "DarkNColor"
    "Addons"
    "MinecraftTheme"
    "mvbtheme"
    "Animatedlogin"

    
    
    "cancel"
  )
  
  echo "* Which theme do you want to install?"
  echo
  
  for i in "${!options[@]}"; do
    echo "[$i] ${options[$i]}"
  done
  
  echo
  echo -n "* Input 0-$((${#actions[@]} - 1)): "
  read -r action
  
  [ -z "$action" ] && error "Input is required" && continue
  
  valid_input=("$(for ((i = 0; i <= ${#actions[@]} - 1; i += 1)); do echo "${i}"; done)")
  [[ ! " ${valid_input[*]} " =~ ${action} ]] && error "Invalid option"
  [[ " ${valid_input[*]} " =~ ${action} ]] && done=true && eval "${actions[$action]}"
done
