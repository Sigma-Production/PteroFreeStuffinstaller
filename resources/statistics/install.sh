php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/views/admin
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/statistics.blade.php
cd /var/www/pterodactyl/resources/views/layouts
rm -rf statistics.blade.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/admin.blade.php
cd /var/www/pterodactyl/app/Http/Controllers/Admin
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/StatisticsController.php
cd /var/www/pterodactyl/public/themes/pterodactyl/js/admin
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/statistics.js
clear
php /var/www/pterodactyl/artisan up
echo "Statistics"
