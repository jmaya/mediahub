# Dockerfile for a Rails application using Nginx and Unicorn

# Select ubuntu as the base image
FROM ubuntu

# Install nginx, nodejs and curl
RUN apt-get update -q && apt-get install -qy nginx && apt-get install -qy curl && apt-get install -qy gnupg && apt-get install -qy nodejs && apt-get install -qy libpq-dev && echo "daemon off;" >> /etc/nginx/nginx.conf && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && curl -sSL https://get.rvm.io | bash -s stable && /bin/bash -l -c "rvm requirements" && /bin/bash -l -c "rvm install 2.2.0" && /bin/bash -l -c "gem install bundler --no-ri --no-rdoc" 

ADD config/container/nginx-sites.conf /etc/nginx/sites-enabled/default
ADD config/container/start-server.sh /usr/bin/start-server

RUN chmod +x /usr/bin/start-server

# Add rails project to project directory
ADD ./ /rails

# set WORKDIR
WORKDIR /rails

# bundle install
RUN /bin/bash -l -c "bundle install --without development test"

# Publish port 80
EXPOSE 80

# Startup commands
ENTRYPOINT /usr/bin/start-server
