FROM ruby:2.6.6-alpine

RUN apk update && \
    apk add build-base && \
    apk add bash

RUN apk update &&\
    apk add --update alpine-sdk \
               build-base

RUN apk add chromium

RUN mkdir test
WORKDIR /test
COPY . .
RUN ls
RUN gem install bundler --source http://rubygems.org &&\
    bundle install --gemfile Gemfile

ENV HUB_HOST=hub
ENTRYPOINT ["/bin/sh"]
# docker run -it --network loc_default justinpshields/myapp
