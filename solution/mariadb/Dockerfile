FROM ubuntu:trusty
MAINTAINER http://d2-si.eu

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y update && apt-get -y upgrade

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y install mariadb-server && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

RUN sed -i "/bind-address/d" /etc/mysql/my.cnf

RUN /usr/bin/mysqld_safe & \
        sleep 5 && \
	echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES" | \
		mysql

ENTRYPOINT ["/usr/bin/mysqld_safe"]
CMD []
