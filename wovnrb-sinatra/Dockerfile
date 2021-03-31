ARG RUBY_VERSION
FROM ruby:${RUBY_VERSION:-2.7}-slim

RUN apt-get update -y \
  && apt-get install -y make gcc libxml2-dev libxslt1-dev pkg-config \
  && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY docker-cmd.sh /

CMD /docker-cmd.sh
