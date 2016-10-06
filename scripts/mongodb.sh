#!/usr/bin/env bash

echo ">>> Installing MongoDB"

# Get key and add MongoDB 3.2.x to sources
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update
sudo apt-get update

# Install MongoDB
# -qq implies -y --force-yes
sudo apt-get install -qq mongodb-org

# Make MongoDB connectable from outside world without SSH tunnel
if [ $1 == "true" ]; then
    # enable remote access
    # setting the mongodb bind_ip to allow connections from everywhere
    sed -i "s/bind_ip = */bind_ip = 0.0.0.0/" /etc/mongod.conf
fi

# Test if PHP is installed
php -v > /dev/null 2>&1
PHP_IS_INSTALLED=$?

if [ $PHP_IS_INSTALLED -eq 0 ]; then
    # install dependencies
    sudo DEBIAN_FRONTEND=noninteractive apt-get -y install php-pear php7.0-dev pkg-config

    # install php extencion
    sudo pecl install mongo
    sudo pecl install mongodb

    # add extencion file and restart service
    echo 'extension=mongodb.so' | sudo tee /etc/php/7.0/mods-available/mongodb.ini

    ln -s /etc/php/7.0/mods-available/mongodb.ini /etc/php/7.0/fpm/conf.d/mongodb.ini
    ln -s /etc/php/7.0/mods-available/mongodb.ini /etc/php/7.0/cli/conf.d/mongodb.ini
    sudo service php7.0-fpm restart
fi
