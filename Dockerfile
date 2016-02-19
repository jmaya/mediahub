# FROM jmaya/rails_base
FROM ruby:2.3.0
# FROM rails:4.2.1
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs qt5-default libqt5webkit5-dev && mkdir /myapp && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && mkdir /myapp && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV RAILS_ENV production
ENV PORT 3000
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN /bin/bash -l -c "/usr/local/bin/bundle install --without development test"
ADD . /myapp
WORKDIR /myapp
EXPOSE 3000
RUN bundle exec rake assets:precompile
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
