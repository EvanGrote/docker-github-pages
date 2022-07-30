# FROM starefossen/ruby-node:2-6-alpine
FROM bbdinc/ruby-node-yarn:2.7.4-8.17.0-1.22.4

RUN apt -y install \
    build-essential \
    ruby-dev \
    libc-dev \
    linux-headers-5.10.0-10-common \
    git

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v 1.16.3

RUN bundle install --jobs=4

EXPOSE 4000 80
CMD jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000
