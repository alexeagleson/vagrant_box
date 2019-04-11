#!/bin/bash

# Update all packege info we will need
sudo apt-add-repository ppa:ondrej/php
sudo curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update

# Apache2 Install
sudo apt-get install -y apache2
# Append the text 'ServerName localhost' to the end of the apache2.conf file
echo -e "ServerName localhost" | sudo tee -a /etc/apache2/apache2.conf

# PHP install
# Composer will need xml and zip
sudo apt-get install -y php7.2 php7.2-xml php7.2-zip php7.2-mbstring php7.2-mysql

# Composer
sudo curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Node 8
sudo apt-get install -y nodejs

# Git
sudo apt-get install -y git-core

# Yarn
sudo apt-get install yarn













