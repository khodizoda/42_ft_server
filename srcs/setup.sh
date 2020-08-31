#!bin/bash

# SETUP NGINX
service nginx start
mv nginx.conf /etc/nginx/sites-available/localhost
rm  /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost 
rm  /var/www/html/index.nginx-debian.html

# SETUP DATABASE
# run mysql_secure_installation script
service mysql start
mysql --user=root <<_EOF_
  UPDATE mysql.user SET Password=PASSWORD('${Q4mBCji4czHf96g}') WHERE User='root';
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
_EOF_

# create database for wordpress
sh init_mariadb.sh
rm init_mariadb.sh

# SETUP PHPMYADMIN

# Ensure that the directory for php-fpm sockets exists
mkdir -p /run/php-fpm

# Download phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
tar zxf phpMyAdmin-5.0.2-english.tar.gz
rm phpMyAdmin-5.0.2-english.tar.gz
mv phpMyAdmin-5.0.2-english  /var/www/html/phpmyadmin

# SETUP WORDPRESS

# Download wordpress
wget https://wordpress.org/latest.tar.gz
tar zxf latest.tar.gz
rm latest.tar.gz
mv wordpress /var/www/html/wordpress
mv wp-config.php /var/www/html/wordpress

# Set proper file permissions
chown -R www-data:www-data /var/www/html
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;

# GENERATE SSL
sh generate_ssl.sh
rm generate_ssl.sh

