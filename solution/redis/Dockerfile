FROM ubuntu:trusty
MAINTAINER http://d2-si.eu

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y update && apt-get -y upgrade

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y install redis-server && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

RUN sed -i "/bind/d" /etc/redis/redis.conf

USER redis

ENTRYPOINT ["/usr/bin/redis-server"]
CMD ["/etc/redis/redis.conf", "--daemonize no"]
