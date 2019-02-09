FROM phusion/baseimage:latest

CMD ["/sbin/my_init"]

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get update && apt-get -y install nginx \
	php7.1-cli \
	php7.1-fpm \
	php7.1-mysql \
	php7.1-xml \
	php7.1-mcrypt \
	php7.1-curl \
	php7.1-zip

# Add nginx daemon
RUN mkdir /etc/service/nginx
COPY services/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# Terminal environment
ENV TERM=xterm

WORKDIR /var/www/html

EXPOSE 80 9000

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

