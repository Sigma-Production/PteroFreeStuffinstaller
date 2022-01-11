php /var/www/pterodactyl/artisan down
cd public/themes/pterodactyl/css
cp pterodactyl.css pterodactyl.css.backup
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/DarkNBlue/public/themes/pterodactyl/css/pterodactyl.css
clear
cd /var/www/pterodactyl
if ! command -v node -v &> /dev/null
then
    curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
    apt-get install -y nodejs
fi
if ! command -v yarn -v &> /dev/null
then
    npm i -g yarn
fi
yarn install
yarn build:production
clear
php /var/www/pterodactyl/artisan up
echo "DarkNBlue theme added"
