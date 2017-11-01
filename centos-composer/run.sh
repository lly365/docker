docker run --name composer -it --link mysql:mysql -v /var/www:/var/www centos-composer
docker start composer
docker attach composer