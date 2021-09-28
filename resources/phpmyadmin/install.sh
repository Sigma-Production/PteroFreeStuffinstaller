php /var/www/pterodactyl/artisan down
clear
cd /var/www/pterodactyl/resources/scripts/components/server/databases
rm -rf DatabaseRow.tsx
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/phpmyadmin/DatabaseRow.tsx
cd /var/www/pterodactyl/public
rm -rf pma_redirect.html
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/phpmyadmin/pma_redirect.html
echo " "
echo 'Where is phpMyAdmin located? Make sure to have "http://" or "https://" !'
echo " "
echo "For example:"
echo "https://pma.yourdomain.com"
echo "OR"
echo "https://panel.yourdomain.com/phpmyadmin"
echo " "
read pmalocation
sed -i "s|http:\/\/yourdomain.com\/phpmyadmin|$pmalocation|g" /var/www/pterodactyl/public/pma_redirect.html
clear
cd /var/www/pterodactyl
yarn run build:production
clear
php /var/www/pterodactyl/artisan up
echo "phpMyAdmin successfully installed"
