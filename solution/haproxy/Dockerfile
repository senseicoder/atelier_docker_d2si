FROM ubuntu:trusty
MAINTAINER http://d2-si.eu

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get -y update && apt-get -y upgrade

RUN export DEBIAN_FRONTEND=noninteractive && \
        apt-get -y install haproxy && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

ADD haproxy.cfg /etc/haproxy/haproxy.cfg

ENTRYPOINT ["/usr/sbin/haproxy"]
CMD ["-f", "/etc/haproxy/haproxy.cfg"]
