FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && mkdir /myapp && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /myapp
ENV RAILS_ENV production
ADD . /myapp
RUN bundle install --without development test
RUN RAILS_ENV=production bundle exec rake assets:precompile
