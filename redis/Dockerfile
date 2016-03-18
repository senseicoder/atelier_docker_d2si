FROM ubuntu

RUN apt-get update && apt-get install -y redis-server
RUN sed -i '/bind/d' /etc/redis/redis.conf

EXPOSE 6379
VOLUME /var/lib/redis

USER redis
CMD ["/usr/bin/redis-server", "/etc/redis/redis.conf", "--daemonize no"]