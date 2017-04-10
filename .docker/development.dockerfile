FROM ruby:2.3.4
MAINTAINER pankaj@aviabird.com

# update image
RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for a JS runtime
RUN apt-get install -y nodejs


ENV HOME=/home/app
ENV APP_NAME=angularspree-server
WORKDIR $HOME/$APP_NAME

ADD Gemfile* $HOME/$APP_NAME/

# --- Add this to your Dockerfile ---
ENV BUNDLE_GEMFILE=$HOME/$APP_NAME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install

ADD . $HOME/$APP_NAME
