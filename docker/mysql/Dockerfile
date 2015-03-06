FROM        ubuntu:trusty
MAINTAINER  Sergio Luceno <sluceno.a@gmail.com>

# Install needed packages
RUN apt-get update
RUN apt-get install -y \
  mysql-server-5.5 \
  mysql-client-5.5

# Make mysql to listen ips from outside of the container
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Create an user and a password to connect from outside of the container
#RUN /usr/sbin/mysqld & \
#    sleep 10s &&\
#    echo "GRANT ALL ON *.* TO $USERNAME@'%' IDENTIFIED BY '$PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

ADD run.sh .
RUN chmod +x run.sh

EXPOSE 3306

CMD ./run.sh
