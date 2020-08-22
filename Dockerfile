FROM debian:buster

LABEL maintainer="gkhodizo@student.42.us.org"

RUN apt-get update && apt-get install -y \
	mariadb-client \
	mariadb-server \
	nginx \
	openssl \
	php \
	php-curl \
	php-fpm \
	php-gd \
	php-json \
	php-mbstring \
	php-mysql \
	php-xml \
	php-zip \
 && rm -rf /var/lib/apt/lists/*


COPY srcs /root/

WORKDIR /root/

#ENTRYPOINT ["bash", "run_container.sh"]
