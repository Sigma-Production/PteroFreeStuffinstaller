php /var/www/pterodactyl/artisan down
cd /var/www/pterodactyl
DIR="/var/www/pterodactyl/backup"
if [ -d "$DIR" ]; then
   echo "'$DIR' There already is a backup going furthur ..."
else
   echo "No backup found making one"
   mkdir -p backup/{resources,public}
   cp -r resources/* backup/resources/
   cp -r public/* backup/public/
   cp tailwind.config.js backup/
   echo "Created Backup going furthur"
fi

sudo curl https://raw.githubusercontent.com/finnie2006/PteroFreeStuffinstaller/V2/resources/DarkNRed/DarkNRed.tar.gz | sudo tar -xz
#clear
cd /var/www/pterodactyl
if ! command -v node -v &> /dev/null
then
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install -y nodejs
fi
if ! command -v yarn -v &> /dev/null
then
    npm i -g yarn
fi
yarn install
yarn build:production
#clear
php /var/www/pterodactyl/artisan up
echo "DarkNRed theme added"
