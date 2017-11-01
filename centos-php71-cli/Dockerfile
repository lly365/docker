FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 20171011011038
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN sed -i '10s/enabled=0/enabled=1/' /etc/yum.repos.d/remi.repo
RUN sed -i '9s/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php71.repo
RUN yum update -y && yum install -y php-cli php-gd php-json php-markdown php-mbstring php-mcrypt php-mysqlnd php-pdo php-xml php-pgsql php-phalcon3 php-pecl-redis php-pecl-imagick
RUN sed -i 's/;date.timezone =/date.timezone = PRC/' /etc/php.ini
RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini
RUN sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php.ini
RUN mkdir -p /opt/cacert
COPY files/cacert.pem /opt/cacert
RUN sed -i 's|;curl.cainfo =|curl.cainfo = /opt/cacert/cacert.pem|' /etc/php.ini
RUN yum install -y git
VOLUME ["/var/www"]
