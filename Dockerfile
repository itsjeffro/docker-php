FROM phusion/baseimage:master

CMD ["/sbin/my_init"]

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get -y install nginx sqlite3 \
        openssh-client \
        php8.1-cli \
        php8.1-curl \
        php8.1-fpm \
        php8.1-gd \
        php8.1-mbstring \
        php8.1-mysql \
        php8.1-soap \
        php8.1-xdebug \
        php8.1-xml \
        php8.1-zip \
        php8.1-redis \
        php8.1-bcmath \
        php8.1-sqlite3

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

RUN mkdir -p /var/run/php

# Add nginx
RUN mkdir /etc/service/nginx
ADD services/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# Create directory and add php-fpm service
RUN mkdir /etc/service/phpfpm
ADD services/phpfpm.sh /etc/service/phpfpm/run
RUN chmod +x /etc/service/phpfpm/run

# Terminal environment
ENV TERM=xterm

# Opcache
RUN sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/8.1/fpm/php.ini \
    && sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=192/g' /etc/php/8.1/fpm/php.ini \
    && sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=20000/g' /etc/php/8.1/fpm/php.ini \
    && sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=0/g' /etc/php/8.1/fpm/php.ini \
    && sed -i 's/;opcache.interned_strings_buffer=8/opcache.interned_strings_buffer=16/g' /etc/php/8.1/fpm/php.ini

# Xdebug
COPY ./environment/php/xdebug.ini /etc/php/8.1/fpm/conf.d/xdebug.ini

WORKDIR /var/www/html

EXPOSE 80 443 9000

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
