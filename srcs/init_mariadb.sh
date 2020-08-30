#!bin/bash

service mysql start
mysql -u root <<_EOF_
 CREATE DATABASE wordpressdb;
 CREATE USER 'admin'@'localhost' IDENTIFIED BY 'gw13xiMQDRm6xNG';
 GRANT ALL PRIVILEGES ON wordpressdb.* TO 'admin'@'localhost' IDENTIFIED BY 'gw13xiMQDRm6xNG';
 FLUSH PRIVILEGES;
_EOF_

