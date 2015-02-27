#!/bin/sh

/etc/init.d/mysql start
echo "GRANT ALL ON *.* TO $USERNAME@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
/etc/init.d/mysql stop

/usr/bin/mysqld_safe
