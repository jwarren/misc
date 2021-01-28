#!/bin/bash

# Ubuntu 20 intialization script

# Double-check user. In this case it's UBUNTU

# Update packages
apt-get update -y
# System upgrade
apt-get upgrade -y
# Install apache
apt-get install -y apache2
# Install MySQL
apt-get install -y mysql-server
# install php, apache-php module, gd, zip, xml, curl, php-curl, mysql, php-mysql, mbstring
apt-get install -y php libapache2-mod-php php-gd php-zip php-xml curl php-curl php-mysql php-mbstring
# Install unzip
apt-get install -y unzip
# Restart apache
sudo service apache2 restart
# Group, directory, file, user, permission adjustments
chgrp www-data /var/www
chmod 775 /var/www
usermod -a -G www-data ubuntu
chown -R ubuntu:www-data /var/www
chmod 2775 /var/www
# Install SSL Service items
snap install -y core
# refresh SSL Service items
snap refresh core
# Install certbot
snap install --classic certbot
# Create symlink
ln -s /snap/bin/certbot /usr/bin/certbot
# Copy original default V-Host file
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf_original
# Copy V-Host file to temp directory
cp /etc/apache2/sites-available/000-default.conf /var/tmp/000-default.conf 
# Copy original default apache.conf file
cp /etc/apache2/apache2.conf /etc/apache2/apache2.conf_original
# Copy apache.conf file to temp directory
cp /etc/apache2/apache2.conf /var/tmp/apache2.conf