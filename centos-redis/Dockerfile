FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711161015
RUN groupadd redis && useradd -g redis -s /usr/sbin/nologin redis
RUN yum update -y && \
	yum install -y redis
RUN sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis.conf
#RUN sed -i 's/daemonize no/daemonize yes/' /etc/redis.conf
#protected-mode yes
VOLUME ["/var/lib/redis"]

RUN chown -R redis:redis /var/lib/redis && chmod -R 755 /var/lib/redis

EXPOSE 6379


ENTRYPOINT ["/usr/bin/redis-server", "/etc/redis.conf"]