#!/usr/bin/env bash

bundle config set path 'vendor/bundle'
bundle config build.nokogiri --use-system-libraries

if [ ! -e /app/vendor/bundle ]; then
    bundle install
fi

bundle exec ruby app.rb -o 0.0.0.0
