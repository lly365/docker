FROM centos-php71-cli
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711011056
RUN curl -o composer-setup.php https://getcomposer.org/installer && \
	php composer-setup.php && \
	mv composer.phar /usr/local/bin/composer && \
	chmod +x /usr/local/bin/composer