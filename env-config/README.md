###To setup Node enviorment on Ubuntu:
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Note: log out and log in
nvm install node

###To setup Docker enviorment on Ubuntu:
sudo chmod 755 ./docker-config.sh
sudo ./docker-config.sh
# Note: log out and log in
sudo apt install --save docker-compose -y


sudo cp ./network/orderer/configtxgen /usr/bin/