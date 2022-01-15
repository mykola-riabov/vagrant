#!/bin/bash
apt update
apt -y install apache2
apt -y install php7.4 php7.4-gd php7.4-mysql php7.4-curl php7.4-mbstring php7.4-intl php7.4-gmp php7.4-bcmath php-imagick php7.4-xml php7.4-zip libapache2-mod-php7.4
mkdir /home/vagrant/nc
cd /home/vagrant/nc
wget https://download.nextcloud.com/server/releases/nextcloud-23.0.0.tar.bz2
tar -xjvf nextcloud-23.0.0.tar.bz2
cp -r nextcloud /var/www/
cd /var/www
chown -R www-data:www-data nextcloud/
cat << EOF > /etc/apache2/sites-available/nextcloud.conf
<VirtualHost *:80>
DocumentRoot /var/www/nextcloud/
ServerName localhost
<Directory /var/www/nextcloud/>
Require all granted
AllowOverride All
Options FollowSymLinks MultiViews
<IfModule mod_dav.c>
Dav off
</IfModule>
</Directory>
</VirtualHost>
EOF
a2ensite nextcloud.conf
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime
systemctl restart apache2
