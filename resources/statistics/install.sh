php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl/resources/views/admin
rm -rf statistics.blade.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/statistics.blade.php
cd /var/www/pterodactyl/resources/views/layouts
rm -rf admin.blade.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/admin.blade.php
cd /var/www/pterodactyl/app/Http/Controllers/Admin
rm -rf StatisticsController.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/StatisticsController.php
cd /var/www/pterodactyl/public/themes/pterodactyl/js/admin
rm -rf statistics.js
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/statistics.js
cd /var/www/pterodactyl/routes
rm -rf admin.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/admin.php
cd /var/www/pterodactyl/app/Repositories/Eloquent
rm ServerRepository.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/ServerRepository.php
cd /var/www/pterodactyl/app/Contracts/Repository
rm ServerRepositoryInterface.php
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/main/resources/statistics/ServerRepositoryInterface.php
php /var/www/pterodactyl/artisan up
echo "Statistics"
