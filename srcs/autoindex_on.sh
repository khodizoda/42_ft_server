#!/bin/bash

sed -i "s/autoindex off;/autoindex on;/g" /etc/nginx/sites-available/localhost
service nginx restart
echo "autoindex is on"

