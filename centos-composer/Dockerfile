FROM centos-php71-cli
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711011056
RUN curl -o composer-setup.php https://getcomposer.org/installer && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	chmod +x /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
RUN yum install php-pecl-zip -y
RUN groupadd nginx && useradd -g nginx -s /usr/sbin/nologin nginx
RUN chown -R nginx:nginx /var/www
VOLUME ["/var/www"]
WORKDIR /var/www
