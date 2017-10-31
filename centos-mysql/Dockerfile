FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201710301632
RUN groupadd mysql && useradd -g mysql -s /usr/sbin/nologin mysql
RUN yum install -y http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
RUN yum update -y && yum install mysql-server -y
RUN mv /etc/my.cnf /etc/my.cnf.back
COPY conf/my.cnf /etc/
RUN chown -R mysql:mysql /var/lib/mysql
VOLUME ["/var/lib/mysql"]
RUN yum install  -y psmisc
COPY conf/start.sh /root/start.sh
RUN chmod +x /root/start.sh
EXPOSE  3306
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
