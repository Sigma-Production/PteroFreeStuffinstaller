#### Panel Backup ####
backup() {
echo
print_brake 32
echo -e "* ${GREEN}Performing security backup...${reset}"
print_brake 32
if [ -f "/var/www/pterodactyl/PanelBackup/PanelBackup.zip" ]; then
echo
print_brake 45
echo -e "* ${GREEN}There is already a backup, skipping step...${reset}"
print_brake 45
echo
else
cd /var/www/pterodactyl
mkdir -p PanelBackup
zip -r PanelBackup.zip app config public resources routes storage database .env tailwind.config.js
mv PanelBackup.zip PanelBackup
fi
}

### Install theme ###
php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts
rm -rf main.css
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNRed/main.css
rm -rf index.tsx
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNRed/index.tsx
clear
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt-get install -y nodejs
npm i -g yarn
cd /var/www/pterodactyl
yarn install
yarn add @emotion/react
yarn build:production
clear
php /var/www/pterodactyl/artisan up
echo "Dark N red theme Installed"
