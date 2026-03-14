FROM php:8.1-apache

RUN apt-get update && apt-get install -y default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql

COPY . /var/www/html/

RUN a2enmod rewrite headers

RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/public|g' /etc/apache2/sites-available/000-default.conf \
    && echo '<Directory /var/www/html/public>\n    AllowOverride All\n</Directory>' >> /etc/apache2/apache2.conf

RUN chmod +x /var/www/html/docker-entrypoint.sh

EXPOSE 80

CMD ["/var/www/html/docker-entrypoint.sh"]
