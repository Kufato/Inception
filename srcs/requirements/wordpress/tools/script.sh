#!bin/bash

# Wait for the launch of mariadb
sleep 10

# Check if Wordpress is already install
if [ -f "/var/www/wordpress/wp-config.php" ]
then
	echo "Wordpress already installed"
else
	# Installation of WP-CLI
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	# Setup of Wordpress
	wp core download --allow-root
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASS --dbhost=mariadb:3306 --skip-check
	wp core install --allow-root --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email
	wp user create --allow-root $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role='contributor'
fi

exec "$@"