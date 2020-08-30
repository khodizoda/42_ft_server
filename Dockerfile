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

RUN ["bash", "setup.sh"]

ENTRYPOINT ["bash", "services.sh"]

