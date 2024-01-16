# Start from this debain version
FROM debian:bullseye

# Installation of all necessary tools
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx openssl

# Creating a folder to retrieve SSL certificates
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /usr/share/nginx/logs

# Give the right to edit the html folder
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Copying nginx.conf file
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Import script.sh
COPY ./tools/script.sh /script.sh
RUN chmod 755 /script.sh

# Opening port 443
EXPOSE 443

# Certificate, key recovery and modification of env var for nginx.conf
ENTRYPOINT [ "bash", "/script.sh" ]

# Launch nginx
CMD [ "nginx" ]