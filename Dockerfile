FROM php:8.2-fpm-alpine

# Instalar nginx y dependencias
RUN apk add --no-cache nginx

# Instalar extensión PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Configurar Nginx
RUN mkdir -p /run/nginx
COPY docker/nginx.conf /etc/nginx/nginx.conf

# Copiar proyecto
COPY . /var/www/html/

# Permisos
RUN chown -R www-data:www-data /var/www/html

# Script de inicio
COPY docker/start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
