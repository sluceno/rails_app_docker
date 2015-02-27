FROM sluceno/ruby-base

RUN apt-get update
RUN apt-get install -y libsqlite3-dev

# Configure nginx for running a rails application
RUN rm /etc/nginx/sites-enabled/default
ADD docker/nginx.conf  /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# Add 'web' user which will run the application
RUN adduser web --home /home/web --shell /bin/bash --disabled-password --gecos ""
RUN echo "source /usr/local/share/chruby/chruby.sh" >> /home/web/.bashrc
RUN echo "source /usr/local/share/chruby/auto.sh" >> /home/web/.bashrc
RUN echo "PATH=$PATH:/opt/rubies/ruby-2.1.2/bin" >> /home/web/.bash_profile

ADD Gemfile      /var/www/
ADD Gemfile.lock /var/www/
RUN chown -R web:web /var/www &&\
  mkdir -p /var/bundle &&\
  chown -R web:web /var/bundle
RUN su -c "cd /var/www && bundle install --deployment --path /var/bundle" -s /bin/bash -l web

ADD . /var/www
RUN chown -R web:web /var/www
