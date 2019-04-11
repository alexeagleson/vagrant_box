#!/bin/bash
project_path="my_project"

# MySQL
sudo apt-get install -y mysql-server-5.6 mysql-client-5.6

# PHPMYADMIN
sudo apt-get install -y phpmyadmin
# Add the phpmyadmin config to the apache2.conf file
echo -e "Include /etc/phpmyadmin/apache.conf" | sudo tee -a /etc/apache2/apache2.conf
sudo a2dismod php5
sudo a2enmod php7.2

# Create the project directory
sudo mkdir /var/www/$project_path
sudo touch /var/www/$project_path/index.html

# Give the web server permission to access relevant files
sudo chown -R www-data:www-data /var/www/$project_path
sudo chmod -R 777 /var/www/$project_path

# Create a dummy home page for testing
sudo echo '<h1>Welcome to your Vagrant homepage!</h1>' >> /var/www/$project_path/index.html

# Change the project serving directory to match the project name
sudo sed -i 's,/var/www/html,/var/www/'$project_path',g' /etc/apache2/sites-available/000-default.conf
 
# Set AllowOverride All for in apache2.conf for /var/www path
sudo sed -i '/<Directory \/var\/www/,/<\/Directory>/ s/AllowOverride all/AllowOverride All/' /etc/apache2/apache2.conf

# Allow incoming URLs to be re-written
sudo a2enmod rewrite

sudo service apache2 restart

