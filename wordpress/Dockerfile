FROM wordpress:5.7-apache

COPY ./tools/wordpress_start.sh /var/www/init.sh
#	script start (setup users)
RUN chmod +x /var/www/init.sh
ENTRYPOINT [ "/var/www/init.sh" ]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
