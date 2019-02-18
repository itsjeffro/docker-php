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
        php7.2-zip

# Add nginx
RUN mkdir /etc/service/nginx
COPY services/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# Add php-fpm
RUN mkdir /etc/service/phpfpm
COPY services/phpfpm.sh /etc/service/phpfpm/run
RUN chmod +x /etc/service/phpfpm/run

# Terminal environment
ENV TERM=xterm

WORKDIR /var/www/html

EXPOSE 80 9000

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
