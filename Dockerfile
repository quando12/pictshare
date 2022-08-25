FROM php:7.3-fpm

RUN apt-get update
RUN apt-get install -y \
 libfreetype6-dev \
 libjpeg62-turbo-dev \
 libpng-dev \
 libmcrypt-dev \
 openssl \
 supervisor \
 nginx

RUN docker-php-ext-install -j$(nproc) \
 exif \
 gd \
 json \
 mbstring

COPY ./deploy/web.conf /etc/nginx/site-enable
COPY ./deploy/start.sh /etc/start.sh
COPY ./deploy/supervisor.conf /etc/supervisor/conf.d/

COPY . /var/www/html/
WORKDIR /var/www/html/

#Init code
RUN chmod +x /etc/start.sh

ENTRYPOINT ["/etc/start.sh"]
