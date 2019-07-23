#!/bin/bash

if [! -f "/etc/ssl/certs/dhparam.pem"]; then
    /usr/bin/openssl dhparam -out /etc/ssl/certs/dhparam.pem 4096
    echo "Generated Diffie-Helmman key"
fi

if [ -f "/usr/sbin/nginx" ]; then
    /usr/sbin/nginx -f "daemon off;"
else
    echo "Somethings up: Can't find nginx"
fi