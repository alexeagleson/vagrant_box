#!/bin/bash
project_path="my_project"

# Enable SSL
sudo a2enmod ssl
sudo mkdir /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt

# Change the paths in the apache2 ssl file from the default to the ones we just created
sudo sed -i 's,/etc/ssl/certs/ssl-cert-snakeoil.pem,/etc/apache2/ssl/apache.crt,g' /etc/apache2/sites-available/default-ssl.conf
sudo sed -i 's,/etc/ssl/private/ssl-cert-snakeoil.key,/etc/apache2/ssl/apache.key,g' /etc/apache2/sites-available/default-ssl.conf
sudo a2ensite default-ssl.conf

# Change the project serving directory to match the project name
sudo sed -i 's,/var/www/html,/var/www/'$project_path',g' /etc/apache2/sites-available/default-ssl.conf

sudo service apache2 restart

