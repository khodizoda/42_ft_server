FROM debian:buster-slim

MAINTAINER gkhodizo@student.42.us.org

RUN apt-get update && apt-get install -y \
	mariadb-server \
	php \
	php-json \
	php-mbstring \
	php-zip \
	php-gd \
	php-xml \
	php-curl \
	php-mysql \
	nginx

CMD ["echo", "Hello World"]
