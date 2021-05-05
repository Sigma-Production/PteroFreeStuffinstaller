php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNGreen/main.css
rm -rf index.tsx
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNRed/index.tsx
cd /var/www/pterodactyl/resources/views/layouts/
rm -rf admin.blade.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNRed/admin.blade.php
clear
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install -y nodejs
npm i -g yarn
cd /var/www/pterodactyl
yarn install
yarn add @emotion/react
yarn build:production
clear
php /var/www/pterodactyl/artisan up
echo "Dark N Green theme Installed"
