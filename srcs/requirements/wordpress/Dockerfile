# Start from this debain version
FROM debian:bullseye

# Installation of all necessary tools
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl php7.4 php-fpm php-mysql mariadb-client

# Import the configutration file
COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create /run/php if it doesn't exist
RUN mkdir /run/php
RUN chmod +x /run/php

# Import script.sh
COPY ./tools/script.sh /script.sh
RUN chmod 755 /script.sh

# Create the path folder
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
WORKDIR	/var/www/wordpress/

# Opening port 9000
EXPOSE 9000

# Run ths script
ENTRYPOINT [ "bash", "/script.sh" ]

# Run php
CMD [ "/usr/sbin/php-fpm7.4", "-F" ]
