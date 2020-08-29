#!bin/bash

# SETUP NGINX

# rename default nginx config file
# mv new nginx.config file and rm default config file

service nginx start
mv nginx.conf /etc/nginx/sites-available/localhost
rm  /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

#mv  /etc/nginx/nginx.conf /etc/nginx/nginx.conf.ORIG
#mv nginx.conf /etc/nginx/.
#rm  /etc/nginx/nginx.conf.ORIG

# create a cache directory
mkdir -p /usr/share/nginx/cache/fcgi

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
chmod -R 755 /var/www/html/wordpress/

# SETUP MARIADB

sh init_mariadb.sh

# Generate SSL key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=CA/L=FREMONT/O=42/OU=42SV/CN=localhost"

