#!/bin/bash

echo "Setting up wordpress..."
# sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 80/" "/etc/php/7.3/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

#	downloads and install wordpress essentials
# if [ ! -f /var/www/html/done_diomerda ]; then
	echo "Wordpress: setting up...";
	mkdir -p /var/www/html;
	# curl -k https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /var/temp/wp-cli.phar;
	# chmod +x /var/temp/wp-cli.phar;
	# mv /var/temp/wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/;
	echo "Wordpress: creating users...";
	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL};
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
	touch /var/www/html/done_diomerda
	echo "Wordpress: set up!";
# fi

echo "Done! Returning to wordpress.."

exec "$@"
