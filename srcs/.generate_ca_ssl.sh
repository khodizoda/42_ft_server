#!bin/bash

# Generate a SSL
# source: https://deliciousbrains.com/ssl-certificate-authority-for-local-https-development/

# Create a Certificate Authority (CA) 
# Generate a private key for CA
openssl genrsa -des3 -passout pass:gkhodizo42 -out safeServerCA.key 2048

# Generate a root certificate
openssl req -passin pass:gkhodizo42 -x509 -new -nodes -key safeServerCA.key -sha256 -days 1825 -out safeServerCA.pem \
-subj "/C=US/ST=FL/L=BOCARATON/O=42/OU=42SV/CN=localhost"

# Add the Root Certificate to CA certificates
# source: https://askubuntu.com/questions/73287/how-do-i-install-a-root-certificate

# convert PEM file to CRT file for debian
openssl x509 -in safeServerCA.pem -inform PEM -out safeServerCA.crt

mkdir -p /usr/share/ca-certificates/extra
cp safeServerCA.crt /usr/share/ca-certificates/extra/safeServerCA.crt
update-ca-certificates

# Create CA-signed certificate for webserver

# create private key
openssl genrsa -out /etc/ssl/private/nginx-selfsigned.key 2048

# Create a CSR
openssl req -new -key /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=FL/L=BOCARATON/O=42/OU=42SV/CN=localhost"

# Create certificate
echo "create certificate"
openssl x509 -req -in /etc/ssl/certs/nginx-selfsigned.crt -CA safeServerCA.pem -CAkey safeServerCA.key -passin pass:gkhodizo42 -CAcreateserial \
-out /etc/ssl/certs/nginx-selfsigned.crt -days 825 -sha256 -extfile server.ext

