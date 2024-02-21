FROM ruby:2.7-alpine3.10

RUN apk --update add nodejs netcat-openbsd postgresql-dev
RUN apk --update add --virtual build-dependencies make g++

RUN mkdir /myapp

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler -v '1.17.2'
RUN bundle install
RUN apk del build-dependencies && rm -rf /var/cache/apk/*

ADD . /myapp

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]
