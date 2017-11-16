FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711160937
COPY files/mongodb-org-3.4.repo  /etc/yum.repos.d/
RUN yum update -y && \
	yum install -y mongodb-org

VOLUME ["/var/mongo"]
RUN sed -i 's/bindIp: 127.0.0.1/#bindIp: 127.0.0.1/' /etc/mongod.conf
EXPOSE 27017
#mongod --port 27017 --dbpath /var/mongo/data --logpath /var/mongo/mongo.log --logappend --bind_ip 0.0.0.0
ENTRYPOINT ["/usr/bin/mongod", "--port", "27017", "--dbpath", "/var/mongo/data", "--logpath", "/var/mongo/mongo.log", "--logappend", "--bind_ip", "0.0.0.0"]