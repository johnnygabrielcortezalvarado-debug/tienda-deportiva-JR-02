#!/bin/sh
# Usar el puerto que Railway asigna
sed -i "s/PORT_PLACEHOLDER/${PORT:-80}/g" /etc/nginx/nginx.conf

# Iniciar PHP-FPM
php-fpm -D

# Iniciar Nginx
nginx -g "daemon off;"
