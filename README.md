# ivix 的 docker

|目录|镜像名称|容器名称|说明|
|----|----|----|----|
|centos-base|centos-base|(无)|centos的基本镜像，基于centos-epel构建, 增加wget、curl、vim|
|centos-epel|centos-epel|(无)|所有镜像的基础镜像，在官方centos镜像的基础上增加epel仓库|
|centos-mysql|centos-mysql|mysql|使用mysql官方YUM源安装的mysql 5.6，开放3306端口，root密码为空。允许挂载数据存储目录|
|centos-nginx|centos-nginx|nginx|使用epel源安装的nginx，开放80端口。需要挂载本地目录到容器的/etc/nginx/servers和/var/www目录|
|centos-php71|centos-php71|php71|使用remi源安装的php 7.1，开放9000端口。需要挂载本地目录到容器的/var/www目录|
|centos-openresty|centos-openresty|openresty|使用openresty官方源安装的openresty，开放8080端口。需要挂载本地目录到容器的/var/www和/usr/local/openresty/nginx/conf/servers目录|

# 构建

请按以下顺序构建这些镜像：

## centos-epel

```bash
cd centos-epel
sudo docker build -t centos-epel .
```

## centos-php71

```bash
cd centos-php71
sudo docker build -t centos-php71 .
```
## centos-mysql

```bash
cd centos-mysql
sudo docker build -t centos-mysql .
```
## centos-nginx

```bash
cd centos-nginx
sudo docker build -t centos-nginx .
```

## centos-openresty

```bash
cd centos-openresty
sudo docker build -t centos-openresty .
```

# 运行

请按以下顺序运行

## centos-mysql

```bash
sudo docker run --name mysql -d -p 3306:3306 -v ~/mysql-data:/var/lib/mysql centos-mysql
```

其中，`~/mysql-data`是挂载到容器里的本地目录，用于存储mysql的数据

## centos-php71

```bash
sudo docker run --name php71 -d --link mysql:mysql -v /var/www:/var/www -p 9000:9000 centos-php71
```

其中，`/var/www`是挂载到容器里的本地目录，用于存放网页文件; `--link mysql:mysql` 指定的是上一步运行centos-mysql的容器名字

## centos-nginx

```bash
sudo docker run --name nginx -d --link php71:php71 -v /var/www:/var/www -v /home/ivix/nginx-servers:/etc/nginx/servers -p 80:80 centos-nginx
```

其中，`/var/www`是挂载到容器里的本地目录，用于存放网页文件；`/home/ivix/nginx-servers`指定的是挂载到容器里的本地目录，用于存放nginx的虚拟主机配置文件；`--link php71:php71`指定的是上一步运行centos-php71的容器的名字

## centos-openresty

```bash
sudo docker run --name openresty -d -p 8080:8080 -v /home/ivix/openresty-servers:/usr/local/openresty/nginx/conf/servers -v /home/ivix/openresty-www:/var/www centos-openresty
```

其中`/home/ivix/openresty-servers`是挂载到容器里的本地目录，用于存放openresty的虚拟主机配置文件；`/home/ivix/openresty-www`是挂载到容器里的本地目录，用于存放openresty的网页文件。
# 注意 

- 在PHP代码里，使用`mysql`（即`--link`指定的名字）来作为mysql连接的主机名，比如：

```php
$db = new mysqli('mysql', 'root', '');
```

- 在nginx里，处理php里转发到 `php71:9000`，该配置已在构建镜像的时候写入 `/etc/nginx/conf.d/php-fpm.conf`里。如果你在运行nginx时，`--link`写的不是`php71`，你需要在构建镜像时，修改`conf/php-fpm.conf`的相关内容

