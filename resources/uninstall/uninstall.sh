php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts
rm -rf main.css
rm -rf index.tsx
wget https://raw.githubusercontent.com/DeveloperNeon/ptero-1.0-theme-install/main/resources/uninstall/index.tsx
cd ../..
php artisan view:clear
php artisan cache:clear
clear
echo "User panel theme has been uninstalled."
echo "Uninstalling admin theme..."
cd /var/www/pterodactyl/resources/views/layouts/
rm -rf admin.blade.php
wget https://raw.githubusercontent.com/DeveloperNeon/ptero-1.0-theme-install/main/resources/uninstall/admin.blade.php
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
echo "Admin theme uninstall complete, Make sure to shift + refresh your page!"
