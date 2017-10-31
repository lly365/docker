# ivix 的 docker

|目录|名称|说明|
|----|----|----|
|centos-base|centos-base|centos的基本镜像，基于centos-epel构建, 增加wget、curl、vim|
|centos-epel|centos-epel|所有镜像的基础镜像，在官方centos镜像的基础上增加epel仓库|
|centos-mysql|centos-mysql|使用mysql官方YUM源安装的mysql 5.6，开放3306端口，root密码为空。允许挂载数据存储目录|
|centos-nginx|centos-nginx|使用epel源安装的nginx，开放80端口。需要挂载本地目录到容器的/etc/nginx/servers和/var/www目录|
|centos-php71|centos-php71|使用remi源安装的php 7.1，开放9000端口。需要挂载本地目录到容器的/var/www目录|

