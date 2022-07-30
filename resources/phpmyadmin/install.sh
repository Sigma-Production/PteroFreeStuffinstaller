php /var/www/pterodactyl/artisan down

echo "Do you already have Phpmyadmin installed? y/n "
read answer

# if echo "$answer" | grep -iq "^y" ;then

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo "Phpmyadmin will not be installed (you already have it?)"
else
    echo "No"
echo 'In wich subdir do you want to install pma" !'
echo " "
echo "For example:"
echo "https://pma.yourdomain.com"
echo "OR"
echo "https://yourdomain.com/phpmyadmin"
echo " "
read installpmalocation
sed -i "s|http:\/\/yourdomain.com\/phpmyadmin|$pmalocation|g" /var/www/pterodactyl/public/pma_redirect.html
mkdir /var/www/pterodactyl/public/phpmyadmin && cd /var/www/pterodactyl/public/phpmyadmin
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz
tar xvzf phpMyAdmin-*-english.tar.gz
mv /var/www/pterodactyl/public/phpmyadmin/phpMyAdmin-*-english/* /var/www/pterodactyl/public/phpmyadmin

fi




cd /var/www/pterodactyl/resources/scripts/components/server/databases
rm -rf DatabaseRow.tsx
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.10.1/resources/phpmyadmin/DatabaseRow.tsx
cd /var/www/pterodactyl/public
rm -rf pma_redirect.html
wget https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V1.10.1/resources/phpmyadmin/pma_redirect.html
if [ -z "$pmalocation" ]; then
#clear
echo "phpmyadmin already installed"
else
#clear
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
fi
#clear
cd /var/www/pterodactyl
yarn run build:production
#clear
php /var/www/pterodactyl/artisan up
echo "phpMyAdmin successfully installed"
