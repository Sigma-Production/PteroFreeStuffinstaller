cd /var/www/pterodactyl/resources/scripts/components/server/files/
rm -rf UploadButton.tsx
wget https://raw.githubusercontent.com/beastksoepic/PteroFreeStuffinstaller/main/resources/UploadProgress/UploadButton.tsx
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
npm i -g yarn
cd /var/www/pterodactyl
yarn install
yarn build:production
echo "Upload progress tracker installed"