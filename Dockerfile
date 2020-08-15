FROM debian:buster

LABEL maintainer="gkhodizo@student.42.us.org"

RUN apt-get update && apt-get install -y \
	mariadb-server \
	mariadb-client \
	nginx \
	php \
	php-json \
	php-mbstring \
	php-zip \
 	php-gd \
	php-xml \
	php-curl \
	php-mysql \
 && rm -rf /var/lib/apt/lists/*


COPY srcs /root/

WORKDIR /root/

#ENTRYPOINT ["bash", "run_container.sh"]
