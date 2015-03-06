FROM        ubuntu:trusty
MAINTAINER  Sergio Luceno <sluceno.a@gmail.com>

# Install needed packages
RUN apt-get update
RUN apt-get install -y \
  mysql-server-5.5 \
  mysql-client-5.5

# Make mysql to listen ips from outside of the container
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD start.sh .
RUN chmod +x start.sh

EXPOSE 3306

CMD ./start.sh
