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

#ssl
COPY ./pictshare.meey.dev.crt /etc/nginx/pictshare.meey.dev.crt
COPY ./pictshare.meey.dev.key /etc/nginx/pictshare.meey.dev.key

COPY ./deploy/web.conf /etc/nginx/sites-enabled
COPY ./deploy/start.sh /etc/start.sh
COPY ./deploy/supervisor.conf /etc/supervisor/conf.d/

RUN rm /etc/nginx/sites-enabled/default

COPY . /var/www/html/
WORKDIR /var/www/html/

RUN rm -f inc/example.config.inc.php

RUN chmod -R 777 data
RUN chmod -R 777 tmp

RUN ls inc
#RUN ls /etc/nginx/sites-enabled
#RUN cat /etc/nginx/sites-enabled/web.conf
#RUN php -v
#RUN ls /usr/local/sbin/
#RUN ls /etc/php
#RUN ls /etc/php/7.3/fpm/

#Init code
RUN chmod +x /etc/start.sh
EXPOSE 8088
ENTRYPOINT ["/etc/start.sh"]
