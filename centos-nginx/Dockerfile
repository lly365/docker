FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201710301024
RUN groupadd nginx && useradd -g nginx -s /usr/sbin/nologin nginx
RUN yum update -y && yum install -y nginx
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.back
COPY conf/nginx.conf /etc/nginx
RUN mkdir /etc/nginx/servers
#COPY conf/000000-default.conf /etc/nginx/servers
COPY conf/php-fpm.conf /etc/nginx/conf.d/
#RUN mkdir -p /var/www/default
#COPY conf/index.php /var/www/default
#RUN  chown -R nginx:nginx /var/www/default && chmod -R 755 /var/www/default
VOLUME ["/etc/nginx/servers/", "/var/www"]
RUN  chown -R nginx:nginx /var/www && chmod -R 755 /var/www
#ENTRYPOINT ["/usr/sbin/php-fpm", "-c", "/etc/php.ini", "-y", "/etc/php-fpm.conf"]
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]