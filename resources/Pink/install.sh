php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts
rm -rf main.css
wget https://raw.githubusercontent.com/RTK23-dev/PteroFreeStuffinstaller/main/resources/Pink/main.css
rm -rf index.tsx
wget https://raw.githubusercontent.com/RTK23-dev/PteroFreeStuffinstaller/main/resources/DarkNRed/index.tsx
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
echo "Pink theme Installed"
