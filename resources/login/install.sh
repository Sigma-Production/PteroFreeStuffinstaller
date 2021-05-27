php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts
rm -rf main.css
https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/login/main.css
rm -rf index.tsx
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNRed/index.tsx
cd /var/www/pterodactyl/resources/views/templates/
rm -rf wrapper.blade.php
https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/login/wrapper.blade.php
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
echo "Animated background theme Installed"
