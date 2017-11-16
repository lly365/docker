FROM centos-epel
MAINTAINER ivix <baoyu@ivix.me>
ENV LAST_UPDATE 201711021559
RUN yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-1.noarch.rpm -y && \
	yum install postgresql10 postgresql10-server -y
#VOLUME ["/var/lib/pgsql/10/data"]
RUN chown -R postgres:postgres /var/lib/pgsql/10/data
USER postgres
RUN /usr/pgsql-10/bin/pg_ctl initdb -D /var/lib/pgsql/10/data && \
	sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /var/lib/pgsql/10/data/postgresql.conf && \
	sed -i "s/#port = 5432/port = 5432/" /var/lib/pgsql/10/data/postgresql.conf
RUN echo "CREATE ROLE ivix LOGIN PASSWORD 'ivix.me' SUPERUSER CREATEDB;" > /tmp/ivix.sql
RUN echo 'CREATE DATABASE ivix WITH owner=ivix;' >> /tmp/ivix.sql
RUN /usr/pgsql-10/bin/pg_ctl start -D /var/lib/pgsql/10/data && \
	psql < /tmp/ivix.sql && \
	/usr/pgsql-10/bin/pg_ctl stop -D /var/lib/pgsql/10/data
RUN echo 'host    all             ivix              0.0.0.0/0            md5' >> /var/lib/pgsql/10/data/pg_hba.conf
EXPOSE 5432

ENTRYPOINT ["/usr/pgsql-10/bin/postgres", "-D", "/var/lib/pgsql/10/data/", "-c", "config_file=/var/lib/pgsql/10/data/postgresql.conf"]