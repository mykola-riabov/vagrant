#!/bin/bash
echo "Installing and configiring mariadb..."
apt update
apt -y install mariadb-server mariadb-client
systemctl enable mariadb
systemctl start mariadb
root_password=ncdbpass
mysql -e "UPDATE mysql.user SET Password = PASSWORD('$root_password') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER IF EXISTS ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER IF EXISTS ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE IF EXISTS test"
echo "Creating next cloud database..."
mysql -e "CREATE DATABASE ncdb"
mysql -e "CREATE USER 'nc_user'@'%' IDENTIFIED BY 'nc-user-password'"
mysql -e "GRANT ALL PRIVILEGES ON ncdb.* to 'nc_user'@'%'"
# Make our changes take effect
sudo mysql -e "FLUSH PRIVILEGES"
echo "Finish create database..."
# Settings conf file
sed -i -e 's/#port/port /g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql restart
