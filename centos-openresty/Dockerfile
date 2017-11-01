FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711010948
RUN yum install yum-utils -y && \
	yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo -y && \
	yum install openresty -y

RUN groupadd nginx && useradd -g nginx -s /usr/sbin/nologin nginx
RUN mv /usr/local/openresty/nginx/conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf.back
COPY conf/nginx.conf /usr/local/openresty/nginx/conf

VOLUME ["/usr/local/openresty/nginx/conf/servers", "/var/www"]

RUN  chown -R nginx:nginx /var/www && chmod -R 755 /var/www

EXPOSE 8080

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]