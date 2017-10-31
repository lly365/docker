FROM centos:7
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201710281542
RUN yum update -y && yum install epel-release -y && yum -y update
RUN sed -i "s/alias cp='cp -i'/#alias cp='cp -i'/" /root/.bashrc && source /root/.bashrc && cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
