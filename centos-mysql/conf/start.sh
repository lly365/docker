mysql_install_db --user=mysql --ldata=/var/lib/mysql 
mysqld_safe --user=mysql &
mysqladmin --silent --wait=30 ping || exit 1
mysql -e 'GRANT ALL PRIVILEGES ON *.* TO "root"@"%" WITH GRANT OPTION;FLUSH PRIVILEGES;'
killall mysqld_safe && killall mysqld
sleep 10
mysqld_safe --user=mysql
