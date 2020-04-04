FROM phusion/baseimage:latest

CMD ["/sbin/my_init"]

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get -y install nginx \
        openssh-client \
        php7.2-cli \
        php7.2-curl \
        php7.2-fpm \
        php7.2-gd \
        php7.2-mbstring \
        php7.2-mysql \
        php7.2-soap \
        php7.2-xdebug \
        php7.2-xml \
        php7.2-zip \
        php7.2-redis \
        php7.2-bcmath

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
RUN sed -i 's/;opcache.enable=1/opcache.enable=1/g' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/;opcache.memory_consumption=128/opcache.memory_consumption=192/g' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/;opcache.max_accelerated_files=10000/opcache.max_accelerated_files=20000/g' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/;opcache.revalidate_freq=2/opcache.revalidate_freq=0/g' /etc/php/7.2/fpm/php.ini \
    && sed -i 's/;opcache.interned_strings_buffer=8/opcache.interned_strings_buffer=16/g' /etc/php/7.2/fpm/php.ini

# Xdebug
RUN echo "xdebug.default_enable=0" >> /etc/php/7.2/fpm/php.ini \
    && echo "xdebug.remote_enable=1" >> /etc/php/7.2/fpm/php.ini \
    && echo "xdebug.remote_autostart=0" >> /etc/php/7.2/fpm/php.ini \
    && echo 'xdebug.remote_connect_back=${XDEBUG_REMOTE_CONNECT_BACK}' >> /etc/php/7.2/fpm/php.ini \
    && echo 'xdebug.remote_host=${XDEBUG_REMOTE_HOST}' >> /etc/php/7.2/fpm/php.ini

WORKDIR /var/www/html

EXPOSE 80 9000

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
