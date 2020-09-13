FROM debian:buster

LABEL maintainer="Gulnoza Khodizoda <gkhodizo@student.42.us.org>"

RUN apt-get update && apt-get install -y \
	mariadb-server \
	nginx \
	openssl \
	php-cli \
	php-fpm \
	php-mbstring \
	php-mysql \
	wget \
 && rm -rf /var/lib/apt/lists/*

COPY srcs /root/

WORKDIR /root/

# SETUP NGINX
RUN service nginx start && \
	mv nginx.conf /etc/nginx/sites-available/localhost && \
	rm  /etc/nginx/sites-enabled/default && \
	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost && \
	rm  /var/www/html/index.nginx-debian.html

# SETUP DATABASE
RUN sh setup_database.sh

# SETUP PHPMYADMIN
# Ensure that the directory for php-fpm sockets exists
RUN mkdir -p /run/php-fpm

# Download phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz && \
	tar zxf phpMyAdmin-5.0.2-english.tar.gz && \
	rm phpMyAdmin-5.0.2-english.tar.gz && \
	mv phpMyAdmin-5.0.2-english  /var/www/html/phpmyadmin

# SETUP WORDPRESS
# Download wordpress
RUN wget https://wordpress.org/latest.tar.gz && \
	tar zxf latest.tar.gz && \
	rm latest.tar.gz && \
	mv wordpress /var/www/html/wordpress && \
	mv wp-config.php /var/www/html/wordpress

# Set proper file permissions
RUN chown -R www-data:www-data /var/www/html && \
	find . -type d -exec chmod 755 {} \; && \
	find . -type f -exec chmod 644 {} \;

# GENERATE SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=FL/L=BOCARATON/O=42/OU=42SV/CN=localhost"

EXPOSE 80 443

ENTRYPOINT ["bash", "services.sh"]