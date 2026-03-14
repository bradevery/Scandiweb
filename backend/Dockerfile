FROM php:8.1-apache

RUN apt-get update && apt-get install -y default-mysql-client \
    && docker-php-ext-install pdo pdo_mysql \
    && a2enmod rewrite headers

COPY apache.conf /etc/apache2/sites-available/000-default.conf
COPY . /var/www/html/

RUN chmod +x /var/www/html/docker-entrypoint.sh

EXPOSE 80

CMD ["/var/www/html/docker-entrypoint.sh"]
