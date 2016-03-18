# LAB-part-1

## Goal

Install a resilient self-hosted [ownCloud](https://doc.owncloud.org/server/8.2/admin_manual/installation/ "ownCloud Installation Manual) file sync and share server.

## Containers

We will build the following containers based on the **ubuntu:trusty** image
- 1 x cache (redis)
- 1 x db (mariadb)
- 1 x www1 (apache/php/ownCloud)

We will create the following volume containers
- cachedata (used by the redis **cache** container: */var/lib/redis*)
- dbdata (used by the mariadb **db** container: */var/lib/redis*)
- wwwdata (used by the apache **www1** container: */var/www/html/owncloud/data*)

### cache (redis)

- the package is named: **redis-server**
- the daemon is: **/usr/bin/redis-server**
- to listen on all interfaces: remove the **bind** statement in */etc/redis/redis.conf*
- the container should run as the **redis** user

**Tips**

The server should be started as such

    /usr/bin/redis-server /etc/redis/redis.conf --daemonize no

### db (mariadb)

- the package is named: **mariadb-server**
- the daemon is: **/usr/bin/mysqld_safe**
- to listen on all interfaces: set **bind-address = 0.0.0.0** in */etc/mysql/my.cnf*
- */var/run/mysqld* must exist and be owned by the **mysql** user

**Tips**  

Allow MySQL remote **root** user access (with password: **root**)

    RUN /usr/bin/mysqld_safe & \
        sleep 5 && \
        echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | \
            mysql

### www1 (apache)

- the daemon is: **/usr/sbin/apache2** (don't forget it needs to run in the foreground)
- the default document root directory (htdocs) is */var/www/html*
- ownCloud tarball can be downloaded from https://download.owncloud.org/community/owncloud-8.2.3.tar.bz2
- */var/lock/apache* must exist and be owned by the **www-data** user
- the *owncloud* installation directory but be recursively owned by the **www-data** user and group
- the */var/www/html/owncloud/data* directory mode must be set to 0750
- edit *$HOME/docker-test.php* (change **$dbpass** to match the mariadb root password) and copy it into the container under /var/www/html/docker-test.php

**Tips**

List of packages needed to download and run ownCloud with Apache and PHP

    apache2 wget libapache2-mod-php5 php5-gd php5-json php5-mysql php5-curl
    php5-intl php5-mcrypt php5-imagick php-pear php5-dev

Ubuntu PHP redis support is buggy so we need to install the latest one

    $ pecl install redis
    $ echo "extension=redis.so" >/etc/php5/mods-available/redis.ini
    $ php5enmod redis

For proper operation, the following environment variables must be set

    APACHE_RUN_USER=www-data
    APACHE_RUN_GROUP=www-data
    APACHE_PID_FILE=/var/run/apache2.pid
    APACHE_RUN_DIR=/var/run/apache2
    APACHE_LOCK_DIR=/var/lock/apache2
    APACHE_LOG_DIR=/var/log/apache2

This file should be installed as */etc/apache2/sites-enabled/owncloud.conf*  

    <Directory /var/www/html/owncloud/>
      Options +FollowSymlinks
      AllowOverride All

      <IfModule mod_dav.c>
        Dav off
      </IfModule>

      SetEnv HOME /var/www/html/owncloud
      SetEnv HTTP_HOME /var/www/html/owncloud
    </Directory>


This file should be installed as */var/www/html/owncloud/config/config.php* (with mode **0640**)
(this is needed for the next LAB)

    <?php
    $CONFIG = array (
      'memcache.local' => '\OC\Memcache\Redis',
      'redis' => array(
        'host' => 'cache',
        'port' => 6379,
        'timeout' => 0.0,
      ),
    );

## Wrapping things up

- create a Docker network called **data** (which we will put all containers in)
- bind host port 80 to **www1**
- attach the **cachedata** volume to the **cache** container (redis)
- attach the **dbdata** volume to the **db** container (mariadb)
- attach the **wwwdata** volume to the **www1** container (mariadb)

e.g. containers can be started as follow (adapt to your preferences)

    docker network create data

    docker volume create --name cachedata
    docker volume create --name dbdata
    docker volume create --name wwwdata

    docker run -d --name=cache --net data -v cachedata:/var/lib/redis IMAGE_ID
    docker run -d --name=db --net data -v dbdata:/var/lib/mysql IMAGE_ID
    docker run -d --name=www1 --net data -v wwwdata:/var/www/html/owncloud/data -p 80:80 IMAGE_ID

Test the DB connection

    $ curl 1.2.3.4/docker-test.php
    There are 24 tables<br />

Point your web browser to http://1.2.3.4/owncloud and run the post-install steps using these values:
- Database User: **root**
- Database Password: **root** (password set in mariadb/Dockerfile)
- Database Name: **owncloud**
- Database Host: **db** (mariadb container name)
