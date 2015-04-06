FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ENV RAILS_ENV production
ADD . /myapp
RUN bundle install --without development test
RUN RAILS_ENV=production bundle exec rake assets:precompile
