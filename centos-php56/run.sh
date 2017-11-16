docker run --name php71 -d --link mysql:mysql --link postgresql:postgresql -v /var/www:/var/www -p 9000:9000 centos-php71
