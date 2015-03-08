#!/bin/sh

initialize_database ()
{
  if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db
  fi
}

create_default_db_user ()
{
  mysql_admin_user=$(mysql -uroot -B -N -e "SELECT user from mysql.user where user = '$USERNAME'")

  if [ -z "$mysql_admin_user" ]; then
    /etc/init.d/mysql start
    sleep 10

    echo "GRANT ALL ON *.* TO $USERNAME@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

    /etc/init.d/mysql stop
  fi
}

start_daemon ()
{
  /usr/bin/mysqld_safe
}


initialize_database
create_default_db_user
start_daemon
