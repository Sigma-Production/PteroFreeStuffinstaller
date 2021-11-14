php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/scripts/
rm main.css
rm index.tsx
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/uninstall/index.tsx
clear
php /var/www/pterodactyl/artisan up
clear
echo "Removed Theme"
