#!bin/bash

# Generate SSL

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=FL/L=BOCARATON/O=42/OU=42SV/CN=localhost"
