FROM ubuntu:trusty
MAINTAINER http://d2-si.eu

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y update && apt-get -y upgrade

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y install apache2 wget \
		libapache2-mod-php5 php5-gd php5-json \
		php5-mysql php5-curl php5-intl \
		php5-mcrypt php5-imagick php-pear php5-dev && \
	pecl install redis && \
	apt-get --purge remove -y php-pear php5-dev && \
	apt-get --purge autoremove -y && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

RUN wget -O - \
	https://download.owncloud.org/community/owncloud-8.2.3.tar.bz2 | \
	tar xjf - -C /var/www/html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2

ADD config.php /var/www/html/owncloud/config/config.php
ADD owncloud.conf /etc/apache2/sites-enabled/owncloud.conf
ADD docker-test.php /var/www/html/docker-test.php

RUN install -d -o $APACHE_RUN_USER $APACHE_LOCK_DIR && \
	install -d -m 0750 -o $APACHE_RUN_USER /var/www/html/owncloud/data && \
	chmod 0640 /var/www/html/owncloud/config/config.php && \
	chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP /var/www/html/owncloud

RUN sed -i "1s;^;ServerName localhost\n;" /etc/apache2/apache2.conf && \
	echo "extension=redis.so" >/etc/php5/mods-available/redis.ini && \
	php5enmod redis

ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
