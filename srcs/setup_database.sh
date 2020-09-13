#!bin/bash

# SETUP DATABASE
# run mysql_secure_installation script
service mysql start
mysql --user=root <<_EOF_
  UPDATE mysql.user SET Password=PASSWORD('${Q4mBCji4czHf96g}') WHERE User='root';
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
_EOF_

# create database for wordpress
service mysql start
mysql -u root <<_EOF_
 CREATE DATABASE wordpressdb;
 CREATE USER 'admin'@'localhost' IDENTIFIED BY 'gw13xiMQDRm6xNG';
 GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY 'gw13xiMQDRm6xNG';
 FLUSH PRIVILEGES;
_EOF_
