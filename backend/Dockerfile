FROM php:8.1-fpm-alpine

RUN apk add --no-cache nginx mysql-client \
    && docker-php-ext-install pdo pdo_mysql

COPY . /var/www/html/
COPY nginx-backend.conf /etc/nginx/http.d/default.conf

RUN chmod +x /var/www/html/docker-entrypoint.sh

EXPOSE 80

CMD ["/var/www/html/docker-entrypoint.sh"]
