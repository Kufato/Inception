# Start from this debain version
FROM debian:bullseye

# Installation of all necessary tools
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install mariadb-server

# Import the configutration file
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-serveur.cnf

# Import script.sh
COPY ./tools/script.sh /script.sh
RUN chmod 755 /script.sh

# Openning port 3306
EXPOSE 3306

# Script execution
ENTRYPOINT [ "bash", "/script.sh" ]

CMD [ "mysqld_safe" ]