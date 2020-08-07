FROM debian:buster-slim

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
