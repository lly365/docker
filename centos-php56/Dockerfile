FROM centos-php56-base
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711061627
RUN yum install php-fpm -y
RUN groupadd nginx && useradd -g nginx -s /usr/sbin/nologin nginx
RUN sed -i 's/user = apache/user = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/group = apache/group = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.owner = nobody/listen.owner = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.group = nobody/listen.group = nginx/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.mode = 0660/listen.mode = 0660/' /etc/php-fpm.d/www.conf
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9001/' /etc/php-fpm.d/www.conf
RUN sed -i 's/listen.allowed_clients = 127.0.0.1/;listen.allowed_clients = 127.0.0.1/' /etc/php-fpm.d/www.conf
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php.ini
RUN sed -i 's/daemonize = yes/daemonize = no/' /etc/php-fpm.conf
RUN chown -R nginx:nginx /var/lib/php/session
VOLUME ["/var/www"]
RUN chown -R nginx:nginx /var/www
ENTRYPOINT ["/usr/sbin/php-fpm", "-c", "/etc/php.ini", "-y", "/etc/php-fpm.conf"]
EXPOSE 9001
