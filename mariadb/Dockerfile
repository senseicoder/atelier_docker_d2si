FROM ubuntu

RUN apt-get update && apt-get install -y mariadb-server

RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
RUN /usr/bin/mysqld_safe & \
    sleep 5 && \
    echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

EXPOSE 3306
VOLUME /var/lib/mysql

USER mysql
CMD ["/usr/bin/mysqld_safe"]