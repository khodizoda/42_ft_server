#!/bin/bash

sed -i "s/autoindex on;/autoindex off;/g" /etc/nginx/sites-available/localhost
service nginx restart
echo "autoindex is disabled"
