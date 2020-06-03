FROM ruby:2.6.6-alpine3.11

RUN apk add --no-cache git

COPY Gemfile /home

RUN cd /home && bundle install