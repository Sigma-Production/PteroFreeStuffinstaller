
php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts
rm -rf main.css
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/Navy/main.css
clear
curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
apt-get install -y nodejs
npm i -g yarn
cd /var/www/pterodactyl
yarn install
yarn add @emotion/react
yarn build:production
clear
php /var/www/pterodactyl/artisan up
echo "Navy theme added"
