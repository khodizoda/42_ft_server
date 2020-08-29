#!bin/bash

service mysql start
mysql -u root -p <<_EOF_
 CREATE DATABASE ft_server_db;
 CREATE USER 'user42'@'localhost' IDENTIFIED BY 'gkhodizo42';
 GRANT ALL PRIVILEGES ON ft_server_db.* TO 'user42'@'localhost';
 FLUSH PRIVILEGES;
_EOF_

