#!/bin/sh

# if [ ! -f /var/lib/mysql/ibdata1 ]; then
  # mysql_install_db

  /etc/init.d/mysql start
  sleep 10

  echo "GRANT ALL ON *.* TO $USERNAME@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

  /etc/init.d/mysql stop
# fi

  echo "FINISH STARTING2" >> /tmp/bla
/usr/bin/mysqld_safe
