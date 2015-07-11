FROM ruby:2.2.2-slim

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    nodejs \
    postgresql-client \
    imagemagick \
    libpq-dev

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=2

RUN bundle install

ADD . $APP_HOME
CMD ["rails","s"]

