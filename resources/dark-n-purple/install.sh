php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts/components/server
wget https://raw.githubusercontent.com/finnie2006/ptero-1.0-theme-install/main/resources/dark-n-purple/McPaste.tsx
cd ../..
clear
echo "User panel theme has been added."
echo "Installing admin theme..."
cd /var/www/pterodactyl/resources/views/layouts/
rm -rf admin.blade.php
wget https://raw.githubusercontent.com/DeveloperNeon/ptero-1.0-theme-install/main/resources/dark-n-purple/admin.blade.php
npm install yarn -g
yarn install
yarn add @emotion/react
rm -rf /var/www/pterodactyl/resources/scripts/hoc/requireServerPermission.tsx
yarn build:production
cd ../../..
php /var/www/pterodactyl/artisan up
php /var/www/pterodactyl/artisan view:clear
php /var/www/pterodactyl/artisan cache:clear
clear
echo "PasteBin Installed"
