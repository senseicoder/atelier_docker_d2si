FROM ubuntu

RUN apt-get update && apt-get install -y apache2 wget libapache2-mod-php5 php5-gd php5-json php5-mysql php5-curl php5-intl php5-mcrypt php5-imagick php-pear php5-dev
RUN mkdir -p /var/lock/apache && chown www-data:www-data /var/lock/apache
RUN wget https://download.owncloud.org/community/owncloud-8.2.3.tar.bz2 -O /tmp/owncloud-8.2.3.tar.bz2 && \
	tar -xjf /tmp/owncloud-8.2.3.tar.bz2 -C /var/www/html && rm /tmp/owncloud-8.2.3.tar.bz2
RUN chown -R www-data:www-data /var/www/html
RUN mkdir -p /var/www/html/owncloud/data
RUN chmod 0750 /var/www/html/owncloud/data
RUN pecl install redis
RUN echo "extension=redis.so" >/etc/php5/mods-available/redis.ini
RUN php5enmod redis
ADD apache.conf /etc/apache2/sites-enabled/owncloud.conf
ADD conf.php /var/www/html/owncloud/config/config.php
RUN chmod 0640 /var/www/html/owncloud/config/config.php
EXPOSE 80

USER www-data
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]