FROM php:8.2-apache

# Habilitar módulos de Apache
RUN a2enmod rewrite headers

# Instalar extensión PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Copiar todo el proyecto
COPY . /var/www/html/

# Configurar DocumentRoot apuntando a /public
RUN echo '<VirtualHost *:80>\n\
    DocumentRoot /var/www/html/public\n\
    <Directory /var/www/html/public>\n\
        AllowOverride All\n\
        Require all granted\n\
        Options -Indexes\n\
    </Directory>\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# Permisos correctos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
