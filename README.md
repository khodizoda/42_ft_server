# [42_ft_server](https://cdn.intra.42.fr/pdf/pdf/10332/en.subject.pdf)
42_Project: ft_server (new curriculum). The aim of the project is to learn automation, the "docker" technology and use it to install a complete web server. This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

## Usage

build image from the Dockerfile
```terminal
docker build . -t <img_name>
```

run container using built image
```terminal
docker run --name <container_name> -p 80:80 -p 443:443 -d <img_name>
```

enter container's interactive mode
```terminal
docker exec -it <container_name> /bin/bash
```

enable autoindex
```terminal
docker exec -t <cotainer_name> /bin/bash enable_autoindex.sh
```

disable autoindex
```terminal
docker exec -t <cotainer_name> /bin/bash disable_autoindex.sh
```

stop and remove container
```terminal
docker stop <container_name> && docker rm <container_name>
```

remove image
```terminal
docker rmi <image_name>
```

## RESOURCES

### [DOCKER](https://www.docker.com/)
- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Best practices on writing dockerfile](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

### [NGINX](https://nginx.org/en/docs/)
- [Installing NGINX on Debian](https://nginx.org/en/linux_packages.html#Debian)
- [Admin's Guide](https://docs.nginx.com/nginx/admin-guide/)
- [Writing config file](https://docs.nginx.com/nginx/admin-guide/basic-functionality/managing-configuration-files/)
- [NGINX as a web server](https://docs.nginx.com/nginx/admin-guide/web-server/web-server/)
- [Module ngx_http_core_module](https://nginx.org/en/docs/http/ngx_http_core_module.html)

### [MARIADB](https://mariadb.com/)
- [Create user in mariadb](https://mariadb.com/kb/en/create-user/)

### [PHPMYADMIN](https://www.phpmyadmin.net/)
- [FastCGI](https://en.wikipedia.org/wiki/FastCGI)

### SSL
- [Configuring HTTPS servers](https://nginx.org/en/docs/http/configuring_https_servers.html#single_http_https_server)
- [Module ngx_http_ssl_module](https://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_certificate)
- [Redirect http to https](https://linuxize.com/post/redirect-http-to-https-in-nginx/)
- [Generate SSL](https://www.ssl.com/how-to/manually-generate-a-certificate-signing-request-csr-using-openssl/)
- [Certificate Authority](https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/)

### AUTOINDEX
- [Autoindex ON in NGINX](https://nixcp.com/nginx-autoindex/)
- [sed on Linux](https://www.howtogeek.com/666395/how-to-use-the-sed-command-on-linux/)

### LEMP Stack on debian:buster
- [LEMP Stack](https://linuxconfig.org/how-to-set-up-a-lemp-server-on-debian-10-buster)

