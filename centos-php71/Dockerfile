FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201710281546
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN sed -i '10s/enabled=0/enabled=1/' /etc/yum.repos.d/remi.repo
RUN sed -i '9s/enabled=0/enabled=1/' /etc/yum.repos.d/remi-php71.repo
RUN yum update -y && yum install -y php-cli php-fpm  php-gd php-json php-markdown php-mbstring php-mcrypt php-mysqlnd php-pdo php-xml php-pgsql php-phalcon3 php-pecl-redis php-pecl-imagick
RUN groupadd nginx && useradd -g nginx -s /usr/sbin/nologin nginx
RUN sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.owner = nobody/listen.owner = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.group = nobody/listen.group = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.mode = 0660/listen.mode = 0660/' /etc/php-fpm.d/www.conf
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /etc/php-fpm.d/www.conf
RUN sed -i 's/listen.allowed_clients = 127.0.0.1/;listen.allowed_clients = 127.0.0.1/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;date.timezone =/date.timezone = PRC/' /etc/php.ini
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php.ini
RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini
RUN sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php.ini
RUN sed -i 's/daemonize = yes/daemonize = no/' /etc/php-fpm.conf
RUN chown -R nginx:nginx /var/lib/php/session
VOLUME ["/var/www"]
#RUN firewall-cmd --zone=public --add-port=80/tcp --permanent && firewall-cmd --reload
#ENTRYPOINT ["/usr/sbin/php-fpm"]
ENTRYPOINT ["/usr/sbin/php-fpm", "-c", "/etc/php.ini", "-y", "/etc/php-fpm.conf"]
EXPOSE 9000
